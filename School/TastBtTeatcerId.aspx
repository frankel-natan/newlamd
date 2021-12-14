<%@ Page Title="" Language="C#" MasterPageFile="~/School/SchoolMaster.Master" AutoEventWireup="true" CodeBehind="TastBtTeatcerId.aspx.cs" Inherits="LamedNetLite.TastBtTeatcerId" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">
    רשימת טסטים למורה
    <asp:Label runat="server" ID="aa"></asp:Label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="col-md-8">
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
            <thead>
                <tr>
                    <th>מצב טסט</th>
                    <th>תאריך טסט</th>
                    <th>תאריך הזמנה</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="RptDataTable" runat="server" OnItemDataBound="RptDataTable_ItemDataBound">
                    <ItemTemplate>
                        <tr class="odd gradeX">
                            <td><%#Eval("nameStatus") %></td>
                            <td>
                                <div runat="server" id="dateT"><%#Eval("TestRequestDate") %></div>
                            </td>
                            <td>
                                <div runat="server" id="dateO"></div>
                            </td>
                        </tr>
                    </ItemTemplate>

                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
