using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PremierBank
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session["Username"] = txtUsername.Text;
            Session["Password"] = txtPassword.Text;
            
            string connStr = ConfigurationManager.ConnectionStrings["PremierBankCS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            string login = "SELECT * FROM Account " +
                        " WHERE Username = @Username AND Password = @Password ";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = login;
            cmd.Parameters.Add(new SqlParameter("Username", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter("Password", Session["Password"].ToString()));
            cmd.Connection = conn;
            try
            {
                int result = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                if(result > 1)
                {
                    conn.Close();
                    Response.Redirect("ViewDetail.aspx");
                }
                else
                {
                    Panel1.Visible = true;
                }
            }
            catch (Exception ex)
            {
                string script = "alert('" + ex.Message.ToString() + "'); window.location.reload();\n";
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", script, true);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}