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
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //reset error message
            ErrorMSG.Text = "";
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
            //Clear all sessions
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Homepage.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                //dbconnection
                string strConn = ConfigurationManager.ConnectionStrings["F20_kskyonghConnectionString"].ToString();

                using (SqlConnection sqlConn = new SqlConnection(strConn))
                {
                    //procedure credential
                    SqlDataAdapter sqlDA = new SqlDataAdapter("spSelectUserByCredentials", sqlConn);
                    sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;
                    //parameter userEmail
                    SqlParameter LoginUserName = new SqlParameter("@Username", tboxID.Text);
                    LoginUserName.Direction = ParameterDirection.Input;
                    LoginUserName.DbType = DbType.String;
                    sqlDA.SelectCommand.Parameters.Add(LoginUserName);
                    //parameter password
                    SqlParameter LoginPassword = new SqlParameter("@UserPassword", tboxPass.Text);
                    LoginPassword.Direction = ParameterDirection.Input;
                    LoginPassword.DbType = DbType.String;
                    sqlDA.SelectCommand.Parameters.Add(LoginPassword);

                    DataSet ds = new DataSet();
                    sqlDA.Fill(ds);
                    // if the given credential is correct
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        User currentuser = new User();

                        currentuser.UserID = Convert.ToInt32(ds.Tables[0].Rows[0]["UserID"]);
                        Session["UserID"] = Convert.ToInt32(ds.Tables[0].Rows[0]["UserID"]);
                        currentuser.Username = ds.Tables[0].Rows[0]["UserEmail"].ToString();
                        currentuser.FirstName = ds.Tables[0].Rows[0]["FirstName"].ToString();
                        currentuser.LastName = ds.Tables[0].Rows[0]["LastName"].ToString();
                        currentuser.Address1 = ds.Tables[0].Rows[0]["Address1"].ToString();
                        currentuser.Address2 = ds.Tables[0].Rows[0]["Address2"].ToString();
                        currentuser.City = ds.Tables[0].Rows[0]["City"].ToString();
                        currentuser.StateID = Convert.ToInt32(ds.Tables[0].Rows[0]["StateID"]);
                        Session["StateID"] = Convert.ToInt32(ds.Tables[0].Rows[0]["StateID"]);
                        currentuser.Zipcode = ds.Tables[0].Rows[0]["Zipcode"].ToString();
                        currentuser.UserPassword = ds.Tables[0].Rows[0]["UserPassword"].ToString();
                        currentuser.PhoneNumber = ds.Tables[0].Rows[0]["PhoneNumber"].ToString();
                        currentuser.RecoveryEmail = ds.Tables[0].Rows[0]["RecoveryEmail"].ToString();

                        //tboxFirstName.Text = ds.Tables[0].Rows[0]["Firstname"].ToString();


                        Session["CurrentUser"] = currentuser;

                        if (Session["ShoppingInfo"] != null)
                        {
                            Response.Redirect("~/ShippingInfo.aspx");
                        }
                        else //go to modification page
                        {
                            Response.Redirect("~/Homepage.aspx");
                        }

                        
                    }
                    //wrong credential
                    else
                    {
                        ErrorMSG.Text = "Username and password combination does not exist.";
                    }
                }
            }
        }
    }
}