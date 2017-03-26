using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                txtAccNo.Text = Session["AccNum"].ToString();
               
            }
        }
    }
}