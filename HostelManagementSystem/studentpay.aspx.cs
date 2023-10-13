using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace HostelManagementSystem
{
    public partial class studentpay : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;

       protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=rohitdb;Integrated Security=True");
            con.Open();
            HttpCookie c = Request.Cookies["mycookie"];
            if (c != null)
            {
                txtemail.Text = c["Username"];
            }
        }

        protected void btnadd_Click1(object sender, EventArgs e)
        {
            string sname = txtsname.Text;
            string email = txtemail.Text;
            DateTime paydate = DateTime.Parse(txtpdate.Text);
            float amount = float.Parse(txtrs.Text);
            string transaction_id = txttransid.Text;

            string query = "INSERT INTO studentPay (sname, email, paydate, amount, transaction_id) VALUES (@sname, @email, @paydate, @amount, @transaction_id)";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@sname", sname);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@paydate", paydate);
            cmd.Parameters.AddWithValue("@amount", amount);
            cmd.Parameters.AddWithValue("@transaction_id", transaction_id);

            cmd.ExecuteNonQuery();
            Response.Write("Record successfully added!");

            // Clear the input fields
            txtsname.Text = "";
            txtemail.Text = "";
            txtpdate.Text = "";
            txtrs.Text = "";
            txttransid.Text = "";
        }
        protected void btnback_Click1(object sender, EventArgs e)
        {
        Response.Redirect("dashboard.aspx");
        }

        protected void btndis_Click(object sender, EventArgs e)
        {
         Response.Redirect("spaydisplay.aspx");
        }

       

       
        }
    }
}
