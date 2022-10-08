<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Web_Application_Project.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Log In</title>
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
                                <asp:LinkButton ID="lbtnsignout" runat="server" OnClick="lbtnsignout_Click" CssClass="nav-link">Sign Out</asp:LinkButton>
                            </li>
                        </asp:Panel>
                    </ul>
                </div>
            </nav>
            <div class="row">
                <div class="col-lg-12 text-center mb-3">
                    <h1 class="mainhd">Log in to Codera</h1>
                </div>
            </div>
            <%--Error message--%>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <asp:Label ID="ErrorMSG" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-lg-12 text-center mb-3">
                    <asp:Label ID="lbSuccess" runat="server" Text="" CssClass="text-warning"></asp:Label>
                </div>
            </div>
            <div class="row justify-content-center mt-2">
                <div class="col-sm-6 ">
                    <label class="fontLabelUP">
                        User Email
                    </label>
                </div>
            </div>
           <%-- ID text box
            required--%>
            <div class="row justify-content-center">
                <div class="col-sm-6">
                    <asp:TextBox ID="tboxID" runat="server" AutoPostBack="False" class="form-control" Height="60px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Please enter the user email" ControlToValidate="tboxID" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row justify-content-center mt-2">
                <div class="col-sm-6">
                    <label class="fontLabelUP">
                        Password
                    </label>
                </div>
            </div>
            <%--password
            required
            password hidden--%>
            <div class="row justify-content-center">
                <div class="col-sm-6">
                    <asp:TextBox ID="tboxPass" runat="server" AutoPostBack="False" class="form-control" Height="60px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPass" runat="server" ErrorMessage="Please enter the password" ControlToValidate="tboxPass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <%--if not the user not signed up send to sign up page--%>
            <div class="row justify-content-center mt-1">
                <a href="SignUpPage.aspx" type="button">I don't have my account yet</a>
            </div>
            <div class="row text-center mt-1">
                <div class="col-sm-12">
                    <%--login button--%>
                    <asp:Button ID="btnLogin" runat="server" Text="Log in" OnClick="btnLogin_Click" CssClass="btn btn-primary btn-lg" />
                    <%--<a class="btn btn-primary btn-lg mt-3 mb-5" href="#" role="button">Log in</a>--%>
                </div>
            </div>
            <%--<asp:Label ID="TestLabel" runat="server" Text="Test"></asp:Label>--%>
        </div>
    </form>
</body>
</html>


