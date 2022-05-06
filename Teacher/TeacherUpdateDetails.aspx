<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="TeacherUpdateDetails.aspx.cs" Inherits="LamedNetLite.TeacherUpdateDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/css/select2.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    עדכון פרטים
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <form runat="server">
            <div class="form-row">
                <div class="form-group col-md-5">
                    <label for="inputName">שם מלא</label>
                    <input type="text" runat="server" class="form-control" id="inputName" placeholder="שם מלא">
                </div>
                <div class="form-group col-md-5">
                    <label for="inputID">ת.ז</label>
                    <input type="text" runat="server" class="form-control" id="inputID" placeholder="ת.ז">
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
                            <a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>
                <div class="form-group col-md-5">
                    <label for="exampleFormControlSelect1">בחר סוג/י רישיונ/ות</label>
                    <select class="form-control" id="LicenseTypesSelect" name="LicenseTypesSelect">
                        <asp:Repeater runat="server" ID="LicenseTypes" OnItemDataBound="LicenseTypes_ItemDataBound">
                            <ItemTemplate>
                                <option runat="server" id="option"></option>
                            </ItemTemplate>
                        </asp:Repeater>

                    </select>
                </div>
                <input type="hidden" runat="server" id="selectedLicenseTypes" />
                <div class="form-group col-md-5">
                    <label for="StudyAreasSelect">אזורי לימוד</label>
                    <div class="row">
                        <select id="StudyAreasSelect" class="select2" name="state" multiple="multiple">
                            <asp:Repeater runat="server" ID="StudyAreas" OnItemDataBound="StudyAreas_ItemDataBound">
                                <ItemTemplate>
                                    <option runat="server" id="option" value=""></option>
                                </ItemTemplate>
                            </asp:Repeater>
                        </select>
                    </div>
                    <input type="hidden" runat="server" id="selectedStudyAreas" />
                </div>

                <div class="col-md-10" style="text-align: center;">
                    <button id="Update" type="button" runat="server" onserverclick="btnUpdate_Click" class="btn btn-primary">עדכן פרטים</button>

                </div>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="js" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/select2@4.0.12/dist/js/select2.min.js"></script>

    <script>
        $(document).ready(function () {
            $("#show_hide_password a").on('click', function (event) {
                event.preventDefault();
                if ($('#show_hide_password input').attr("type") == "text") {
                    $('#show_hide_password input').attr('type', 'password');
                    $('#show_hide_password i').addClass("fa-eye-slash");
                    $('#show_hide_password i').removeClass("fa-eye");
                } else if ($('#show_hide_password input').attr("type") == "password") {
                    $('#show_hide_password input').attr('type', 'text');
                    $('#show_hide_password i').removeClass("fa-eye-slash");
                    $('#show_hide_password i').addClass("fa-eye");
                }
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(() => {
            var selectedStudyAreas = $("#main_selectedStudyAreas").val();
            selectedStudyAreas = selectedStudyAreas.split(',');
            $('#StudyAreasSelect').val(selectedStudyAreas);
            $('#StudyAreasSelect').trigger('change');

            var selectedLicenseTypes = $('#main_selectedLicenseTypes').val();
            $('#LicenseTypesSelect').val(selectedLicenseTypes);

        });
        $("select").prop("selectedIndex", -1);//מנטרל בחירה אוטומטית של האפשרות הראשונה



        $(".select2").select2({
            //data: data,
            placeholder: "בחר אזורי לימוד",
            allowClear: true
        });

        $('#StudyAreasSelect').on('select2:select', function (e) {
            //var data = e.params.data;
            //console.log(data);
            $("#selectedStudyAreas").val("");
            var str = "";
            var selectedArr = $('#StudyAreasSelect').find(':selected');
            for (var i = 0; i < selectedArr.length; i++) {
                var a = selectedArr[i];
                str += a.value + ",";
                console.log(a.value);
                console.log("        ");

            }
            str = str.substring(0, str.length - 1);//מוחק את הפסיק האחרון המיותר
            $("#selectedStudyAreas").val(str);

        });

        $('#LicenseTypesSelect').on('change', function (e) {
            var selectedArr = $('#LicenseTypesSelect').find(':selected');
            var a = selectedArr[0];
            $("#selectedLicenseTypes").val(a.value);
        });


    </script>

</asp:Content>
