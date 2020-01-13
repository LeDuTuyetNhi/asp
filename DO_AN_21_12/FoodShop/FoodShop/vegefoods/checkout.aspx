<%@ Page Title="" Language="C#" MasterPageFile="~/Vegefoods.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="FoodShop.vegefoods.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ctp_css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctp_container" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('img/bg_1.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span></p>
                    <h1 class="mb-0 bread">Checkout</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 ftco-animate">
                    <form action="#" class="billing-form">
                        <h3 class="mb-4 billing-heading">Billing Details</h3>
                        <div class="row align-items-end">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="firstname">Firt Name</label>
                                    <asp:TextBox ID="txt_FirtName" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="lastname">Last Name</label>
                                    <asp:TextBox ID="txt_LastName" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="country">Phone</label>
                                    <asp:TextBox ID="txt_phone" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="streetaddress">Street Address</label>
                                    <asp:TextBox ID="txt_add" CssClass="form-control" runat="server" placeholder="House number and street name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <asp:DropDownList ID="DropDownList_SelectStatus" runat="server" CssClass="form-control form-control-user">
                            <asp:ListItem Value="1">Active</asp:ListItem>
                            <asp:ListItem Value="0">Disabled</asp:ListItem>
                        </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- END -->
                </div>
                <div class="col-xl-5">
                    <div class="row mt-5 pt-3">
                        <div class="col-md-12 d-flex mb-5">
                            <div class="cart-detail cart-total p-3 p-md-4">
                                <h3 class="billing-heading mb-4">Cart Total</h3>
                                <asp:Label ID="lblSumTotal" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="cart-detail p-3 p-md-4">
                                <%--<p><a href="#" class="btn btn-primary py-3 px-4">Place an order</a></p>--%>
                                <asp:Button ID="Button1" runat="server" Text="Place an order" CssClass="btn btn-primary py-3 px-4" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .col-md-8 -->
            </div>
        </div>
    </section>
    <!-- .section -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctp_script" runat="server">
</asp:Content>
