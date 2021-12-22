<%@ Page Title="" Language="C#" MasterPageFile="~/School/SchoolMaster.Master" AutoEventWireup="true" CodeBehind="nananaMas.aspx.cs" Inherits="LamedNetLite.nananaMas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">
    דף הבית - טסטים עתידים 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div id="Messages" class="bd-callout bd-callout-warning col-lg-8">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <button type="button" id="clobu">
            <i class="icofont-close"></i>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backspace-fill" viewBox="0 0 16 16">
                <path d="M15.683 3a2 2 0 0 0-2-2h-7.08a2 2 0 0 0-1.519.698L.241 7.35a1 1 0 0 0 0 1.302l4.843 5.65A2 2 0 0 0 6.603 15h7.08a2 2 0 0 0 2-2V3zM5.829 5.854a.5.5 0 1 1 .707-.708l2.147 2.147 2.146-2.147a.5.5 0 1 1 .707.708L9.39 8l2.146 2.146a.5.5 0 0 1-.707.708L8.683 8.707l-2.147 2.147a.5.5 0 0 1-.707-.708L7.976 8 5.829 5.854z" />
            </svg>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-backspace-fill " style="color: black;" viewBox="0 0 16 16" data-dismiss="alert">
                <path d="M15.683 3a2 2 0 0 0-2-2h-7.08a2 2 0 0 0-1.519.698L.241 7.35a1 1 0 0 0 0 1.302l4.843 5.65A2 2 0 0 0 6.603 15h7.08a2 2 0 0 0 2-2V3zM5.829 5.854a.5.5 0 1 1 .707-.708l2.147 2.147 2.146-2.147a.5.5 0 1 1 .707.708L9.39 8l2.146 2.146a.5.5 0 0 1-.707.708L8.683 8.707l-2.147 2.147a.5.5 0 0 1-.707-.708L7.976 8 5.829 5.854z" />
            </svg>
        </button>
        <script>
            //$(document).ready(function () {
            //    $("#clobu").click(function () {
            //        $("#Messages").hide();
            //    });
            //});
        </script>

        מקום להתראות עבור מנהל בית הספר
        
    </div>
    <div class="row bg-danger">
        <div class="col-lg-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>רשימת מורים - מעקב הזמנת טסטים</h4>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>שם מורה</th>
                                    <th>כמות תלמידים</th>
                                    <th>כמות טסטים להזמנה</th>
                                    <th>תשלומים</th>
                                    <th>נסיון</th>
                                    <th>נסיון 2</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%--<form id="form1" runat="server">--%>
                                <asp:Repeater ID="RptDataTable" runat="server" OnItemDataBound="RptDataTable_ItemDataBound">
                                    <ItemTemplate>
                                        <tr class="odd gradeX">
                                            <td>
                                                <a href="#" runat="server" id="opmod"><%#Eval("TeacherName") %> </a>
                                                <button data-toggle="modal" type="button" runat="server" class="btn btn-danger hidden" id="openModelTeacher"><%#Eval("TeacherName") %></button></td>
                                            <!-- Modal -->
                                            <div runat="server" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content ">
                                                        <div class="modal-header ">
                                                            <h1 class="modal-title" id="exampleModalLabel"><%#Eval("TeacherName") %>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </h1>
                                                        </div>
                                                        <div class="modal-body">
                                                            <h2><%#Eval("Phone") %></h2>
                                                            <h3>תאריך הרשמה </h3>
                                                            <%#Eval("DateAdded") %>
                                                            <h4 id="adddata" runat="server"></h4>
                                                            <asp:Button runat="server" ID="listtehtserandstudent" OnClick="listtehtserandstudent_Click" Text="לרשימת התלמידים" type="button" class="btn btn-success" /></button>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <asp:Button class="btn btn-primary" runat="server" ID="updata" OnClick="updata_Click" Text="לעדכון פרטים"></asp:Button>
                                                            <button type="button" class="btn btn-danger" data-dismiss="modal">סגור חלון</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <td>
                                                <asp:LinkButton runat="server" ID="linkcunt" OnClick="linkcunt_Click">
                                                    <asp:Label runat="server" ID="countstudnt"> </asp:Label>
                                                </asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton runat="server" ID="linkTast" OnClick="linkTast_Click"></asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:Label runat="server" ID="PayTast"></asp:Label>
                                            </td>
                                            <%--onclick="selectTaeter($(this).attr('name'))"--%>
                                            <td>
                                                <asp:LinkButton runat="server" ID="nsion" OnClick="nsion_Click"></asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton runat="server" ID="nsio2" OnClick="nsio2_Click">:-)</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <%--</form>--%>
                            </tbody>
                        </table>
                    </div>

                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <div class="col-lg-4">מקום לפרסומות<a runat="server" onserverclick="Unnamed_ServerClick">fgxdf</a></div>
        <!-- /.col-lg-12 -->
    </div>



</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
    <asp:Button ID="aaaaaaaaa" runat="server" OnClick="aaaaaaaaa_Click" Visible="false" />
    <script>
        //selectTaeter(taecherid)
        //{
        //    //‏$("#scripts_aaaaaaaaa").click();
        //    nn = (this).attr('name');
        //    window.location = "~/WebForm4.aspx";
        //}


        //$("#modlprop").click(function () {
        //    alert("הצליח");
        //});
        // $("#Home").css("background - color: #eee;");
        function func(index) {
            $(index).click();
        }
    </script>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
