<%@ Page Title="" Language="C#" MasterPageFile="~/School/SchoolMaster.Master" AutoEventWireup="true" CodeBehind="updetTaecher.aspx.cs" Inherits="LamedNetLite.updetTaecher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
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
    עדכון פרטים למנהל בית הספר

    <asp:Label runat="server" ID="nameScool"></asp:Label>

    <asp:Label runat="server" ID="Label2"></asp:Label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
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
            <label for="inputIdTe">מספר זהות</label>
            <input type="text" runat="server" class="form-control" id="inputIdTe">
        </div>
        <div class="form-group col-md-5">
            <label for="addTeather">תאריך הצטרפות</label>
            <input type="text" runat="server" class="form-control" id="addTeather">
        </div>
        <div class="form-group col-md-5">
            <label for="statusTeacher">מצב</label>
            <input type="text" runat="server" class="form-control" id="statusTeacher">
        </div>
       <%-- <div class="form-group col-md-5">
            <label for="selectedm1">מצב</label>
            <select class="form-select" aria-label="Default select example" size="1" id="selectedm1">
                <option id="see" runat="server" class="form-control" selected></option>
                <option id="hid" class="form-control" runat="server"></option>
            </select>
        </div>--%>
        <div class="form-group col-md-5">
            <label for="selectedm">מצב מתוקן</label>
            <select class="form-control" id="selectedm">
                <option id="see" runat="server" class="form-control" selected></option>
                <option id="hid" class="form-control" runat="server"></option>
            </select>
        </div>

        <div class="col-md-10" style="text-align: center;">
            <button id="Update" type="button" runat="server" onserverclick="btnUpdate_Click" class="btn btn-primary">עדכן פרטים</button>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
