<%@ Page Title="" Language="C#" MasterPageFile="~/School/SchoolMaster.Master" AutoEventWireup="true" CodeBehind="receivingPaymentPage.aspx.cs" Inherits="LamedNetLite.receivingPaymentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
    <link href="Css/MyCss.css" rel="stylesheet" />
    <link href="Css/MyCss.css" rel="stylesheet" />
    <script>
        function MyFunction() {
            alert(' :-) ');
        };
        function noMess() {
            $(document).ready(
                $("#innerMess").fadeOut()
            );
        }
        function yesmess() {
            $(document).ready(
                $("#innerMess").fadeIn(),
                setTimeout(noMess, 5000)
            );
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">
    <div id="massegup">
        <div class="alert alertGreen pull-center" id="innerMess" style="display: none;"><strong>הפרטים עודכנו בהצלחה!</strong></div>
    </div>
    קליטת תשלום
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="form-group col-md-5" >
        <label for="sel1">נא בחר את שם המורה מתוך הרשימה</label>
        <select class="form-control" id="sel1" name="idSelectTae">
            <asp:Panel ID="contentTeachers" runat="server">
                </asp:Panel>
        </select>
    </div>
    <div class="form-group col-md-5">
            <label for="payy">סכום</label>
            <input type="text" runat="server" class="form-control" id="payy" placeholder="נא הזן סכום">
        </div>
    <div class="col-md-10" style="text-align: center;">
        <button id="Update" type="button" runat="server" onserverclick="Update_ServerClick" class="btn btn-primary">עדכן פרטים</button>

    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
