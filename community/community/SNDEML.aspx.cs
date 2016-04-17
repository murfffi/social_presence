using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace community
{
    public partial class SNDEML : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        SendEmail mailer = new SendEmail();
        EmailInfo eMail = new EmailInfo();
        Sender sender = new Sender();

       

        protected void btnSend_Click(object control, EventArgs e)
        {         
            sender.Email = "test@test.com";
            sender.Name = "Evelina";

            eMail.Subject = "Test";
            eMail.Body = "This is test!!!!";
            eMail.ToAddress = "evelina.nozhcheva@gmail.com";//"kspassov@gmail.com"; //"evelina.nozhcheva@gmail.com";
            mailer.SendMail(sender, eMail);
            Literal1.Text = "Email was sent successfully!";
            Literal1.Visible = true;
        }
    }
}