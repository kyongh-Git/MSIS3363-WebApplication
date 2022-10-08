<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThankyouPage.aspx.cs" Inherits="Web_Application_Project.ThankyouPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank you for your order</title>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet" />
    <link href="Content/homepageStyle.css" rel="stylesheet" />
    <link href="Content/ShoppingSheet.css" rel="stylesheet" />
    <link href="Content/ThankyouCSS.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
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
            <div class="row pageHeight">
                <div class="col-sm-5 pageHeight zeroMG">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title text-center">Your order has been placed.
                            </h2>
                            <%--display order ID--%>
                            <div class="card-text cardhight text-center">
                                <asp:Label ID="OrderID" runat="server" Text="Label" Font-Size="Medium"></asp:Label>
                            </div>
                            <%--gif embeded--%>
                            <div class="card-footer bg-transparent text-center">
                                <div class="justify-content-center embed-responsive embed-responsive-16by9">
                                    <iframe src="https://giphy.com/embed/xT9IgzoKnwFNmISR8I" class="embed-responsive-item"></iframe>
                                </div>

                            </div>
                            <%--go to main page button--%>
                            <div class="text-center">
                                <asp:Button ID="btnMainPage" CssClass="btn btn-dark" runat="server" Text="Home" OnClick="btnMainPage_Click" />

                            </div>
                        </div>
                    </div>
                    <%--go to main page--%>
                </div>
                <%--success image--%>
                <div class="col-sm-7 pageHeight zeroMG">
                    <img src="images/success.jpg" class="img-fluid d-block" alt="success" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
