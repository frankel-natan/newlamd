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

        function upp() {
            //let a = $("#Option").text();
            //let c = $("#selecCity option:selected").text();
            var conceptName = $('#selecCity').find(":selected").text();//חילוץ הבחירה טקסט
            var b, a0, a1;
            a1 = $("#selecCity option:selected").val();//חילוץ ID חדש
            if ($("#main_areName").attr("data-value") != "-1" && $("#main_areName").attr("data-value") != "") {

                b = $("#main_areName").val() + ", " + conceptName;//שרשור הבחירה
                a0 = $("#main_areName").attr("data-value");//חילוץ ID של קיים
                $("#main_areName").attr("data-value", a0 + "," + a1);//השמה חדשה של ID ערים
                $("#main_dataA").val($("#main_areName").attr("data-value"));

            }
            else {
                b = conceptName;
                $("#main_areName").attr("data-value", a1);//השמה חדשה של ID ערים
                $("#main_dataA").val($("#main_areName").attr("data-value"));
            }
            $("#main_areName").val(b);//השמה חדשה
            $("#main_areName").attr("value", b);
            $("#main_dataA").val($("#main_areName").attr("data-value"));
            alert($("#main_areName").attr("data-value")); //בדיקה          
        };
        function dellCity() {
            $("#main_areName").val("");
            $("#main_areName").attr("data-value", "-1");
            $("#main_dataA").val("-1");
        }







    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">
    <div id="massegup">
        <div class="alert alertGreen pull-center" id="innerMess" style="display: none;"><strong>הפרטים עודכנו בהצלחה!</strong></div>
    </div>
    עדכון פרטים מנהל בית הספר

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
            <select class="form-control" id="selectedm" name="seleStatus">
                <option id="see" runat="server" class="form-control" selected></option>
                <option id="hid" class="form-control" runat="server"></option>
            </select>
        </div>
        <div class="form-group col-md-5">
            <label for="typeLic1">סוג רישיון</label>
            <select class="form-control" id="typeLic1">
                <option id="typeLics" runat="server" class="form-control" selected></option>
                <option id="typeLicn" class="form-control" runat="server"></option>
                <option id="typeLicn2" class="form-control" runat="server"></option>
            </select>
        </div>
        <div class="form-group col-md-5">
            <label for="areName">אזור/י פעילות</label>
            <input runat="server" class="form-control" id="areName" />
            <input runat="server" type="hidden" id="dataA" />
            <a href="#" data-toggle="modal" data-target="#myModal">לשינוי לחץ כאן</a>

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content ">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">בחר עיר מהרשימה שברצונך להוסיף</h4>
                        </div>
                        <div class="modal-body" style="height: 70px">
                            <div class="form-group col-3">
                                <select class="form-control" id="selecCity" name="sCity">
                                    <asp:Repeater runat="server" ID="repeaterCity">
                                        <ItemTemplate>
                                            <option id="Option" class="form-control" value="<%#Eval("id") %>"><%#Eval("namecity") %></option>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" data-dismiss="modal" id="upd" onclick="upp()">עדכן</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal" id="res" onclick="dellCity()">איפוס ערים</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">סגור</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group col-md-5">
            <label for="typeLic5">סוג רישיון</label>
            <select class="form-control" id="typeLic5" name="typeL">
                <option id="Option1" runat="server" class="form-control" selected></option>
                <asp:Panel ID="contentArea" runat="server">
                </asp:Panel>
            </select>
        </div>
        <div class="form-group col-md-5">
            <label for="payCunt">מספר תשלומים</label>
            <input type="text" runat="server" class="form-control" id="payCunt">
        </div>

    </div>

    <div class="col-md-10" style="text-align: center;">
        <button id="Update" type="button" runat="server" onserverclick="btnUpdate_Click" class="btn btn-primary">עדכן פרטים</button>

    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
