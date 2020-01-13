<%@ Page Title="" Language="C#" MasterPageFile="~/Vegefoods.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="FoodShop.vegefoods.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ctp_css" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctp_container" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('img/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="TrangChu.aspx">Home</a></span> <span>Cart</span></p>
            <h1 class="mb-0 bread">My Cart</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th class="auto-style1"></th>
						        <th class="auto-style1"></th>
						        <th class="auto-style1">Product name</th>
						        <th class="auto-style1">Price</th>
						        <th class="auto-style1">Quantity</th>
						        <th class="auto-style1">Total</th>
						      </tr>
						    </thead>
						    <tbody>
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <tr class="text-center">
                                        <td class="product-remove">
                                            
                                        <a href="#"><span class="ion-ios-close"></span></a>
                                        <%--<asp:Button ID="Button1" runat="server" Text="X" CssClass="ion-ios-close" OnClick="Button1_click" />--%>
                                        </td>
                                                <td class="image-prod">
                                                    <img src="img/<%#Eval("Images") %>" alt="Colorlib Template" style="width: 100px; height: 100px;"></img>
                                                </td>

                                                <td class="product-name">
                                                    <h3><%#Eval("Products Name") %></h3>
                                                    <p>Far far away, behind the word mountains, far from the countries</p>
                                                </td>

                                                <td class="price">$<%#Eval("PricePromo") %></td>

                                                <td class="quantity">
                                                    
                                                    <%#Eval("Quantity") %>
                                                </td>

                                                <td class="total">$<%#Eval("Total") %></td>
						      </tr>
                                </ItemTemplate>
                            </asp:Repeater>
						    </tbody>
						  </table>
					  </div>
    			</div>
    		</div>
    		<div class="row justify-content-end">
    			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>Cart Totals</h3>
    					<asp:Label ID="lblSumTotal" runat="server" Text=""></asp:Label>
    				</div>
    				<p><a href="checkout.aspx" class="btn btn-primary py-3 px-4">Proceed to Checkout</a></p>
            
    			</div>
    		</div>
			</div>
		</section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctp_script" runat="server">
</asp:Content>
