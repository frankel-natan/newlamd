<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="propile.aspx.cs" Inherits="LamedNetLite.propile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    הפרופיל שלי
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="container">

        <!-- Trigger the modal with a button -->

        <!-- Modal -->


        <!-- Modal content-->
        <div class="modal-content col-md-8">
            <div class="row" style="padding: 30px;">
                <div class="col-md-6">
                    <div class="form-group ">
                        <label for="usr">שם פרטי ומשפחה:</label>
                        <input type="text" class="form-control" id="usr">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group ">
                        <label for="usr1">טלפון:</label>
                        <input type="text" class="form-control" id="usr1">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group ">
                        <label for="usr2">שם משתמש:</label>
                        <input type="text" class="form-control" id="usr2">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="usr3">סיסמה:</label>
                        <input type="text" class="form-control" id="usr3">
                    </div>
                </div>
                <div class="col-md-6">

                    <div class="form-group">
                        <label for="usr4">סטאטוס</label>
                        <select class="form-control" id="usr4" style="text-align: center;">
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="sel2">סוג רשיון</label>
                        <select class="form-control" id="sel2" style="text-align: center;">
                        </select>
                    </div>
                </div>
                <div class="col-md-6" style="text-align-last: center;">
                    <button class="btn btn-success" style="text-align-last: center;" onclick="updetStudent()">עדכן</button>
                </div>
                <div class="col-md-6" style="text-align-last: center;">
                    <button class="btn btn-danger" style="text-align-last: center;" onclick="noupdetStudent()">בטל</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="js" runat="server">
    <script>
        var username = '<%= Session["TeacherId"] %>';//שליפה מסשן
        var c = [];
        var a = [];
        var b = [];
        function selectLicensAjax(x) {
            $.ajax({
                url: "/api/v1/LiceneType",
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        c = JSON.parse(data);
                        c.map((name, i) => {
                            if (name.Id === x) {
                                $('#sel2').append(`<option selected value="${name.Id}">${name.name}</option>`);
                            }
                            else {
                                $('#sel2').append(`<option value="${name.Id}">${name.name}</option>`);
                            }
                        })
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function teacerid(x) {
            $.ajax({
                url: "/api/v1/GetTeachers/" + x,
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        a = JSON.parse(data);
                        page2();
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function selectStatusAjax(x) {
            $.ajax({
                url: "/api/v1/selectStatusStudent",
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        b = JSON.parse(data);
                        b.map((name, i) => {
                            if (name.Id === x) {
                                $('#usr4').append(`<option selected value="${name.Id}">${name.name}</option>`);
                            }
                            else {
                                $('#usr4').append(`<option value="${name.Id}">${name.name}</option>`);
                            }
                        })
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function page2() {
            $("#usr").attr('placeholder', a[0]['TeacherName']);
            $("#usr1").attr('placeholder', a[0]['Phone']);
            $("#usr2").attr('placeholder', a[0]['UserName']);
            $("#usr3").attr('placeholder', a[0]['Password']);
            selectStatusAjax(a[0]['StatuseId']);
            selectLicensAjax(a[0]['LicenseTypesId']);

        }
        teacerid(username);
        function updetStudent() {
            jsstudent = { ...a[0] };//העתקת גי'סון ולא מצביע(שלא ישנה את המקור)
            jsstudent.TeacherName = (usr.value ? usr.value : usr.placeholder);//$("#Place").val();
            jsstudent.LicenseTypesId = document.querySelector('#sel2').value;
            jsstudent.Phone = (usr1.value ? usr1.value : usr1.placeholder);
            jsstudent.UserName = (usr2.value ? usr2.value : usr2.placeholder);
            jsstudent.Password = (usr3.value ? usr3.value : usr3.placeholder);
            jsstudent.StatusId = document.querySelector('#usr4').value;
            //jsstudent.StatuseId = (document.querySelector('#usr4').value);//זמני
            $.ajax({
                url: "/api/v1/GetTeachers/" + username,
                type: "PUT",
                dataType: "json",
                data: jsstudent,
                beforeSend: function () {
                    
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        yesmess();
                        teacerid(username);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function noupdetStudent() {
            teacerid(username);
        }

    </script>
</asp:Content>
