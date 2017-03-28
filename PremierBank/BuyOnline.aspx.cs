using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace PremierBank
{
    public partial class BuyOnline : System.Web.UI.Page
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
                txtAccNo.Text = Session["AccNum"].ToString();
               
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            double amount = Convert.ToDouble(ddlamount.SelectedValue);
            amount *= 100;

            double balance = Convert.ToDouble(Session["AccBalance"].ToString());
            balance -= amount;
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
            cmd.Parameters.Add(new SqlParameter("TxTime", Convert.ToDateTime(DateTime.Now)));
            cmd.Parameters.Add(new SqlParameter("TxAmount", 0 - amount));
            cmd.Parameters.Add(new SqlParameter("TxBalance", balance));
            cmd.Parameters.Add(new SqlParameter("TxDescription", "Purchase RM"+ (amount/100) +" Topup on " + ddlservice.SelectedItem + " provider"));
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

            Response.Redirect("BuyOnline.aspx");
        }
    }
}