<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="food.aspx.cs" Inherits="FoodShop.admin.food" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ctp_css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctp_container" runat="server">
     <div class="form-group row">
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="exampleFoodName" runat="server" CssClass="form-control form-control-user" placeholder="Food Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_FoodName" runat="server" ErrorMessage="Food Name is not null " ControlToValidate="exampleFoodName" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="exampleFoodDes" runat="server" CssClass="form-control form-control-user" placeholder="Food Description"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_FoodPos" runat="server" ErrorMessage="Food Description is not null " ControlToValidate="exampleFoodDes" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="exampleFoodPrice" runat="server" CssClass="form-control form-control-user" placeholder="Food Price"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_FoodPrice" runat="server" ErrorMessage="Food Price is not null" CssClass="text-danger" ControlToValidate="exampleFoodPrice"></asp:RequiredFieldValidator>
        </div>
        <br />

    </div>
    <div class="form-group row">
        <br />
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="examplePricePromo" runat="server" CssClass="form-control form-control-user" placeholder="Price Promo"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PricePromo" runat="server" ErrorMessage="Price Promo is not null" CssClass="text-danger" ControlToValidate="examplePricePromo"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:Image ID="Image_Thumb" runat="server" Height="118px" Visible="False" Width="121px" />
            <asp:FileUpload ID="FileUpload2" runat="server"  />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Image is not null" CssClass="text-danger" ControlToValidate="FileUpload2"></asp:RequiredFieldValidator>
        </div>
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:Image ID="Image1" runat="server" Height="118px" Visible="False" Width="121px" />
            <asp:FileUpload ID="FileUpload1" runat="server"  />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Image is not null" CssClass="text-danger" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
        </div>
        <br />
    </div>
    <div class="form-group row">
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="exampleUnit" runat="server" CssClass="form-control form-control-user" placeholder="Food Unit"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Food Unit is not null " ControlToValidate="exampleUnit" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="examplePercent" runat="server" CssClass="form-control form-control-user" placeholder="Food Percent"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Food Percent is not null " ControlToValidate="examplePercent" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="exampleRating" runat="server" CssClass="form-control form-control-user" placeholder="Food Rating"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Food Rating is not null" CssClass="text-danger" ControlToValidate="exampleRating"></asp:RequiredFieldValidator>
        </div>
        <br />

    </div>
    <div class="form-group row">
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="exampleSold" runat="server" CssClass="form-control form-control-user" placeholder="Food Sold"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Food Sold is not null " ControlToValidate="exampleSold" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="examplePoint" runat="server" CssClass="form-control form-control-user" placeholder="Food Point"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Food Point is not null " ControlToValidate="examplePoint" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:DropDownList ID="DropDownList1" CssClass="form-control form-control-user" runat="server" DataSourceID="SqlDataSource1" DataTextField="type_name" DataValueField="type_pos"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegefoodsConnectionString8 %>" SelectCommand="SELECT [type_name], [type_pos] FROM [food_type] WHERE ([status] = @status)">

                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="status" QueryStringField="status" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <br />

    </div>
    <div class="form-group row">
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">

            <asp:DropDownList ID="DropDownList_SelectStatus" runat="server" CssClass="form-control form-control-user">
                <asp:ListItem Enabled="true" Value="-1">--Select Status--</asp:ListItem>
                <asp:ListItem Value="1">Active</asp:ListItem>
                <asp:ListItem Value="0">Lock</asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="exampleUsername" runat="server" CssClass="form-control form-control-user" placeholder="User Name" Enabled="False"></asp:TextBox>
        </div>
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="exampleModifiled" runat="server" CssClass="form-control form-control-user" placeholder="Food Modifiled" Enabled="False"></asp:TextBox>
        </div>
        <br />

    </div>
    <asp:Button ID="btnAdd" runat="server" Text="Thêm Food" class="btn btn-primary btn-user btn-block" OnClick="btnAdd_Click" Style="height: 29px" />
    <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="reg" />--%>
    <hr>
    <div id="txtResult" runat="server"></div>
    <hr>
     <!--Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="moadal-header">
                    <h4 class="modal-title">Thông báo</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <asp:Label ID="lbmodal" runat="server" Text=""></asp:Label>
                </div>

                <div class="modal-footer">
                    <button type="button" id="myButton" class="btn btn-danger" data-dismiss="modal">OK</button>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ctp_script" runat="server">
    <script>
        $(document).ready(function () {
            $('.btnHide').click(function () {
                $(this).parent().parent().hide();
            });
        });
    </script>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>
    <script type="text/javascript">
        function openModal() {
            $('#myModal').modal('show');
        }
        $(document).ready(function () {
            $('#myButton').click(function () {
                window.location.href = "food.aspx";
            });
        });
    </script>
</asp:Content>
