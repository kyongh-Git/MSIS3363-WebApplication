using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace Web_Application_Project
{
    public partial class ContactUsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    User currentuser = (User)Session["CurrentUser"];
                    loginbtn.Visible = false;
                    signupbtn.Visible = false;
                    lbluserid.Text = "Welcome " + currentuser.FirstName;
                    userid.Visible = true;
                    signoutbtn.Visible = true;
                }
                else if (Session["CurrentUser"] == null)
                {
                    loginbtn.Visible = true;
                    signupbtn.Visible = true;
                    userid.Visible = false;
                    signoutbtn.Visible = false;
                }
            }
        }
        protected void lbtnsignout_Click(object sender, EventArgs e)
        {
            //Clear sessions
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/ContactUsPage.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string firstname = tboxFirstName.Text;
            string lastname = tboxLastName.Text;
            string fromEmail = tboxEmail.Text;
            string phone = tboxPhone.Text;
            string message = tboxMSG.Text;
            string toEmail = "kyongh@okstate.edu";
            string toProfessor = "kim.strom@okstate.edu";

            MailAddress fromAddress = new MailAddress("yjckimdyd@gmail.com");
            MailAddress toAddress = new MailAddress(toEmail);
            MailAddress toUserAddress = new MailAddress(fromEmail);
            MailAddress toProfessorAddress = new MailAddress(toProfessor);

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("yjckimdyd@gmail.com", "Skrpai54#$");

            //Email to codera team
            MailMessage messageContents = new MailMessage(fromAddress, toAddress);

            messageContents.Subject = "Inquiry from " + tboxFirstName.Text + " " + tboxLastName.Text;
            messageContents.Body = "<p>First Name: " + tboxFirstName.Text + ", Last Name: " + tboxLastName.Text + "<br>Email: " + tboxEmail.Text + ", Phone Number: " + tboxPhone.Text + "</p><p>" + tboxMSG.Text + "</p>";

            messageContents.IsBodyHtml = true;

            smtp.Send(messageContents);

            // Email to user (The input email from cotact us page will be used to send a message)
            MailMessage messageContentToUser = new MailMessage(fromAddress, toUserAddress);

            messageContentToUser.Subject = "You have receached to Team CODERA.";
            messageContentToUser.Body = "<p>This is a notification email that you have contacted our team.<br>Our representative will soon try to reach out to you.<br><br>Best,</p>";

            messageContentToUser.IsBodyHtml = true;

            smtp.Send(messageContentToUser);

            // Email to professor
            MailMessage messageContentToPro = new MailMessage(fromAddress, toProfessorAddress);

            messageContentToPro.Subject = "You have receached to Team CODERA.";
            messageContentToPro.Body = "<p>This is a notification email that you have contacted our team.<br>Our representative will soon try to reach out to you.<br>Thank you for the semester.<br><br>Best,</p>";

            messageContentToPro.IsBodyHtml = true;

            smtp.Send(messageContentToPro);

            //reset contact us texts
            tboxFirstName.Text = "";
            tboxLastName.Text = "";
            tboxEmail.Text = "";
            tboxPhone.Text = "";
            tboxMSG.Text = "";

            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Thank you for your message. It has been successfully sent. Someone will contact you soon.');", true);
            //lblmessage.Text = "Thank you for your message. It has been successfully sent. Someone will contact you soon";
        }
    }
}