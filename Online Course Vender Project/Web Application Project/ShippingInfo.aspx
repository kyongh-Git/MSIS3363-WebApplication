<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShippingInfo.aspx.cs" Inherits="Web_Application_Project.ShippingInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Billing Info</title>
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
                                <asp:LinkButton ID="lbtnsignout" runat="server" OnClick="lbtnsignout_Click" CssClass="nav-link" CausesValidation="False">Sign Out</asp:LinkButton>
                            </li>
                        </asp:Panel>
                    </ul>
                </div>
            </nav>
            <div class="row">
                <%--Cute dog picture--%>
                <div class="col-sm-8 cardMG pgheight">
                    <img src="images/billingDog.jpg" class="img-fluid d-block" alt="cuteDog"/>
                </div>
                <%--billing info to be filled, all required except address2--%>
                <div class="col-sm-4 cardMG pgheight">
                    <div class="card">
                        <div class="card-body mt-3">
                            <h2 class="card-title mb-5">
                                Billing Information
                            </h2>
                            <%--first name--%>
                            <div class="row mt-3 mb-3">
                                <div class="col-sm-4 TextSizeUp">
                                    <label>First Name</label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="tboxFirstName" runat="server" AutoPostBack="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="First Name is required" ControlToValidate="tboxFirstName" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <%--last name--%>
                            <div class="row mt-3 mb-3">
                                <div class="col-sm-4 TextSizeUp">
                                    <label>Last Name</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="tboxLastName" runat="server" AutoPostBack="True"></asp:TextBox>
                                </div>
                                <div class="col-sm-4">
                                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Last Name is required" ControlToValidate="tboxLastName" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row mt-3 mb-3">
                                <%--address1--%>
                                <div class="col-sm-4 TextSizeUp">
                                    <label>Billing Address1</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="tboxAddress1" runat="server" AutoPostBack="True"></asp:TextBox>
                                </div>
                                <div class="col-sm-4">
                                    <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" ErrorMessage="Address1 is required" ControlToValidate="tboxAddress1" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row mt-3 mb-3">
                                <%--address2--%>
                                <div class="col-sm-4 TextSizeUp">
                                    <label>Billing Address2</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="tboxAddress2" runat="server" AutoPostBack="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row mt-3 mb-3">
                                <%--city--%>
                                <div class="col-sm-4 TextSizeUp">
                                    <label>Billing City</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="tboxCity" runat="server" AutoPostBack="True"></asp:TextBox>
                                </div>
                                <div class="col-sm-4">
                                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City is required" ForeColor="#FF3300" ControlToValidate="tboxCity"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <%--state--%>
                            <div class="row mt-3 mb-3">
                                <div class="col-sm-4 TextSizeUp">
                                    <label>Billing State</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:DropDownList ID="ddlState" runat="server" DataSourceID="SqlDataSource1" DataTextField="StateAbbr" DataValueField="StateID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:F20_kskyonghConnectionState %>" SelectCommand="SELECT * FROM [StateMaster]"></asp:SqlDataSource>
                                </div>
                                <div class="col-sm-4">
                                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="State is required" ControlToValidate="ddlState" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <%--zipcode--%>
                            <div class="row mt-3 mb-3">
                                <div class="col-sm-4 TextSizeUp">
                                    <label>Billing Zipcode</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="tboxZipcode" runat="server" AutoPostBack="True"></asp:TextBox>
                                </div>
                                <div class="col-sm-4">
                                    <asp:RequiredFieldValidator ID="rfvZIP" runat="server" ErrorMessage="ZIP Code is required" ControlToValidate="tboxZipcode" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="rgvZIP" runat="server" ErrorMessage="Invalid ZIP code" ControlToValidate="tboxZipcode" Display="Dynamic" ValidationExpression="\d{5}(-\d{4})?" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <%--payment method--%>
                            <div class="row mt-3 mb-3">
                                <div class="col-sm-4 TextSizeUp">
                                    <label>Payment Method</label>
                                </div>
                                <div class="col-sm-4">
                                    <asp:DropDownList ID="ddlPaymethod" runat="server" DataSourceID="SqlDataSource2" DataTextField="Method" DataValueField="PayMethodID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:F20_kskyonghConnection %>" SelectCommand="SELECT * FROM [PayMethodMaster]"></asp:SqlDataSource>
                                </div>
                                <div class="col-sm-4">
                                    <asp:RequiredFieldValidator ID="rfvPayment" runat="server" ErrorMessage="Payment Method is required" ControlToValidate="ddlPaymethod" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <%--confirm button - Send order info to DB--%>
                            <div class="row">
                                <div class="col-sm-4 offset-sm-4">
                                    <asp:Button ID="btnConfirm" runat="server" cssClass="btn btn-primary" Text="Confirm" OnClick="btnConfirm_Click" />
                                </div>
                            </div>
                            <%--error message label--%>
                            <asp:Label ID="errorMSG" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
