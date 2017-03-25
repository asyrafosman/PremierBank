using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PremierBank
{
    public partial class TransferMoney : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblAmount.Text = string.Format("{0:#,#.##}", Session["Amount"]);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("TransferMoney.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            float amount = float.Parse(Session["Amount"].ToString());
            amount -= float.Parse(txtAmount.Text);
            Session["Amount"] = amount;
            Response.Redirect("TransferMoney.aspx");
        }
    }
}