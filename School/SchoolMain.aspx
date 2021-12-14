<%@ Page Title="" Language="C#" MasterPageFile="~/School/SchoolMaster.Master" AutoEventWireup="true" CodeBehind="SchoolMain.aspx.cs" Inherits="LamedNetLite.SchoolMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

</asp:Content>
<asp:Content ID="header" ContentPlaceHolderID="page_header" runat="server">
    טבלת מורים
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">



      <%--<div class="row bg-primary "><h1>מקום להתראות למנהל בית הספר</h1></div>--%>
            <!-- /.row -->
    <div class="row bg-primary"><h1>מקום להתראות</h1></div>
            <div class="row bg-danger">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>קוד מורה</th>
                                            <th>שם מורה</th>
                                            <th>טלפון</th>
                                            <th>אימייל</th>
                                            <th>ת.ז</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        <asp:Repeater ID="RptDataTable" runat="server">
                                         <ItemTemplate >
                                          <tr class="odd gradeX">
                                            <td><%#Eval("TeacherId") %></td>
                                            <td><%#Eval("TeacherName") %></td>
                                            <td><%#Eval("Phone") %></td>
                                            <td><%#Eval("UserName") %></td>
                                            <td><%#Eval("ID") %></td>
                                          </tr>
                                        </ItemTemplate>
                                      </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                            <%--<div class="well">
                                <h4>DataTables Usage Information</h4>
                                <p>
                                    DataTables is a very flexible, advanced tables plugin for jQuery. In SB Admin, we are using a specialized version of DataTables built for Bootstrap 3. We have also customized the table headings to use Font Awesome icons
                                    in place of images. For complete documentation on DataTables, visit their website at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.
                                </p>
                                <a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View DataTables Documentation</a>
                            </div>--%>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <div class="col-lg-4">מקום לפרסומות</div>
                <!-- /.col-lg-12 -->
            </div>
</asp:Content>
<asp:Content ID="js" ContentPlaceHolderID="scripts" runat="server">
     
    <script src="js/dataTables.bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
   <script>
       $(document).ready(function () {
           $('#dataTables-example').dataTable();
       });
    </script>
</asp:Content>
