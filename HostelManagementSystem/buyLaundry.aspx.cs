using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class buyLaundry : System.Web.UI.Page
    {
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCouponNumbers();
            }
            con = new SqlConnection("Data Source=.\\SQLEXPRESS; Integrated Security=True; Initial Catalog=rohitdb");
            SqlCommand cmd = new SqlCommand("SELECT * FROM studentMonthlycouponTable WHERE usertype = @usertype and status='Active'", con);
            cmd.Parameters.AddWithValue("@usertype", username.Text);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    GridView1.DataSource = dr;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }

            // Display only active coupons in GridView2
            SqlCommand cmd2 = new SqlCommand("SELECT * FROM studentMonthlycouponTable WHERE usertype = @usertype and status='Active'", con);
            cmd2.Parameters.AddWithValue("@usertype", username.Text);
            try
            {
                con.Open();
                SqlDataReader dr2 = cmd2.ExecuteReader();
                if (dr2.HasRows)
                {
                    GridView2.DataSource = dr2;
                    GridView2.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }


        protected void BindCouponNumbers()
        {
            con = new SqlConnection("Data Source=.\\SQLEXPRESS; Integrated Security=True; Initial Catalog=rohitdb");
            SqlCommand cmd = new SqlCommand("SELECT couponNumber FROM couponTable", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            ddlCouponNumber.Items.Clear();
            while (dr.Read())
            {
                ddlCouponNumber.Items.Add(dr["couponNumber"].ToString());
            }

            dr.Close();
            con.Close();
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS; Integrated Security=True; Initial Catalog=rohitdb"))
            {
                try
                {
                    con.Open();

                    // Check if the coupon is active
                    SqlCommand checkCmd = new SqlCommand("SELECT status FROM couponTable WHERE couponNumber = @couponNumber", con);
                    checkCmd.Parameters.AddWithValue("@couponNumber", ddlCouponNumber.SelectedItem.Text);
                    string status = checkCmd.ExecuteScalar()?.ToString() ?? "";

                    if (status.Equals("Active", StringComparison.OrdinalIgnoreCase))
                    {
                        // Insert the record into the buycouponTable
                        SqlCommand cmd = new SqlCommand("INSERT INTO buycouponTable (studentemail, couponNumber, rs, buyDate) VALUES (@studentEmail, @couponNumber, @rs, @buyDate)", con);
                        cmd.Parameters.AddWithValue("@studentEmail", username.Text);
                        cmd.Parameters.AddWithValue("@couponNumber", ddlCouponNumber.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@rs", priceLabel.Text);
                        cmd.Parameters.AddWithValue("@buyDate", TextBox1.Text);
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Update the status in the couponTable
                            SqlCommand cmd1 = new SqlCommand("UPDATE couponTable SET status = 'Disabled' WHERE couponNumber = @couponNumber", con);
                            cmd1.Parameters.AddWithValue("@couponNumber", ddlCouponNumber.SelectedItem.Text);
                            int rowsUpdated = cmd1.ExecuteNonQuery();

                            if (rowsUpdated > 0)
                            {
                                // Insertion and status update successful
                                // You can add any additional logic or display a success message
                                Response.Write("<script>alert('Record inserted and status updated successfully.');</script>");
                                Response.Redirect("buyLaundry.aspx");
                            }
                            else
                            {
                                // Status update failed
                                // You can add any additional logic or display an error message
                                Response.Write("<script>alert('Status update failed.');</script>");
                            }
                        }
                        else
                        {
                            // Insertion failed
                            // You can add any additional logic or display an error message
                            Response.Write("<script>alert('Insertion failed.');</script>");
                        }
                    }
                    else
                    {
                        // Coupon is not valid (not active)
                        // You can add any additional logic or display a message here
                        Response.Write("<script>alert('The coupon is not valid.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    // Handle any exceptions that occur during the insertion process
                    Response.Write(ex.Message);
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}
