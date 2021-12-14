<%@ Page Title="" Language="C#" MasterPageFile="~/School/SchoolMaster.Master" AutoEventWireup="true" CodeBehind="ajaxxx.aspx.cs" Inherits="LamedNetLite.ajaxxx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <input type="text" id="ajax2" />
    <button type="button" id="aaa" onclick="ajax1($('#ajax2').val())"></button>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
    <script>
        

        function ajax1(x)
        {
            $.ajax({
                url: "/api/v1/thchers",
                type: "POST",
                dataType: "JSON",
                data: x,
                beforeSend: function () {
                },
                success: function (raaaa) {
                    if (raaaa == 'invalid') {
                        console.log('error');
                    }
                    else {
                        alert(raaaa)

                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        




    </script>
</asp:Content>

