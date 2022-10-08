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
    public partial class Courses : System.Web.UI.Page
    {
        private Product selectedProduct;
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
            //clear all sessoins
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Homepage.aspx");
        }

        protected void btnAddQuantity1_Click(object sender, EventArgs e)
        {
            //Java
            selectedProduct = this.GetSelectedProduct(Convert.ToInt32(hidProductID1.Value));

            if (IsValid)
            {
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[selectedProduct.ProductID];

                if (cartItem == null)
                {
                    cart.AddItem(selectedProduct);
                }
            }
            Response.Redirect("~/ShoppingCartPage.aspx");
        }

        protected void btnAddQuantity2_Click(object sender, EventArgs e)
        {
            //C#
            selectedProduct = this.GetSelectedProduct(Convert.ToInt32(hidProductID2.Value));

            if (IsValid)
            {
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[selectedProduct.ProductID];

                if (cartItem == null)
                {
                    cart.AddItem(selectedProduct);
                }
            }
            Response.Redirect("~/ShoppingCartPage.aspx");
        }

        protected void btnAddQuantity3_Click(object sender, EventArgs e)
        {
            //Python
            selectedProduct = this.GetSelectedProduct(Convert.ToInt32(hidProductID3.Value));

            if (IsValid)
            {
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[selectedProduct.ProductID];

                if (cartItem == null)
                {
                    cart.AddItem(selectedProduct);
                }
            }
            Response.Redirect("~/ShoppingCartPage.aspx");
        }

        protected void btnAddQuantity4_Click(object sender, EventArgs e)
        {
            //Database
            selectedProduct = this.GetSelectedProduct(Convert.ToInt32(hidProductID4.Value));

            if (IsValid)
            {
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[selectedProduct.ProductID];

                if (cartItem == null)
                {
                    cart.AddItem(selectedProduct);
                }
            }
            Response.Redirect("~/ShoppingCartPage.aspx");
        }

        private Product GetSelectedProduct(int pdtID)
        {
            //connecting to db
            string strConn = ConfigurationManager.ConnectionStrings["F20_kskyonghConnectionString"].ConnectionString;
            using (SqlConnection sqlconn = new SqlConnection(strConn))
            {
                SqlDataAdapter sqlDA = new SqlDataAdapter("spSelectProductByID", sqlconn);
                sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;

                SqlParameter ProductIDInput = new SqlParameter("@ProductID", pdtID);
                ProductIDInput.Direction = ParameterDirection.Input;
                ProductIDInput.DbType = DbType.Int32;
                sqlDA.SelectCommand.Parameters.Add(ProductIDInput);

                DataSet ds = new DataSet();

                sqlDA.Fill(ds);

                //fill query into product object
                Product p = new Product();
                p.ProductID = ds.Tables[0].Rows[0]["ProductID"].ToString();
                p.ProductName = ds.Tables[0].Rows[0]["ProductName"].ToString();
                p.UnitPrice = Decimal.Parse(ds.Tables[0].Rows[0]["UnitPrice"].ToString());
                return p;
            }
            
        }
    }
}