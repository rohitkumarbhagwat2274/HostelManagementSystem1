using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace HostelManagementSystem
{
    public partial class forgot : Page
    {
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection("Data Source=.\\SQLEXPRESS; Integrated Security=True; Initial Catalog=rohitdb");
            con.Open();
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("stu_emp_dashbord.aspx");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtuser.Text;
                string userType = list.Text;
                bool isRecordUpdated = false;

                switch (userType)
                {
                    case "Employee":
                        cmd = new SqlCommand("UPDATE employee SET pass=@pass WHERE email=@email", con);
                        cmd.Parameters.AddWithValue("@pass", txtpwd.Text);
                        cmd.Parameters.AddWithValue("@email", email);
                        isRecordUpdated = cmd.ExecuteNonQuery() > 0;
                       
                        break;
                    case "Student":
                        cmd = new SqlCommand("UPDATE student1 SET pass=@pass WHERE email=@email", con);
                        cmd.Parameters.AddWithValue("@pass", txtpwd.Text);
                        cmd.Parameters.AddWithValue("@email", email);
                        isRecordUpdated = cmd.ExecuteNonQuery() > 0;
                        
                        break;
                    case "User":
                        cmd = new SqlCommand("UPDATE login SET pass=@pass WHERE email=@email", con);
                        cmd.Parameters.AddWithValue("@pass", txtpwd.Text);
                        cmd.Parameters.AddWithValue("@email", email);
                        isRecordUpdated = cmd.ExecuteNonQuery() > 0;
                        
                        break;
                    default:
                        Label1.Text = "Invalid User";
                        Label1.Visible=true;
                        break;
                }

                if (isRecordUpdated)
                {
                    Label1.Text = "Record Updated!";
                    Label1.Visible = true;
                }
                else
                {
                    Label1.Text = "Invalid user";
                    Label1.Visible = true;
                }
            }
            catch (Exception ex)
            {
               Label1.Text = "Error: " + ex.Message;
               Label1.Visible = true;
            }
            finally
            {
                con.Close();
            }

            // Redirect to the "forgot.aspx" page after the operation
            Response.Redirect("forgot.aspx");
        }
    }
}
