<%@ Page Title="" Language="C#" MasterPageFile="~/Vegefoods.Master" AutoEventWireup="true" CodeBehind="product_single.aspx.cs" Inherits="FoodShop.vegefoods.product_single" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ctp_css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctp_container" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('img/bg_1.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="TrangChu.aspx">Home</a></span> <span class="mr-2"><a href="index.html">Product</a></span> <span>Product Single</span></p>
                    <h1 class="mb-0 bread">Product Single</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="col-lg-6 mb-5 ftco-animate">
                            <a href="img/<%# Eval("img") %>" class="image-popup">
                                <img src="img/<%# Eval("img") %>" class="img-fluid" alt="Colorlib Template"></a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="Repeater2_ItemCommand">
                    <ItemTemplate>
                        <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                            <asp:HiddenField ID="hf_id" runat="server" Value='<%#Eval("id") %>' />
                                <asp:HiddenField ID="hf_img" runat="server" Value='<%#Eval("img") %>' />
                                <asp:HiddenField ID="hf_price" runat="server" Value='<%#Eval("price") %>' />
                                <asp:HiddenField ID="hf_name" runat="server" Value='<%#Eval("name") %>' />
                                <asp:HiddenField ID="hf_unit" runat="server" Value='<%#Eval("unit") %>' />
                                <asp:HiddenField ID="hf_pricepromo" runat="server" Value='<%#Eval("price_promo") %>' />
                            <h3><%# Eval("name") %></h3>
                            <div class="rating d-flex">
                                <p class="text-left mr-4">
                                    <a href="#" class="mr-2">5.0</a>
                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                    <a href="#"><span class="ion-ios-star-outline"></span></a>
                                </p>
                                <p class="text-left mr-4">
                                    <a href="#" class="mr-2" style="color: #000;"><%# Eval("rating") %><span style="color: #bbb;">Rating</span></a>
                                </p>
                                <p class="text-left">
                                    <a href="#" class="mr-2" style="color: #000;"><%# Eval("sold") %> <span style="color: #bbb;">Sold</span></a>
                                </p>
                            </div>
                            <p class="price"><span><%# Eval("description") %></span></p>
                            <%--<p>
                                A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Text should turn around and return to its own, safe country. But nothing the copy said could convince her and so it didn’t take long until.
					
                            </p>--%>
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group d-flex">
                                        <div class="select-wrap">
                                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                            <select name="" id="" class="form-control">
                                                <option value="">Small</option>
                                                <option value="">Medium</option>
                                                <option value="">Large</option>
                                                <option value="">Extra Large</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="input-group col-md-6 d-flex mb-3">
                                    <span class="input-group-btn mr-2">
                                        <button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
                                            <i class="ion-ios-remove"></i>
                                        </button>
                                    </span>
                                    <input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">
                                    <span class="input-group-btn ml-2">
                                        <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                            <i class="ion-ios-add"></i>
                                        </button>
                                    </span>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <p style="color: #000;">600 kg available</p>
                                </div>
                            </div>
                            <%--<asp:Button ID="add_to_cart" runat="server" Text="Add to cart" />
                            <p>
                                <%--<a href="cart.html" class="btn btn-black py-3 px-5">Add to Cart</a>--%>
                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-black py-3 px-5" runat="server" CommandName="Add_to_cart"><span><i class="ion-ios-cart"></i></span></asp:LinkButton>
                            
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegefoodsConnectionString10 %>" SelectCommand="SELECT * FROM [Food] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegefoodsConnectionString11 %>" SelectCommand="SELECT * FROM [Food] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="id" Name="id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>

    </section>
   
    <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-3 pb-3">
                    <div class="col-md-12 heading-section text-center ftco-animate fadeInUp ftco-animated">
                        <span class="subheading">Products</span>
                        <h2 class="mb-4">Related Products</h2>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <asp:Repeater ID="Repeater3" runat="server" OnItemCommand="Repeater3_ItemCommand">
                        <ItemTemplate>
                            <div class="col-md-6 col-lg-3 ftco-animate fadeInUp ftco-animated">
                                <div class="product">
                                    <asp:HiddenField ID="hf_id" runat="server" Value='<%#Eval("id") %>' />
                                <asp:HiddenField ID="hf_img" runat="server" Value='<%#Eval("img") %>' />
                                <asp:HiddenField ID="hf_price" runat="server" Value='<%#Eval("price") %>' />
                                <asp:HiddenField ID="hf_name" runat="server" Value='<%#Eval("name") %>' />
                                <asp:HiddenField ID="hf_unit" runat="server" Value='<%#Eval("unit") %>' />
                                <asp:HiddenField ID="hf_pricepromo" runat="server" Value='<%#Eval("price_promo") %>' />
                                    <a href="product_single.aspx?id=<%#Eval("id") %>" class="img-prod">
                                        <img class="img-fluid" src="img/<%#Eval("img") %>" alt="Colorlib Template"></img>
                                        <span class="status"><%#Eval("percent_promo") %>%</span>
                                        <div class="overlay"></div>
                                    </a>
                                    <div class="text py-3 pb-4 px-3 text-center">
                                        <h3><a href="#"><%#Eval("name") %></a></h3>
                                        <div class="d-flex">
                                            <div class="pricing">
                                                <p class="price"><span class="mr-2 price-dc">$ <%#Eval("price") %></span><span class="price-sale">$ <%#Eval("price_promo") %></span></p>
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
            </div>
            <div class="row mt-5">
            <div class="col text-center">
                <div class="block-27">
                    <ul>
                        <asp:Repeater ID="Repeater4" runat="server">
                            <ItemTemplate>
                                <li class="active"><a href="?page=<%#Eval("index") %><% if (Request["id"] != null) Response.Write("&id=" + Request["id"]); %>"><%#Eval("index") %></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
        </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctp_script" runat="server">
</asp:Content>
