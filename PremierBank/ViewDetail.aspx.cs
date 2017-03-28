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
    public partial class ViewDetail : System.Web.UI.Page
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
                lblAmount.Text = string.Format("RM{0:F2}", balance);

                string connStr = ConfigurationManager.ConnectionStrings["PremierBankCS"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();

                string getName = "SELECT CustName FROM Customer WHERE CustIc = @CustIc";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = getName;
                cmd.Parameters.Add(new SqlParameter("CustIc", Session["CustIc"]));
                cmd.Connection = conn;

                SqlDataReader drUser;
                drUser = cmd.ExecuteReader();
                drUser.Read();

                lblName.Text = drUser["CustName"].ToString();
                lblAccNum.Text = Session["AccNum"].ToString();
                lblAccType.Text = Session["AccTypeId"].ToString();
                conn.Close();
            }
        }
    }
}