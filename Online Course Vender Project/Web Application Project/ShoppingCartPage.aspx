<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCartPage.aspx.cs" Inherits="Web_Application_Project.ShoppingCartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Shopping Cart</title>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/homepageStyle.css" rel="stylesheet" />
    <link href="Content/ShoppingSheet.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid remove-mg-pd">
            <%--Top navigation--%>
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
                <div class="col-sm-8">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title">Shopping Cart
                            </h2>
                            <p class="card-text">
                                <asp:Label ID="errorMSG" runat="server" ForeColor="Red"></asp:Label>
                            </p>
                            <div class="row">
                                <%--ListBox to display cart item infos--%>
                                <div class="col-sm-8">
                                    <asp:ListBox ID="lboxCartSummary" runat="server" Height="200px" Width="100%" BackColor="#999999"></asp:ListBox>
                                </div>
                                <div class="col-sm-4">
                                    <div class="row justify-content-center">
                                        <%--removal button--%>
                                        <div class="col-sm-12">
                                            <asp:Button ID="btnRemove" runat="server" Text="Remove Item" CssClass="btn btn-dark" OnClick="btnRemove_Click" Width="100%" />
                                        </div>
                                    </div>
                                    <div class="row justify-content-center mt-1">
                                        <%--cart empty button--%>
                                        <div class="col-sm-12">
                                            <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" CssClass="btn btn-dark" OnClick="btnEmpty_Click" Width="100%" />
                                        </div>
                                    </div>
                                    <div class="row justify-content-center mt-1">
                                        <%--continue shopping button--%>
                                        <div class="col-sm-12">
                                            <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" CssClass="btn btn-dark" OnClick="btnContinue_Click" Width="100%" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title">
                                Subtotal:
                            </h3>
                            <%--Total Price label--%>
                            <p class="card-text">
                                <strong>
                                $
                                <asp:Label ID="lblPriceTotal" runat="server" Text="0.00"></asp:Label>
                                </strong>
                            </p>
                            <asp:Label ID="errorCheckoutMSG" runat="server" Text="" ForeColor="#FF3300"></asp:Label>
                            <%--Check out button - go to billing summary page--%>
                            <div class="row justify-content-center">
                                <div class="col-sm-6">
                                    <asp:Button ID="btnCheckOut" runat="server" Text="Proceed to checkout" CssClass="btn btn-primary" OnClick="btnCheckOut_Click" Width="100%" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
