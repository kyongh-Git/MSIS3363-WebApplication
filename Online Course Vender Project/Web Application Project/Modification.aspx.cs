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
    public partial class Modification : System.Web.UI.Page
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
                    tboxFirstName.Text = currentuser.FirstName.ToString();
                    tboxLastName.Text = currentuser.LastName.ToString();
                    tboxPhone.Text = currentuser.PhoneNumber.ToString();
                    tboxAccountRecoveryEmail.Text = currentuser.RecoveryEmail.ToString();
                    tboxAddress1.Text = currentuser.Address1.ToString();
                    tboxAddress2.Text = currentuser.Address2.ToString();
                    tboxCity.Text = currentuser.City.ToString();
                    tboxZip.Text = currentuser.Zipcode.ToString().Replace(" ", "");
                    tboxEmail.Text = currentuser.Username.ToString();
                    //tboxEmail.Text = currentuser.UserID.ToString();

                    ddlState.SelectedValue = currentuser.StateID.ToString();
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

        protected void btnUpdate_Click(object sender, EventArgs e)
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
                    SqlParameter ModUserName = new SqlParameter("@Username", tboxEmail.Text);
                    ModUserName.Direction = ParameterDirection.Input;
                    ModUserName.DbType = DbType.String;
                    sqlDA.SelectCommand.Parameters.Add(ModUserName);
                    //parameter password
                    SqlParameter ModPassword = new SqlParameter("@UserPassword", tboxCrPassword.Text);
                    ModPassword.Direction = ParameterDirection.Input;
                    ModPassword.DbType = DbType.String;
                    sqlDA.SelectCommand.Parameters.Add(ModPassword);

                    DataSet ds = new DataSet();
                    sqlDA.Fill(ds);

                    // if the given credential is correct
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        SqlDataAdapter sqlDAUpdate = new SqlDataAdapter("spUpdateUser", sqlConn);
                        sqlDAUpdate.SelectCommand.CommandType = CommandType.StoredProcedure;

                        SqlParameter UserID = new SqlParameter("@UserID", Session["UserID"].ToString());
                        UserID.Direction = ParameterDirection.Input;
                        UserID.DbType = DbType.String;
                        sqlDAUpdate.SelectCommand.Parameters.Add(UserID);

                        SqlParameter UserPassword;
                        if (!tboxPassword.Text.Equals(""))
                        {
                            UserPassword = new SqlParameter("@UserPassword", tboxPassword.Text);
                        }
                        else
                        {
                            UserPassword = new SqlParameter("@UserPassword", tboxCrPassword.Text);
                        }
                        UserPassword.Direction = ParameterDirection.Input;
                        UserPassword.DbType = DbType.String;
                        sqlDAUpdate.SelectCommand.Parameters.Add(UserPassword);

                        SqlParameter FirstName = new SqlParameter("@FirstName", tboxFirstName.Text);
                        FirstName.Direction = ParameterDirection.Input;
                        FirstName.DbType = DbType.String;
                        sqlDAUpdate.SelectCommand.Parameters.Add(FirstName);

                        SqlParameter LastName = new SqlParameter("@LastName", tboxLastName.Text);
                        LastName.Direction = ParameterDirection.Input;
                        LastName.DbType = DbType.String;
                        sqlDAUpdate.SelectCommand.Parameters.Add(LastName);

                        SqlParameter Address1 = new SqlParameter("@Address1", tboxAddress1.Text);
                        Address1.Direction = ParameterDirection.Input;
                        Address1.DbType = DbType.String;
                        sqlDAUpdate.SelectCommand.Parameters.Add(Address1);

                        SqlParameter Address2 = new SqlParameter("@Address2", tboxAddress2.Text);
                        Address2.Direction = ParameterDirection.Input;
                        Address2.DbType = DbType.String;
                        sqlDAUpdate.SelectCommand.Parameters.Add(Address2);

                        SqlParameter City = new SqlParameter("@City", tboxCity.Text);
                        City.Direction = ParameterDirection.Input;
                        City.DbType = DbType.String;
                        sqlDAUpdate.SelectCommand.Parameters.Add(City);

                        SqlParameter StateID = new SqlParameter("@StateID", ddlState.Text);
                        StateID.Direction = ParameterDirection.Input;
                        StateID.DbType = DbType.String;
                        sqlDAUpdate.SelectCommand.Parameters.Add(StateID);

                        SqlParameter Zipcode = new SqlParameter("@Zipcode", tboxZip.Text);
                        Zipcode.Direction = ParameterDirection.Input;
                        Zipcode.DbType = DbType.String;
                        sqlDAUpdate.SelectCommand.Parameters.Add(Zipcode);

                        SqlParameter PhoneNumber = new SqlParameter("@PhoneNumber", tboxPhone.Text);
                        PhoneNumber.Direction = ParameterDirection.Input;
                        PhoneNumber.DbType = DbType.String;
                        sqlDAUpdate.SelectCommand.Parameters.Add(PhoneNumber);

                        SqlParameter RecoveryEmail = new SqlParameter("@RecoveryEmail", tboxAccountRecoveryEmail.Text);
                        RecoveryEmail.Direction = ParameterDirection.Input;
                        RecoveryEmail.DbType = DbType.String;
                        sqlDAUpdate.SelectCommand.Parameters.Add(RecoveryEmail);

                        DataSet dss = new DataSet();
                        sqlDAUpdate.Fill(dss);

                        User currentuser = (User)Session["CurrentUser"];

                        User updateuser = new User();
                        updateuser.UserID = currentuser.UserID;
                        Session["UserID"] = updateuser.UserID;
                        updateuser.Username = currentuser.Username;
                        updateuser.FirstName = tboxFirstName.Text;
                        updateuser.LastName = tboxLastName.Text;
                        updateuser.Address1 = tboxAddress1.Text;
                        updateuser.Address2 = tboxAddress2.Text;
                        updateuser.City = tboxCity.Text;
                        updateuser.StateID = Convert.ToInt32(ddlState.SelectedValue);
                        Session["StateID"] = updateuser.StateID;
                        updateuser.Zipcode = tboxZip.Text;
                        updateuser.PhoneNumber = tboxPhone.Text;
                        updateuser.RecoveryEmail = tboxAccountRecoveryEmail.Text;
                        updateuser.UserPassword = "";

                        if (!tboxPassword.Text.Equals(""))
                        {
                            updateuser.UserPassword = tboxPassword.Text;
                        }
                        else
                        {
                            updateuser.UserPassword = tboxCrPassword.Text;
                        }

                        Session["CurrentUser"] = updateuser;

                        Response.Redirect("~/Homepage.aspx");

                    }
                    //wrong credential
                    else
                    {
                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('The current password does not match.');", true);
                    }
                }
            }
        }
    }
}