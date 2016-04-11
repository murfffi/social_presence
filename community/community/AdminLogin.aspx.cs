using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace community
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Session["Admin"] = true;
            Session["Email"] = "admin@test.com";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Admin"] = null;
            Session["Email"] = "nonadmin@test.com";
        }
    }
}