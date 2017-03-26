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
    public partial class DepositMoney : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccNum"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                double balance = Convert.ToDouble(Session["AccBalance"].ToString());
                balance /= 100;
                lblAmount.Text = string.Format("{0:#,#.##}", balance);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            double amount = Convert.ToDouble(txtAmount.Text);
            amount *= 100;

            double balance = Convert.ToDouble(Session["AccBalance"].ToString());
            balance += amount;
            Session["AccBalance"] = balance;

            string connStr = ConfigurationManager.ConnectionStrings["PremierBankCS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            string insert = "INSERT INTO Trans " +
                            " (AccNum, TxTime, TxAmount, TxBalance, TxDescription) " +
                            " Values(@AccNum, @TxTime, @TxAmount, @TxBalance, @TxDescription) ";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = insert;
            cmd.Parameters.Add(new SqlParameter("AccNum", Session["AccNum"]));
            cmd.Parameters.Add(new SqlParameter("TxTime", Convert.ToDateTime(DateTime.Now.ToLongDateString())));
            cmd.Parameters.Add(new SqlParameter("TxAmount", amount));
            cmd.Parameters.Add(new SqlParameter("TxBalance", balance));
            cmd.Parameters.Add(new SqlParameter("TxDescription", "Deposit money"));
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();

            string update = "UPDATE Account SET AccBalance = @AccBalance WHERE AccNum = @AccNum";
            cmd.CommandText = update;
            cmd.Parameters.Add(new SqlParameter("AccBalance", balance));
            cmd.Parameters.Add(new SqlParameter("AccNum", Session["AccNum"]));
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();

            conn.Close();
            Response.Redirect("DepositMoney.aspx");
        }
    }
}