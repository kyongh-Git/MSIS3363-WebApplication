using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Web_Application_Project
{
    public partial class ShoppingCartPage : System.Web.UI.Page
    {
        private CartItemList cart;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Reset the error message
            errorMSG.Text = "";
            cart = CartItemList.GetCart();

            decimal x = 0.0m;
            for (int i = 0; i < cart.Count; i++)
            {
                x = x + cart[i].Product.UnitPrice;
            }

            lblPriceTotal.Text = x.ToString("0.00");
                    
            if (!IsPostBack)
            {
                this.DisplayCart();

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

        private void DisplayCart()
        {
            lboxCartSummary.Items.Clear();

            for (int i = 0; i < cart.Count; i++)
            {
                lboxCartSummary.Items.Add(cart[i].Display());
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Courses.aspx");
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            //if the cart is empty, block to move to shopping info page
            if (cart.Count == 0)
            {
                errorCheckoutMSG.Text = "The cart is empty.";
            }
            else 
            {
                Session["ShoppingInfo"] = "InProgress";

                if (Session["UserID"] != null)
                {
                    Response.Redirect("~/ShippingInfo.aspx");
                }
                else
                {
                    Response.Redirect("~/LoginPage.aspx");
                }
            } 
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                cart.Clear();
                lboxCartSummary.Items.Clear();
            }

            lblPriceTotal.Text = "0.00";
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                if (lboxCartSummary.SelectedIndex > -1)
                {
                    cart.RemoveAt(lboxCartSummary.SelectedIndex);
                    this.DisplayCart();
                }
                else
                {
                    //Need to make a error message displayer
                    errorMSG.Text = "Please select the item you want to remove.";
                }
            }
            //Calculate subtotal
            decimal x = 0.0m;
            for (int i = 0; i < cart.Count; i++)
            {
                x = x + cart[i].Product.UnitPrice;
            }

            lblPriceTotal.Text = x.ToString("0.00");
        }
    }
}