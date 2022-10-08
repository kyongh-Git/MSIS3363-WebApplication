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
    public partial class SignupPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // first display state OK
                ddlState.SelectedValue = "36";

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
            //Clear Session
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Homepage.aspx");
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string strConn = ConfigurationManager.ConnectionStrings["F20_kskyonghConnectionString"].ToString();

                using (SqlConnection sqlConn = new SqlConnection(strConn))
                {
                    SqlDataAdapter sqlDA = new SqlDataAdapter("spSelectUserByUserEmail", sqlConn);
                    sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;

                    SqlParameter LoginUserName = new SqlParameter("@Username", tboxEmail.Text);
                    LoginUserName.Direction = ParameterDirection.Input;
                    LoginUserName.DbType = DbType.String;
                    sqlDA.SelectCommand.Parameters.Add(LoginUserName);

                    DataSet ds = new DataSet();
                    sqlDA.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        //If the user email is already taken, refuse the acception
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('That User ID is taken. Try another');", true);
                    }
                    else if (ds.Tables[0].Rows.Count == 0)
                    {
                        //tbTest.Text = ds.Tables[0].Rows[0]["UserID"].ToString();

                        //if the email is not taken, start insert procedure query
                        SqlDataAdapter sqlDAInsert = new SqlDataAdapter("spInsertUser", sqlConn);
                        sqlDAInsert.SelectCommand.CommandType = CommandType.StoredProcedure;

                        SqlParameter UserEmail = new SqlParameter("@UserEmail", tboxEmail.Text);
                        UserEmail.Direction = ParameterDirection.Input;
                        UserEmail.DbType = DbType.String;
                        sqlDAInsert.SelectCommand.Parameters.Add(UserEmail);

                        SqlParameter UserPassword = new SqlParameter("@UserPassword", tboxPassword.Text);
                        UserPassword.Direction = ParameterDirection.Input;
                        UserPassword.DbType = DbType.String;
                        sqlDAInsert.SelectCommand.Parameters.Add(UserPassword);

                        SqlParameter FirstName = new SqlParameter("@FirstName", tboxFirstName.Text);
                        FirstName.Direction = ParameterDirection.Input;
                        FirstName.DbType = DbType.String;
                        sqlDAInsert.SelectCommand.Parameters.Add(FirstName);

                        SqlParameter LastName = new SqlParameter("@LastName", tboxLastName.Text);
                        LastName.Direction = ParameterDirection.Input;
                        LastName.DbType = DbType.String;
                        sqlDAInsert.SelectCommand.Parameters.Add(LastName);

                        SqlParameter Address1 = new SqlParameter("@Address1", tboxAddress1.Text);
                        Address1.Direction = ParameterDirection.Input;
                        Address1.DbType = DbType.String;
                        sqlDAInsert.SelectCommand.Parameters.Add(Address1);

                        SqlParameter Address2 = new SqlParameter("@Address2", tboxAddress2.Text);
                        Address2.Direction = ParameterDirection.Input;
                        Address2.DbType = DbType.String;
                        sqlDAInsert.SelectCommand.Parameters.Add(Address2);

                        SqlParameter City = new SqlParameter("@City", tboxCity.Text);
                        City.Direction = ParameterDirection.Input;
                        City.DbType = DbType.String;
                        sqlDAInsert.SelectCommand.Parameters.Add(City);

                        SqlParameter StateID = new SqlParameter("@StateID", ddlState.Text);
                        StateID.Direction = ParameterDirection.Input;
                        StateID.DbType = DbType.String;
                        sqlDAInsert.SelectCommand.Parameters.Add(StateID);

                        SqlParameter Zipcode = new SqlParameter("@Zipcode", tboxZip.Text);
                        Zipcode.Direction = ParameterDirection.Input;
                        Zipcode.DbType = DbType.String;
                        sqlDAInsert.SelectCommand.Parameters.Add(Zipcode);

                        SqlParameter PhoneNumber = new SqlParameter("@PhoneNumber", tboxPhone.Text);
                        PhoneNumber.Direction = ParameterDirection.Input;
                        PhoneNumber.DbType = DbType.String;
                        sqlDAInsert.SelectCommand.Parameters.Add(PhoneNumber);

                        SqlParameter RecoveryEmail = new SqlParameter("@RecoveryEmail", tboxAccountRecoveryEmail.Text);
                        RecoveryEmail.Direction = ParameterDirection.Input;
                        RecoveryEmail.DbType = DbType.String;
                        sqlDAInsert.SelectCommand.Parameters.Add(RecoveryEmail);

                        DataSet dss = new DataSet();
                        sqlDAInsert.Fill(dss);

                        //try
                        //{
                        //    sqlConn.co
                        //    lblmessage.text = "account created successfully please log";
                        //mviewAccount.ActiveViewIndex = 0;
                        //}
                        //catch (SqlException myexc)
                        //{
                        //    if (myexc.Number == 2601)
                        //    {
                        //        lblmessagecreate.text = "this username already exisits. please enter a "
                        //    }
                        //    else
                        //    {
                        //        lblmessagecreate.Text = myexc.Message;
                        //    }
                        //}
                        Response.Redirect("~/LoginPage.aspx");
                    }
                }
            }
        }
    }
}