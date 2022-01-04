<%@ Page Title="" Language="C#" MasterPageFile="~/School/SchoolMaster.Master" AutoEventWireup="true" CodeBehind="SchoolUpdateDetails.aspx.cs" Inherits="LamedNetLite.SchoolUpdateDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
    <link href="Css/MyCss.css" rel="stylesheet" />
    <script>
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
    עדכון פרטים
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <%--<form runat="server">--%>
        <div class="form-row">
            <div class="form-group col-md-5">
                <label for="inputName">שם בית ספר</label>
                <input type="text" runat="server" class="form-control" id="inputName" placeholder="שם בית ספר">
            </div>
            <div class="form-group col-md-5">
                <label for="inputPhone">טלפון</label>
                <input type="tel" runat="server" class="form-control" id="inputPhone" placeholder="טלפון">
            </div>
            <div class="form-group col-md-5">
                <label for="inputEmail">אימייל</label>
                <input type="text" runat="server" class="form-control" id="inputEmail" placeholder="אימייל">
            </div>
            <div class="form-group col-md-5">
                <label for="inputPassword">סיסמא</label>
                <div class="input-group" id="show_hide_password">
                    <input runat="server" class="form-control" id="inputPassword" placeholder="סיסמה">
                    <div class="input-group-addon">
                        <a href="#"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>
            <div class="form-group col-md-5">
                <label for="inputStatus">מצב</label>
                <select class="form-control" id="inputStatus" name="typeL">
                    <option id="Option1" runat="server" class="form-control" selected></option>
                    <asp:Panel ID="contentArea" runat="server">
                    </asp:Panel>
                </select>
            </div>

            <div class="col-md-10" style="text-align: center;">
                <button id="Update" type="button" runat="server" onserverclick="btnUpdate_Click" class="btn btn-primary">עדכן פרטים</button>

            </div>
        </div>
        <%--</form>--%>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
