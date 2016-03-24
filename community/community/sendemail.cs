using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Net.Mail;
using System.Configuration;


public class SendEmail
{
    public void SendMail(Sender info, EmailInfo email)
    {
        //string smtpAddress =  System.Net.Configuration.co .AppSettings["smtp.server"];
        MailAddress fromAddress;
        if (string.IsNullOrEmpty(info.Email) && string.IsNullOrEmpty(info.Name))
        {
            fromAddress = new MailAddress("noreplay@microfocus.com", "Not Available");
        }
        else if (string.IsNullOrEmpty(info.Email))
        {
            fromAddress = new MailAddress("noreplay@microfocus.com", info.Name);
        }
        else if (string.IsNullOrEmpty(info.Name))
        {
            fromAddress = new MailAddress(info.Email, "Not Available");
        }
        else
        {
            fromAddress = new MailAddress(info.Email, info.Name);
        }

        MailAddress toAddress = new MailAddress(email.ToAddress, "Micro Focus");
        MailMessage msg = new MailMessage(fromAddress, toAddress);
        msg.Subject = email.Subject;
        msg.IsBodyHtml = false;
        msg.Body = email.Body;

        // Send the message
        SmtpClient client = new SmtpClient();
        client.Send(msg);
    }

    public void SendMail(Sender info, EmailInfo email, bool bodyAsHTML)
    {
       // string smtpAddress = ConfigurationSettings.AppSettings["smtp.server"];
        MailAddress fromAddress;
        if (string.IsNullOrEmpty(info.Email) && string.IsNullOrEmpty(info.Name))
        {
            fromAddress = new MailAddress("noreplay@microfocus.com", "Not Available");
        }
        else if (string.IsNullOrEmpty(info.Email))
        {
            fromAddress = new MailAddress("noreplay@microfocus.com", info.Name);
        }
        else if (string.IsNullOrEmpty(info.Name))
        {
            fromAddress = new MailAddress(info.Email, "Not Available");
        }
        else
        {
            fromAddress = new MailAddress(info.Email, info.Name);
        }

        MailAddress toAddress = new MailAddress(email.ToAddress, "Micro Focus");
        MailMessage msg = new MailMessage(fromAddress, toAddress);
        msg.Subject = email.Subject;
        msg.IsBodyHtml = bodyAsHTML;
        msg.Body = email.Body;

        // Send the message
        //SmtpClient client = new SmtpClient(smtpAddress);
        SmtpClient client = new SmtpClient();
        client.Send(msg);
    }

    public void SendThankyouMail(Sender info, EmailInfo email)
    {
        //string smtpAddress = ConfigurationSettings.AppSettings["smtp.server"];
        MailAddress fromAddress = new MailAddress(email.ToAddress, "Micro Focus");
        MailAddress toAddress;// = new MailAddress(info.Email, info.Name);
        if (string.IsNullOrEmpty(info.Email) && string.IsNullOrEmpty(info.Name))
        {
            toAddress = new MailAddress("notavailable@noreplay.com", "Not Available");
        }
        else if (string.IsNullOrEmpty(info.Email))
        {
            toAddress = new MailAddress("notavailable@noreplay.com", info.Name);
        }
        else if (string.IsNullOrEmpty(info.Name))
        {
            toAddress = new MailAddress(info.Email, "Not Available");
        }
        else
        {
            toAddress = new MailAddress(info.Email, info.Name);
        }
        MailMessage msg = new MailMessage(fromAddress, toAddress);
        msg.Subject = email.Subject;
        msg.IsBodyHtml = false;
        msg.Body = email.Body;

        // Send the message
        //SmtpClient client = new SmtpClient(smtpAddress);
        SmtpClient client = new SmtpClient();
        client.Send(msg);
    }

    public SendEmail()
	{
	}
}

public class EmailInfo
{
    private string toAddress;

    public string ToAddress
    {
        get { return toAddress; }
        set { toAddress = value; }
    }

    private string subject;

    public string Subject
    {
        get { return subject; }
        set { subject = value; }
    }

    private string body;

    public string Body
    {
        get { return body; }
        set { body = value; }
    }



    public EmailInfo()
    {
    }
}


public class Sender
{
    protected string name;

    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    protected string email;

    public string Email
    {
        get { return email; }
        set { email = value; }
    }

    public Sender()
    {
    }
}