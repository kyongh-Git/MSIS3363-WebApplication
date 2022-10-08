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
    public partial class ShippingInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if user log in, fill the blank in
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    User currentuser = (User)Session["CurrentUser"];

                    tboxFirstName.Text = currentuser.FirstName.ToString();
                    tboxLastName.Text = currentuser.LastName.ToString();
                    tboxAddress1.Text = currentuser.Address1.ToString();
                    tboxAddress2.Text = currentuser.Address2.ToString();
                    tboxCity.Text = currentuser.City.ToString();
                    ddlState.SelectedValue = currentuser.StateID.ToString();
                    tboxZipcode.Text = currentuser.Zipcode.ToString().Replace(" ", "");

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
            //Clear all sessions
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Homepage.aspx");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            //DB conncetion
            string strConn = ConfigurationManager.ConnectionStrings["F20_kskyonghConnectionString"].ToString();

            using (SqlConnection sqlConn = new SqlConnection(strConn))
            {
                ////procedure inserorder
                SqlCommand InsertCmd = new SqlCommand("spInsertOrder", sqlConn);
                InsertCmd.CommandType = CommandType.StoredProcedure;

                InsertCmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                InsertCmd.Parameters.AddWithValue("@BillingFirstName", tboxFirstName.Text);
                InsertCmd.Parameters.AddWithValue("@BillingLastName", tboxLastName.Text);
                InsertCmd.Parameters.AddWithValue("@BillingAddress1", tboxAddress1.Text);
                InsertCmd.Parameters.AddWithValue("@BillingAddress2", tboxAddress2.Text);
                InsertCmd.Parameters.AddWithValue("@BillingCity", tboxCity.Text);
                InsertCmd.Parameters.AddWithValue("@BillingStateID", ddlState.SelectedValue);
                InsertCmd.Parameters.AddWithValue("@BillingZipcode", tboxZipcode.Text);
                InsertCmd.Parameters.AddWithValue("@PaymentMethod", ddlPaymethod.SelectedValue);
                InsertCmd.Parameters.AddWithValue("@OrderDate", System.DateTime.Now.ToString("MM/dd/yyyy HH:mm"));

                SqlParameter OHIDOutput = new SqlParameter("@OrderHeaderID", SqlDbType.Int);
                OHIDOutput.Direction = ParameterDirection.Output;
                OHIDOutput.DbType = DbType.Int32;
                InsertCmd.Parameters.Add(OHIDOutput);
                

                InsertCmd.Parameters.Add("@OrderedItems", SqlDbType.Structured).Value = GetCartItemsData();

                try
                {
                    sqlConn.Open();
                    InsertCmd.ExecuteNonQuery();

                    Session["OrderHeaderID"] = OHIDOutput.Value.ToString();
                    // go to thank you page 
                    Response.Redirect("~/ThankyouPage.aspx");
                    //in thank you page display order ID
                }
                catch (Exception E)
                {
                    //display error message
                    errorMSG.Text = E.Message;
                }
            }
        }

        //datatable
        private DataTable GetCartItemsData()
        {
            CartItemList cart = CartItemList.GetCart();

            DataTable dt = new DataTable();
            dt.Columns.Add("ProductID", typeof(int));
            dt.Columns.Add("ProductName", typeof(string));
            dt.Columns.Add("UnitPrice", typeof(decimal));

            for (int i = 0; i < cart.Count; i++)
            {
                dt.Rows.Add(cart[i].Product.ProductID, cart[i].Product.ProductName, cart[i].Product.UnitPrice);
            }

            return dt;
        }
    }
}