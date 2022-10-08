using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Application_Project
{
    public partial class Homepage : System.Web.UI.Page
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
            Response.Redirect("~/Homepage.aspx");
        }
    }
}