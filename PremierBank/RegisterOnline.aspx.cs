using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace PremierBank
{
    public partial class RegisterOnline : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IC"] == null)
            {
                Session.Clear();
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string accNum = null;
            if (Session["AccType"].ToString() == "1")
            {
                accNum = "100" + Session["IC"].ToString();
            }
            if (Session["AccType"].ToString() == "2")
            {
                accNum = "200" + Session["IC"].ToString();
            }
            if (Session["AccType"].ToString() == "3")
            {
                accNum = "300" + Session["IC"].ToString();
            }
            if (Session["AccType"].ToString() == "4")
            {
                accNum = "400" + Session["IC"].ToString();
            }
            if (Session["AccType"].ToString() == "5")
            {
                accNum = "500" + Session["IC"].ToString();
            }
            if (Session["AccType"].ToString() == "6")
            {
                accNum = "600" + Session["IC"].ToString();
            }

            if (Page.IsValid)
            {
                string connStr = ConfigurationManager.ConnectionStrings["PremierBankCS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                try
                {
                    string insert = "INSERT INTO Customer " +
                        " (CustName, CustIc, CustGender, CustRace, CustAddress, CustPoscode, CustState, CustPhone, CustEmail) " +
                        " Values(@CustName, @CustIc, @CustGender, @CustRace, @CustAddress, @CustPoscode, @CustState, @CustPhone, @CustEmail)";
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = insert;
                    cmd.Parameters.Add(new SqlParameter("CustName", Session["Name"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("CustIc", Session["IC"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("CustGender", Session["Gender"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("CustRace", Session["Race"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("CustAddress", Session["Address"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("CustPoscode", Session["Poscode"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("CustState", Session["State"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("CustPhone", Session["Phone"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("CustEmail", Session["Email"].ToString()));
                    cmd.Connection = conn;
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();

                    insert = "INSERT INTO Account " +
                        " (AccNum, AccTypeId, CustIc, AccBalance, Username, Password) " +
                        " Values(@AccNum, @AccTypeId, @CustIc, @AccBalance, @Username, @Password) ";
                    cmd.CommandText = insert;
                    cmd.Parameters.Add(new SqlParameter("AccNum", accNum));
                    cmd.Parameters.Add(new SqlParameter("AccTypeId", Session["AccType"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("CustIc", Session["IC"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("AccBalance", 50000));
                    cmd.Parameters.Add(new SqlParameter("Username", txtUsername.Text));
                    cmd.Parameters.Add(new SqlParameter("Password", txtPassword.Text));
                    cmd.Connection = conn;
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();

                    insert = "INSERT INTO Trans " +
                            " (AccNum, TxTime, TxAmount, TxBalance, TxDescription) " +
                            " Values(@AccNum, @TxTime, @TxAmount, @TxBalance, @TxDescription) ";
                    cmd.CommandText = insert;
                    cmd.Parameters.Add(new SqlParameter("AccNum", accNum));
                    cmd.Parameters.Add(new SqlParameter("TxTime", Convert.ToDateTime(DateTime.Now)));
                    cmd.Parameters.Add(new SqlParameter("TxAmount", 50000));
                    cmd.Parameters.Add(new SqlParameter("TxBalance", 50000));
                    cmd.Parameters.Add(new SqlParameter("TxDescription", "Create new account"));
                    cmd.Connection = conn;
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();

                    string script = "alert('Your New Account Created.\n'); window.location.reload();\n";
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", script, true);
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
            Response.Redirect("Login.aspx");
        }
    }
}