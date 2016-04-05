using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace community
{
    public partial class SendEmailToUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SendEmail mailer = new SendEmail();
        EmailInfo eMail = new EmailInfo();
        Sender sender = new Sender();
        
        sender.Email = "test@test.com";
        sender.Name = "Evelina";

        eMail.Subject = "Test";
        eMail.Body = "This is test!!!!";
        eMail.ToAddress = "evelina.nozhcheva@gmail.com";

        protected void btnSend_Click(object sender, EventArgs e)
        {
            mailer.SendMail(sender, eMail);
        }
    }
}