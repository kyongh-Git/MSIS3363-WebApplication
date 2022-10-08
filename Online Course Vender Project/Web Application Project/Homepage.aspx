<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Web_Application_Project.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/homepageStyle.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid remove-mg-pd">
            <%--Top navigation--%>
            <nav class="navbar navbar-expand-md bg-dark navbar-dark justify-content-center">
                <a class="navbar-brand" href="Homepage.aspx">
                    <%--<img src="images/logonew.png" class="img-fluid d-block mx-auto" alt="logo" />--%>
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
            <div class="row backgroundColor">
                <div class="col-sm-12 justify-content-center ">
                    <img src="images/maindomain.jpg" class="img-fluid d-block mx-auto" />
                    <h1 class="responsiveText subheader carousel-caption">Welcome to the programming world!</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 mb-5 text-center">
                    <h1 class="mainhd">Codera</h1>
                    <p class="phd">We are the largest programming contents provider.</p>
                    <a class="btn btn-primary btn-lg mt-3 mb-5" href="Courses.aspx" role="button">See our courses</a>
                </div>
            </div>
            <%--carousel--%>
            <div class="row justify-content-center">
                <div class="col-sm-6 p-0 justify-content-center">
                    <div id="mainCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
                        <ol class="carousel-indicators">
                            <li data-target="#mainCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#mainCarousel" data-slide-to="1"></li>
                            <%--<li data-target="#mainCarousel" data-slide-to="2">
                            </li>--%>
                        </ol>
                        <div class="carousel-inner ">
                            <div class="carousel-item active">
                                <img src="images/coding.jpg" alt="coding1" class="img-fluid d-block mx-auto imgFix" />
                            </div>
                            <div class="carousel-item">
                                <img src="images/machinelearning.jpg" alt="ml" class="img-fluid d-block mx-auto imgFix" />
                            </div>
                            <div class="carousel-item">
                                <img src="images/students.jpg" alt="std" class="img-fluid d-block mx-auto imgFix" />
                            </div>
                            <%--Previous button--%>
                            <a class="carousel-control-prev" href="#mainCarousel" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <%--Next button--%>
                            <a class="carousel-control-next" href="#mainCarousel" role="button" data-slide="next">
                                <span class="carousel-control-next-icon"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
                <%--Embeded Video--%>
                <div class="col-sm-6 justify-content-center embed-responsive embed-responsive-16by9">
                    <iframe src="https://www.youtube.com/embed/zOjov-2OZ0E" class="embed-responsive-item" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
