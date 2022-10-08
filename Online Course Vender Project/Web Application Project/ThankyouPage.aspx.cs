using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Application_Project
{
    public partial class ThankyouPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OrderID.Text = "Thank you for your order. Your order number is " + Session["OrderHeaderID"].ToString() + ".";

                CartItemList cart = CartItemList.GetCart();
                cart.Clear();
                //flag off
                Session["ShoppingInfo"] = null;
                //empty the cart and turn off the flag

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
            //clear all sessions
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Homepage.aspx");
        }

        protected void btnMainPage_Click(object sender, EventArgs e)
        {
            //go back to mainpage
            Response.Redirect("~/HomePage.aspx");
        }
    }
}