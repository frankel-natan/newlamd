<%@ Page Title="" Language="C#" MasterPageFile="~/School/SchoolMaster.Master" AutoEventWireup="true" CodeBehind="StudentsList.aspx.cs" Inherits="LamedNetLite.StudentsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">
    <asp:Literal runat="server" ID="header"></asp:Literal>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    רשימת תלמידים
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>שם תלמיד</th>
                                    <th>טלפון</th>
                                    <th>אימייל</th>
                                    <th>ת.ז</th>
                                </tr>
                            </thead>
                            <tbody>

                                <asp:Repeater ID="RptDataTable" runat="server">
                                    <ItemTemplate>
                                        <tr class="odd gradeX">
                                            <%--                                            <td><%#Eval("TeacherId") %></td>--%>
                                            <td><%#Eval("StudentName") %></td>
                                            <td><%#Eval("Phone") %></td>
                                            <td><%#Eval("userName") %></td>
                                            <td><%#Eval("ID") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>

                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
    <script src="js/dataTables.bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>
</asp:Content>
