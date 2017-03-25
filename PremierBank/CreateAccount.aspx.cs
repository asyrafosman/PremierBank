using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PremierBank
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session["Name"] = txtName.Text;
            Session["IC"] = txtIC.Text;
            Session["Gender"] = rblGender.SelectedItem;
            Session["Race"] = rblRace.SelectedItem;
            Session["Address"] = txtAddress.Text;
            Session["State"] = ddlState.SelectedItem;
            Session["Poscode"] = txtPoscode.Text;
            Session["Phone"] = txtPhone.Text;
            Session["Email"] = txtEmail.Text;
            Session["AccType"] = rblAccount.SelectedValue;
            Response.Redirect("RegisterOnline.aspx");
        }
    }
}