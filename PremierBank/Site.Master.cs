using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PremierBank
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccNum"] == null)
            {
                pnlLogin.Visible = true;
                pnlLogout.Visible = false;
                pnlNavBar.Visible = true;
            }
            else
            {
                pnlLogin.Visible = false;
                pnlLogout.Visible = true;
                pnlNavBar.Visible = false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("Default.aspx");
        }
    }
}