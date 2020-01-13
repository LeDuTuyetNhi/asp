<%@ Page Title="" Language="C#" MasterPageFile="~/Vegefoods.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="FoodShop.vegefoods.shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ctp_css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctp_container" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('img/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span></p>
            <h1 class="mb-0 bread">Products</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-10 mb-5 text-center">
    				<ul class="product-category">
    					<li><a href="shop.aspx" class="active">All</a></li>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <li><a href="?type=<%#Eval("type_pos") %>"><%#Eval("type_name") %></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegefoodsConnectionString14 %>" SelectCommand="SELECT * FROM [food_type] WHERE ([status] = @status)">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="1" Name="status" QueryStringField="status" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
    				</ul>
    			</div>
    		</div>
    		<div class="row">
                <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_ItemCommand">
                    <ItemTemplate>
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="product">
                                <asp:HiddenField ID="hf_id" runat="server" Value='<%#Eval("id") %>' />
                                <asp:HiddenField ID="hf_img" runat="server" Value='<%#Eval("img") %>' />
                                <asp:HiddenField ID="hf_price" runat="server" Value='<%#Eval("price") %>' />
                                <asp:HiddenField ID="hf_name" runat="server" Value='<%#Eval("name") %>' />
                                <asp:HiddenField ID="hf_unit" runat="server" Value='<%#Eval("unit") %>' />
                                <asp:HiddenField ID="hf_pricepromo" runat="server" Value='<%#Eval("price_promo") %>' />

                                <a href="product_single.aspx?id=<%#Eval("id") %>" class="img-prod">
                                    <img class="img-fluid" src="img/<%#Eval("img") %>" alt="Colorlib Template"></img>
                                    <span class="status"><%#Eval("percent_promo") %> %</span>
                                    <div class="overlay"></div>
                                </a>&nbsp;&nbsp;<div class="text py-3 pb-4 px-3 text-center">
                                    <h3><a href="#"><%#Eval("name") %></a></h3>
                                    <div class="d-flex">
                                        <div class="pricing">
                                            <p class="price"><span class="mr-2 price-dc"><%#Eval("price") %></span><span class="price-sale"><%# Eval("price_promo") %></span></p>
                                        </div>
                                    </div>
                                    <div class="bottom-area d-flex px-3">
                                        <div class="m-auto d-flex">
                                            <a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                                <span><i class="ion-ios-menu"></i></span>
                                            </a>
                                            <asp:LinkButton ID="Add_to_cart" CssClass="buy-now d-flex justify-content-center align-items-center mx-1" runat="server" CommandName="Add_to_cart"><span><i class="ion-ios-cart"></i></span></asp:LinkButton>

                                            <a href="#" class="heart d-flex justify-content-center align-items-center ">
                                                <span><i class="ion-ios-heart"></i></span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
    
    			</div>
                    </ItemTemplate>
                </asp:Repeater>
    			
    		</div>
    		<div class="row mt-5">
                <div class="col text-center">
                    <div class="block-27">
                        <ul>
                            <asp:Repeater ID="Repeater3" runat="server">
                                <ItemTemplate>
                                    <li><a href='?page=<%#Eval("index") %>'><%#Eval("index") %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
    	</div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctp_script" runat="server">
</asp:Content>
