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
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("Default.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["PremierBankCS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            string login = "SELECT * FROM Account " +
                        " WHERE Username = @Username AND Password = @Password ";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = login;
            cmd.Parameters.Add(new SqlParameter("Username", txtUsername.Text));
            cmd.Parameters.Add(new SqlParameter("Password", txtPassword.Text));
            cmd.Connection = conn;

            SqlDataReader drUser;
            drUser = cmd.ExecuteReader();
            drUser.Read();

            try
            {
                if (drUser.HasRows)
                {
                    Session["AccNum"] = drUser["AccNum"].ToString();
                    Session["AccTypeId"] = drUser["AccTypeId"].ToString();
                    Session["CustIc"] = drUser["CustIc"].ToString();
                    Session["AccBalance"] = drUser["AccBalance"].ToString();
                    Session["Username"] = drUser["Username"].ToString();
                    Session["Password"] = drUser["Password"].ToString();
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