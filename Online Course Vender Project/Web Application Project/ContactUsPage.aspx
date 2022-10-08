<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUsPage.aspx.cs" Inherits="Web_Application_Project.ContactUsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/homepageStyle.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid remove-mg-pd">
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
            <div class="row">
                <div class="col-sm-12 text-center">
                    <%--hearder--%>
                    <h1 class="mainhd">CONTACT CODERA</h1>
                    <p class="pphd">So you have questions? You are so welcomed!</p>
                </div>
            </div>
            <div class="row justify-content-center">
                <%--first name--%>
                <%--required--%>
                <div class="col-sm-3">
                    <asp:TextBox ID="tboxFirstName" runat="server" AutoPostBack="False" class="form-control" Height="70px" placeholder="First Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="First name is required" ControlToValidate="tboxFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <%--last name--%>
                <%--required--%>
                <div class="col-sm-3">
                    <asp:TextBox ID="tboxLastName" runat="server" AutoPostBack="False" class="form-control" Height="70px" placeholder="Last Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Last name is required" ControlToValidate="tboxLastName" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <%--phone--%>
                <%--required--%>
                <div class="col-sm-3">
                    <asp:TextBox ID="tboxPhone" runat="server" AutoPostBack="False" class="form-control" Height="70px" placeholder="Phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="Phone number is required" ControlToValidate="tboxPhone" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgvPhone" runat="server" ErrorMessage="Invalid phone number" ControlToValidate="tboxPhone" Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row justify-content-center">
                <%--email--%>
                <%--required--%>
                <%--Regular Expression--%>
                <div class="col-sm-9">
                    <asp:TextBox ID="tboxEmail" runat="server" AutoPostBack="False" class="form-control" Height="70px" placeholder="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvREmail" runat="server" ErrorMessage="Email is required" ControlToValidate="tboxEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgvREmail" runat="server" ErrorMessage="Invalid email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tboxEmail" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row mt-4 justify-content-center">
                <%--message--%>
                <div class="col-sm-9">
                    <asp:TextBox ID="tboxMSG" runat="server" AutoPostBack="False" class="form-control" Height="200px" placeholder="Leave your message here..." MaxLength="1000" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-sm-12 text-center">
                    <%--submit button--%>
                    <asp:Button ID="btnSubmit" CssClass="btn btn-success btn-lg mt-3 mb-5" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
