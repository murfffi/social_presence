using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace community
{
    /// <summary>
    /// Summary description for LoginService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class LoginService : System.Web.Services.WebService
    {

        [WebMethod(EnableSession=true)]
        public void DoLogin(string name, string email)
        {
            if (email == (string) Session["Email"])
            {
                return;
            }
            Session["Admin"] = null;
            Session["Email"] = email;
            Social_PresenceEntities model = new Social_PresenceEntities();
            Contributor c = new Contributor();
            c.name = name;
            c.email = email;
            Contributor contr = HasSuchEmail(model, c);
            if (contr == null)
            {
                model.Contributors.Add(c);
                model.SaveChanges();
            }
            else
            {
                if (contr.admin)
                {
                    Session["Admin"] = true;
                }
            }
        }

        private static Contributor HasSuchEmail(Social_PresenceEntities model, Contributor c)
        {
            foreach (Contributor contr in model.Contributors)
            {
                if (contr.email == c.email)
                {
                    return contr;
                }
            }
            return null;
        }
    }
}
