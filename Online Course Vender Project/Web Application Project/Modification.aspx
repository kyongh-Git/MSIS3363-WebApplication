<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modification.aspx.cs" Inherits="Web_Application_Project.Modification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Modification Page</title>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/homepageStyle.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
        <%--log in page--%>
        <div class="container-fluid remove-mg-pd">
            <%--Top Navigation--%>
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark justify-content-center">
                <a class="navbar-brand" href="Homepage.aspx">
                    <img src="images/coderalogohalf.png" class="d-block mx-auto" alt="logo" />
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="collapsibleNavbar">
                    <ul class="navbar-nav fontSize font-weight-light">
                        <li class="nav-item mx-5">
                            <a class="nav-link" href="Courses.aspx">Courses</a>
                        </li>
                        <li class="nav-item mx-5">
                            <a class="nav-link" href="ContactUsPage.aspx">Contact</a>
                        </li>
                        <li class="nav-item mx-5">
                            <a class="nav-link" href="AboutUsPage.aspx">About</a>
                        </li>
                        <li class="nav-item mx-5 navbar-expand">
                            <a class="nav-link" href="ShoppingCartPage.aspx">
                                <img src="images/cart.png" alt="cart" />
                            </a>
                        </li>
                        <asp:Panel ID="loginbtn" runat="server">
                            <li class="nav-item mx-5">
                                <a class="nav-link" href="LoginPage.aspx">Log In</a>
                            </li>
                        </asp:Panel>
                        <asp:Panel ID="signupbtn" runat="server">
                            <li class="nav-item mx-5">
                                <a class="nav-link" href="SignupPage.aspx">Sign Up</a>
                            </li>
                        </asp:Panel>
                        <asp:Panel ID="userid" runat="server">
                            <li class="nav-item dropdown mx-5">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <asp:Label ID="lbluserid" runat="server" ForeColor="#999999">
                                    </asp:Label>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="Modification.aspx">Edit your profile</a>
                                </div>
                            </li>
                        </asp:Panel>
                        <asp:Panel ID="signoutbtn" runat="server">
                            <li class="nav-item mx-5">
                                <asp:LinkButton ID="lbtnsignout" runat="server" OnClick="lbtnsignout_Click" CssClass="nav-link" CausesValidation="False">Sign Out</asp:LinkButton>
                            </li>
                        </asp:Panel>
                    </ul>
                </div>
            </nav>
            <%--modification page--%>
            <div class="row justify-content-center">
                <%--signup image--%>
                <div class="col-sm-10 col-md-6">
                    <div class="row">
                        <div class="col-sm-12">
                            <img src="images/signup.jpg" alt="signuppic" class="img-fluid signupIMG" />
                        </div>
                    </div>
                </div>
                <div class="col-8 col-sm-8 col-md-6">
                    <div class="row">
                        <div class="col-sm-12 text-center">
                            <h2 class="signuphd">Edit your information</h2>
                        </div>
                    </div>
                    <%--Email Fixed--%>
                    <%--blocked cannot modify--%>
                    <div class="row justify-content-center mt-2 mr-2">
                        <div class="col-sm-12 ">
                            <label class="fontup">
                                Email (User ID)
                            </label>
                        </div>
                    </div>
                    <div class="row justify-content-center mr-2">
                        <div class="col-sm-12">
                            <asp:TextBox ID="tboxEmail" runat="server" class="form-control" Height="40px" Enabled="False"></asp:TextBox>
                        </div>
                    </div>

                    <%--First Name, Last Name--%>
                    <%--required--%>
                    <div class="row justify-content-center mt-2 mr-2">
                        <div class="col-5 col-sm-6">
                            <label class="fontup">
                                First Name
                            </label>
                        </div>
                        <div class="col-5 col-sm-6">
                            <label class="fontup">
                                Last Name
                            </label>
                        </div>
                    </div>
                    <div class="row justify-content-center mr-2">
                        <div class="col-5 col-sm-6 ">
                            <asp:TextBox ID="tboxFirstName" runat="server" class="form-control" Height="40px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="First Name is required" ControlToValidate="tboxFirstName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-5 col-sm-6">
                            <asp:TextBox ID="tboxLastName" runat="server" class="form-control" Height="40px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Last Name is required" ControlToValidate="tboxLastName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <%--Email (Unique User ID), Password(8-25)--%>
                    <%--current password is required, but the new password is optional--%>
                    <div class="row justify-content-center mt-2 mr-2">
                        <div class="col-5 col-sm-6 ">
                            <label class="fontup">
                                Current Password
                            </label>
                        </div>
                        <div class="col-5 col-sm-6 ">
                            <label class="fontup">
                                New Password
                            </label>
                        </div>
                    </div>
                    <div class="row justify-content-center mr-2">
                        <div class="col-5 col-sm-6">
                            <asp:TextBox ID="tboxCrPassword" runat="server" class="form-control" Height="40px" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Current Password is required" ControlToValidate="tboxCrPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please give a password between 8 to 25" ValidationExpression="^([a-zA-Z0-9]){8,25}$" Display="Dynamic" ControlToValidate="tboxCrPassword" ForeColor="Red"></asp:RegularExpressionValidator>
                            <%--<asp:RangeValidator ID="rvPassword" runat="server" ErrorMessage="Please give a password between 8 to 25" MaximumValue="8" MinimumValue="25" ControlToValidate="tboxPassword" Display="Dynamic"></asp:RangeValidator>--%>
                        </div>
                        <div class="col-5 col-sm-6">
                            <asp:TextBox ID="tboxPassword" runat="server" class="form-control" Height="40px" TextMode="Password"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="tboxPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                            <asp:RegularExpressionValidator ID="rgvPassword" runat="server" ErrorMessage="Please give a password between 8 to 25" ValidationExpression="^([a-zA-Z0-9]){8,25}$" Display="Static" ControlToValidate="tboxPassword" ForeColor="Red"></asp:RegularExpressionValidator>
                            <%--<asp:RangeValidator ID="rvPassword" runat="server" ErrorMessage="Please give a password between 8 to 25" MaximumValue="8" MinimumValue="25" ControlToValidate="tboxPassword" Display="Dynamic"></asp:RangeValidator>--%>
                        </div>
                    </div>
                    <%--PhoneNumber(including hyphen), Recovery Email--%>
                    <div class="row justify-content-left mt-2 mr-2">
                        <div class="col-5 col-sm-6 ">
                            <label class="fontup">
                                Phone Number
                            </label>
                        </div>
                        <div class="col-5 col-sm-6 ">
                            <label class="recoveryfontup">
                                Account recovery email
                            </label>
                        </div>
                    </div>
                    <div class="row justify-content-left mr-2">
                        <div class="col-5 col-sm-6">
                            <asp:TextBox ID="tboxPhone" runat="server" class="form-control" Height="40px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="Phone number is required" ControlToValidate="tboxPhone" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rgvPhone" runat="server" ErrorMessage="Invalid phone number" ControlToValidate="tboxPhone" Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-5 col-sm-6">
                            <asp:TextBox ID="tboxAccountRecoveryEmail" runat="server" class="form-control" Height="40px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvREmail" runat="server" ErrorMessage="Recovery Email is required" ControlToValidate="tboxAccountRecoveryEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rgvREmail" runat="server" ErrorMessage="Invalid email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tboxAccountRecoveryEmail" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <%--Address1, Address2(Not required)--%>
                    <div class="row justify-content-left mt-2 mr-2">
                        <div class="col-sm-6 ">
                            <label class="fontup">
                                Address 1
                            </label>
                        </div>
                    </div>
                    <div class="row justify-content-center mr-2">
                        <div class="col-sm-12">
                            <asp:TextBox ID="tboxAddress1" runat="server" class="form-control" Height="40px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" ErrorMessage="Address1 is required" ControlToValidate="tboxAddress1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row justify-content-left mt-2 mr-2">
                        <div class="col-sm-6 ">
                            <label class="fontup">
                                Address 2
                            </label>
                        </div>
                    </div>
                    <div class="row justify-content-center mr-2">
                        <div class="col-sm-12">
                            <asp:TextBox ID="tboxAddress2" runat="server" class="form-control" Height="40px"></asp:TextBox>
                        </div>
                    </div>
                    <%--City, State(Abbreviation list from DB)--%>
                    <div class="row justify-content-center mt-2 mr-2">
                        <div class="col-5 col-sm-6 ">
                            <label class="fontup">
                                City
                            </label>
                        </div>
                        <div class="col-5 col-sm-6 ">
                            <label class="fontup">
                                State
                            </label>
                        </div>
                    </div>
                    <div class="row justify-content-center mr-2">
                        <div class="col-5 col-sm-6">
                            <asp:TextBox ID="tboxCity" runat="server" class="form-control" Height="40px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City is required" ControlToValidate="tboxCity" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-5 col-sm-6">
                            <asp:DropDownList ID="ddlState" runat="server" class="form-control" Height="40px" Width="200px" Font-Size="Small" DataSourceID="sdsStateSource" DataTextField="StateAbbr" DataValueField="StateID">
                                <asp:ListItem Value="1">Select State</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsStateSource" runat="server" ConnectionString="<%$ ConnectionStrings:F20_kskyonghConnectionState %>" SelectCommand="SELECT * FROM [StateMaster]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="State is required" ControlToValidate="ddlState" Display="Dynamic" InitialValue="1" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <%--Zipcode--%>
                    <div class="row justify-content-left mt-2 mr-2">
                        <div class="col-sm-6 ">
                            <label class="fontup">
                                Zip
                            </label>
                        </div>
                    </div>
                    <div class="row justify-content-left mr-2">
                        <div class="col-sm-6">
                            <asp:TextBox ID="tboxZip" runat="server" class="form-control" Height="40px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvZIP" runat="server" ErrorMessage="ZIP Code is required" ControlToValidate="tboxZip" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rgvZIP" runat="server" ErrorMessage="Invalid ZIP code" ControlToValidate="tboxZip" Display="Dynamic" ValidationExpression="\d{5}(-\d{4})?" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <%--<div class="row justify-content-left mr-2">
                        <div class="col-sm-6">
                            <asp:TextBox ID="tbTest" runat="server" class="form-control" Height="40px"></asp:TextBox>
                        </div>
                    </div>--%>
                    <%--Sign up button - submit filled data in DB--%>
                    <div class="row mt-5">
                        <div class="col-lg-12 text-center">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary btn-lg" OnClick="btnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

