<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="a.aspx.cs" Inherits="FoodShop.admin.a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ctp_css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ctp_container" runat="server">
    <div class="col-lg-12">
        <div class="p-5">
            <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
            </div>
            <%--<form class="user">--%>
            <div class="form-group row">
                <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox ID="exampleFirstName" runat="server" CssClass="form-control form-control-user" placeholder="User Name" Enabled="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_FirstName" runat="server" ErrorMessage="User Name Không Được Để Trống " ControlToValidate="exampleFirstName" CssClass="text-danger" ValidationGroup="GroupAddFppd"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox ID="exampleLastName" runat="server" CssClass="form-control form-control-user" placeholder="Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_LastName" runat="server" ErrorMessage="Name Không Được Để Trống " ControlToValidate="exampleLastName" CssClass="text-danger" ValidationGroup="GroupAddFppd"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox ID="exampleInputEmail" runat="server" CssClass="form-control form-control-user" TextMode="Email" placeholder="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ErrorMessage="Email Không Được Để Trống" CssClass="text-danger" ControlToValidate="exampleInputEmail" ValidationGroup="GroupAddFppd"></asp:RequiredFieldValidator>
                </div>
                <br />
            </div>

            <div class="form-group row">
                <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox ID="exampleInputPassword" runat="server" CssClass="form-control form-control-user" TextMode="Password" placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_PassWord" runat="server" ErrorMessage="Password Không Được Để Trống" CssClass="text-danger" ControlToValidate="exampleInputPassword" ValidationGroup="GroupAddFppd"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox ID="exampleRepeatPassword" runat="server" CssClass="form-control form-control-user" TextMode="Password" placeholder="Repeat Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Repass" runat="server" ErrorMessage="Repass Không Được Để Trống" CssClass="text-danger" ControlToValidate="exampleRepeatPassword" ValidationGroup="GroupAddFppd"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator_Pass" runat="server" ErrorMessage="PassWord Và RePassword Không Giống Nhau" CssClass="text-danger" ControlToCompare="exampleInputPassword" ControlToValidate="exampleRepeatPassword"></asp:CompareValidator>
                </div>
                <br />
                <div class="col-lg-4 col-sm-6 mb-3 mb-sm-0">
                    <asp:TextBox ID="exampleRepeatPhone" runat="server" CssClass="form-control form-control-user" TextMode="Phone" placeholder="Phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Phone" runat="server" ErrorMessage="Số Điện Thoại Không Được Để Trống " CssClass="text-danger" ControlToValidate="exampleRepeatPhone" ValidationGroup="GroupAddFppd"></asp:RequiredFieldValidator>

                </div>
                <br />

            </div>
            <div class="form-group row">
                <div class="col-lg-6 col-sm-6 mb-3 mb-sm-0">
                    <asp:Label ID="Label1" runat="server" Text="Label">Status:</asp:Label>
                    <asp:DropDownList ID="DropDownList_SelectStatus" runat="server" CssClass="form-control form-control-user">
                        <asp:ListItem Value="1">Active</asp:ListItem>
                        <asp:ListItem Value="0">Disabled</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-6 col-sm-6 mb-3 mb-sm-0">
                    <asp:Label ID="Label2" runat="server" Text="Label">Role:</asp:Label>
                    <asp:DropDownList ID="DropDownList_SelectRole" runat="server" CssClass="form-control form-control-user">
                        <asp:ListItem Value="1">Admin</asp:ListItem>
                        <asp:ListItem Value="0">Editor</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <asp:Button ID="btnAdd" runat="server" Text="Thêm Member" class="btn btn-primary btn-user btn-block" OnClick="btnAdd_Click" />
            <hr>
            <div id="txtResult" runat="server"></div>
            <asp:Button ID="HuyButton" runat="server" Text="Hủy" class="btn btn-primary btn-user btn-block" OnClick="HuyButton_Click" />

            <%--</form>--%>

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Danh Sách Member</h6>
                </div>
                <div>
            <asp:TextBox ID="txtKey" runat="server" ValidationGroup="search"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="search" />
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                                        <ItemTemplate>
                                                            <tr role="row" class="odd">
                                                                <td class="sorting_1"><%# Eval("username") %></td>
                                                                <td><%# Eval("pass") %></td>
                                                                <td><%# Eval("name") %></td>
                                                                <td><%# Eval("phone") %></td>
                                                                <td><%# (Eval("status").ToString()=="1"?"Active":"Disable") %></td>
                                                                <td><%# Eval("role") %></td>
                                                                <td><%# Eval("email") %></td>
                                                                <td><a href="?id=<%#Eval("username") %>" class="btn btn-primary">Edit</a></td>
                                                                <td>
                                                                    <a href="?del=<%# Eval("username") %>" class="btn btn-primary">Delete</a>
                                                                </td>
                                                                <td><a href="javascript:void()" class="btn btn-primary btnHide">Hide</a></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vegefoodsConnectionString15 %>" SelectCommand="SELECT * FROM [Member] WHERE ([username] = @username)">
                        <SelectParameters>
                            <asp:Parameter Name="username" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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
                                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 194px;">User Name</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 297px;">Password</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 141px;">Name</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 69px;">Phone</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 137px;">Status</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 112px;">Role</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 112px;">Email</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 112px;">Operations</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 112px;">Operations</th>
                                                        <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 112px;">Operations</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                                        <ItemTemplate>
                                                            <tr role="row" class="odd">
                                                                <td class="sorting_1"><%# Eval("username") %></td>
                                                                <td><%# Eval("pass") %></td>
                                                                <td><%# Eval("name") %></td>
                                                                <td><%# Eval("phone") %></td>
                                                                <td><%# (Eval("status").ToString()=="1"?"Active":"Disable") %></td>
                                                                <td><%# Eval("role") %></td>
                                                                <td><%# Eval("email") %></td>
                                                                <td><a href="?id=<%#Eval("username") %>" class="btn btn-primary">Edit</a></td>
                                                                <td>
                                                                    <a href="?del=<%# Eval("username") %>" class="btn btn-primary">Delete</a>
                                                                </td>
                                                                <td><a href="javascript:void()" class="btn btn-primary btnHide">Hide</a></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vegefoodsConnectionString2 %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Thông Báo</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lblModal" runat="server" Text=""></asp:Label>
                </div>
                <div class="modal-footer">
                    <button type="button" id="myButton" class="btn btn-primary" data-dismiss="modal">OK</button>
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
                window.location.href = "Member.aspx";
            });
        });
    </script>
</asp:Content>
