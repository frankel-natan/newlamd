﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="StudentMain.aspx.cs" Inherits="LamedNetLite.StudentMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="js/jquery/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</asp:Content>
<asp:Content ContentPlaceHolderID="page_header" runat="server" ID="header">
    <button style="display: none" id="btn1" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
        Launch demo modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form runat="server" id="lessform">
                    <div class="modal-body">
                        <h6>בחר סוג שיעור</h6>
                        <div style="width: 300px" runat="server" id="radio">
                            <asp:Repeater runat="server" ID="rptLessTypes" OnItemDataBound="rptLessTypes_ItemDataBound">
                                <ItemTemplate>
                                    <div class="form-check form-check-inline" runat="server" dir="rtl">
                                        <asp:RadioButton
                                            Text=""
                                            runat="server"
                                            class="form-check-input"
                                            ID="LessTypeRb" />
                                        <%--                                        <label class="form-check-label" for="inlineRadio1">רגיל</label>--%>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            
                        </div>
                        <div id="ddlLess" style="grid-column: 1 / 3; grid-row: 1;">
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <%--                    <button type="button" class="btn btn-primary" id="btn">Save changes</button>--%>

                        <asp:Button runat="server" Text="הזמן שיעור" ID="btnSetLess" OnClick="btnSetLess_Click" />
                    </div>
                </form>

            </div>
        </div> 
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="main" ID="calendarView" runat="server">
    <div class="container bg-success ml-3">
        <div id="calendar"></div>
    </div>
    
    <br />


</asp:Content>
<asp:Content ContentPlaceHolderID="scripts" ID="js" runat="server">
    <script src="../Calendar/lib/main.js"></script>
    <link href="../Calendar/lib/main.css" rel="stylesheet" />
    <%--    <script src="StudEventsHandl.ashx"></script>--%>
    <asp:Literal runat="server" ID="ltrsrc"></asp:Literal>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/moment@2.27.0/min/moment.min.js'></script>

    <!-- the moment-to-fullcalendar connector. must go AFTER the moment lib -->
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/moment@5.5.0/main.global.min.js'></script>
    <script src="js/StudMainScript.js"></script>
</asp:Content>
