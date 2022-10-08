<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Web_Application_Project.Courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Courses</title>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/homepageStyle.css" rel="stylesheet" />
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
                        <<li class="nav-item mx-5">
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
                <%--<div class="col-sm-2 sticky-top">
                    Other products not lunched yet
                    <div class="mb-3">
                        <div class="pt-2">
                            <nav class="navbar bgwhite">
                                <ul class="navbar-nav navbar-custom">
                                    <li class="nav-item dropdown bgwhite">
                                        <a class="nav-link dropdown-toggle sidenavbartextfontsize" href="#" id="navdroplang" data-toggle="dropdown">Languages
                                        </a>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="#">Java
                                            </a>
                                            <a class="dropdown-item" href="#">C
                                            </a>
                                            <a class="dropdown-item" href="#">C++
                                            </a>
                                            <a class="dropdown-item" href="#">Python
                                            </a>
                                            <a class="dropdown-item" href="#">Ruby
                                            </a>
                                            <a class="dropdown-item" href="#">C#
                                            </a>
                                            <a class="dropdown-item" href="#">JavaScript
                                            </a>
                                            <a class="dropdown-item" href="#">HTML&CSS
                                            </a>
                                            <a class="dropdown-item" href="#">PHP
                                            </a>
                                            <a class="dropdown-item" href="#">SQL
                                            </a>
                                            <a class="dropdown-item" href="#">Swift
                                            </a>
                                            <a class="dropdown-item" href="#">Kotlin
                                            </a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown bgwhite">
                                        <a class="nav-link dropdown-toggle sidenavbartextfontsize" href="#" id="navdropsub" data-toggle="dropdown">Subjects
                                        </a>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="#">Web Development
                                            </a>
                                            <a class="dropdown-item" href="#">Machine Learning
                                            </a>
                                            <a class="dropdown-item" href="#">Web Design
                                            </a>
                                            <a class="dropdown-item" href="#">Game Development
                                            </a>
                                            <a class="dropdown-item" href="#">Mobile Development
                                            </a>
                                            <a class="dropdown-item" href="#">Data Science
                                            </a>
                                            <a class="dropdown-item" href="#">AI
                                            </a>
                                            <a class="dropdown-item" href="#">Computer Security
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>--%>
                <%--Card group--%>
                <div class="col-sm-12">
                    <div class="card-group">
                        <%--product1 java hidID 1--%>
                        <div class="card">
                            <img src="images/Java-01.png" class="img-fluid d-block mx-auto card-img-top" alt="java" />
                            <div class="card-body">
                                <h5 class="card-title">Java
                                </h5>
                                <div class="card-text cardhight">
                                    <p>
                                        Java is used in a wide variety of computing platforms from embedded devices and mobile phones to enterprise servers and supercomputers.
                                    </p>
                                </div>
                                <asp:HiddenField ID="hidProductID1" runat="server" Value="1" />
                                <div class="card-footer bg-transparent border-dark">
                                    <asp:Button ID="btnAddQuantity1" runat="server" Text="Add to Cart" class="btn btn-dark mt-3" ValidationGroup="JAVA" OnClick="btnAddQuantity1_Click" />
                                </div>
                            </div>
                        </div>
                        <%--product2 c# hidID 2--%>
                        <div class="card">
                            <img src="images/C-Sharp-01.png" class="img-fluid d-block mx-auto card-img-top" alt="c#" />
                            <div class="card-body">
                                <h5 class="card-title">C#
                                </h5>
                                <div class="card-text cardhight">
                                    <p>
                                        C# is a general-purpose, multi-paradigm programming language encompassing strong typing, lexically scoped, imperative, declarative, functional, generic, object-oriented, and component-oriented programming disciplines.
                                    </p>
                                </div>
                                <asp:HiddenField ID="hidProductID2" runat="server" Value="2" />
                                <div class="card-footer bg-transparent border-dark">
                                    <asp:Button ID="btnAddQuantity2" runat="server" Text="Add to Cart" class="btn btn-dark mt-3" ValidationGroup="c#" OnClick="btnAddQuantity2_Click" />
                                </div>
                            </div>
                        </div>
                        <%--product3 python hidID 3--%>
                        <div class="card">
                            <img src="images/Python-01.png" class="img-fluid d-block mx-auto card-img-top" alt="pyhon" />
                            <div class="card-body">
                                <h5 class="card-title">Python
                                </h5>
                                <div class="card-text cardhight">
                                    <p>
                                        Python is an interpreted, high-level, and general-purpose programming language, and Object-oriented programming and structured programming are fully supported, and many of its features support functional programming and aspect-oriented programming.
                                    </p>
                                </div>
                                <asp:HiddenField ID="hidProductID3" runat="server" Value="3" />
                                <div class="card-footer bg-transparent border-dark">
                                    <asp:Button ID="btnAddQuantity3" runat="server" Text="Add to Cart" class="btn btn-dark mt-3" ValidationGroup="python" OnClick="btnAddQuantity3_Click" />
                                </div>
                            </div>
                        </div>
                        <%--product4 mysql hidID 4--%>
                        <div class="card">
                            <img src="images/MySQL-01.png" class="img-fluid d-block mx-auto card-img-top" alt="sql" />
                            <div class="card-body">
                                <h5 class="card-title">Database - MySQL
                                </h5>
                                <div class="card-text cardhight">
                                    <p>
                                        The database management system (DBMS) is the software that interacts with end-users, applications, and the database itself to capture and analyze the data. The DBMS software additionally encompasses the core facilities provided to administer the database.
                                    </p>
                                </div>
                                <asp:HiddenField ID="hidProductID4" runat="server" Value="4" />
                                <div class="card-footer bg-transparent border-dark">
                                    <asp:Button ID="btnAddQuantity4" runat="server" Text="Add to Cart" class="btn btn-dark mt-3" ValidationGroup="SQL" OnClick="btnAddQuantity4_Click" />
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
