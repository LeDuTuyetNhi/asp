<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Food_Type.aspx.cs" Inherits="FoodShop.admin.Food_Type" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ctp_css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctp_container" runat="server">
    <div class="form-group row">
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-user" placeholder="Type Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Name" runat="server" ErrorMessage="Type Name is not null " ControlToValidate="txtName" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="txtPos" runat="server" CssClass="form-control form-control-user" placeholder="Type Pos"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Pos" runat="server" ErrorMessage="Type Post is not null " ControlToValidate="txtPos" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:Image ID="Image1" runat="server" Height="118px" Visible="False" Width="121px" />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Img" runat="server" ErrorMessage="Image is not null" CssClass="text-danger" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
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

            <asp:TextBox ID="txtUs" runat="server" CssClass="form-control form-control-user" placeholder="User Name" Enabled="False"></asp:TextBox>
        </div>
        <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
            <asp:TextBox ID="txtModified" runat="server" CssClass="form-control form-control-user" placeholder="Modifiled" Enabled="False"></asp:TextBox>
        </div>
        <br />

    </div>
    <asp:Button ID="btnAdd" runat="server" Text="Thêm Food Type" class="btn btn-primary btn-user btn-block" OnClick="btnAdd_Click" Style="height: 29px" />
    <hr>
    <div id="txtResult" runat="server"></div>
    <hr>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Danh Sách Food Type</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                    <div class="row">
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdateMembarList" runat="server">
                                <ContentTemplate>
                                    <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                        <thead>
                                            <tr role="row">
                                                <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 194px;">Type Name</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 297px;">Type Post</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 141px;">Type Img</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 69px;">Status</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 137px;">Username</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 112px;">Modified</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 112px;">Operations</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 112px;">Operations</th>
                                                <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 112px;">Operations</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                                <ItemTemplate>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1"><%# Eval("type_name") %></td>
                                                        <td><%# Eval("type_pos") %></td>
                                                        <td>
                                                            <img src="img/<%#Eval("type_img")%>" style="width: 100px; height: 100px;" alt="Alternate Text" /></td>
                                                        <td><%# (Eval("status").ToString()=="1"?"Active":"Disable") %></td>
                                                        <td><%# Eval("username") %></td>
                                                        <td><%# Eval("modified") %></td>
                                                        <td><a href="?type_id=<%#Eval("type_id") %>" class="btn btn-primary">Edit</a></td>
                                                        <td>
                                                            <a href="?del=<%# Eval("type_id") %>" class="btn btn-primary">Delete</a>
                                                        </td>
                                                        <td><a href="javascript:void()" class="btn btn-primary btnHide">Hide</a></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegefoodsConnectionString3 %>" SelectCommand="SELECT * FROM [food_type]"></asp:SqlDataSource>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

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
                window.location.href = "Food_Type.aspx";
            });
        });
    </script>
</asp:Content>
