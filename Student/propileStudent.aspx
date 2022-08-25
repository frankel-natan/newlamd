<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="propileStudent.aspx.cs" Inherits="LamedNetLite.propileStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="panel panel-yellow" style="box-shadow: 10px 10px rgb(140 140 140);">
                    <div class="panel-heading" style="text-align: center;">
                        <h4>הפרטים שלי</h4>
                    </div>
                    <div class="panel-body">
                        <div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="names">שם:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="names" name="email">
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="place">כתובת:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="place" name="text">
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="poneS">טלפון:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="poneS" name="text">
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="userS">אימייל:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="userS" name="text">
                                </div>
                            </div>
                        </div>
                        <div>
                            <br />
                            <br />
                            <div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="ids">מספר זהות:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="ids" name="text" onkeydown="return false">
                                    </div>
                                </div>
                            </div>
                            <br />
                            <br />
                            <div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="passS">סיסמה:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="passS" name="text">
                                    </div>
                                </div>
                            </div>
                            <br />
                            <br />
                            <div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="adds">תאריך הצטרפות:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="adds" name="text" onkeydown="return false">
                                    </div>
                                </div>
                            </div>
                            <br />
                            <br />
                            <div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="sel2">סוג רישיון:</label>
                                    <select class="form-control col-sm-6" id="sel2">
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12" style="text-align: center;">
                                <button class="btn btn-primary" style="color: #f52107; background-color: #faf607; border-color: #ede605" onclick="send()">
                                    עדכן</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="panel panel-green" style="box-shadow: 10px 10px rgb(140 140 140);">
                    <div class="panel-heading" style="text-align: center;">
                        <h4>פרטי המורה שלי</h4>
                    </div>
                    <div class="panel-body">
                        <div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="nameT">שם:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="nameT" name="email" onkeydown="return false">
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="poneT">טלפון:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="poneT" name="text" onkeydown="return false">
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="emailT">אימייל:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="emailT" name="text" onkeydown="return false">
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="prices">מחיר לשיעור:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="prices" name="text" onkeydown="return false">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
    <script>
        var idS = Number('<%=Session["StudentId"] %>');//שליפה מסשן
        var StudentAntTeacher;
        function teacertostudent(ids) {
            $.ajax({
                url: "/api/v1/studentAntTeacher/" + ids,
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                    StudentAntTeacher = [];
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        StudentAntTeacher = JSON.parse(data);
                        idT = StudentAntTeacher[0].TeacherId1;
                        page();
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }//חילוץ פרטי מורה ותלמיד--1
        function page() {
            selectLicensAjax(StudentAntTeacher[0].LicenseTypeID);
            $("#names").attr("placeholder", StudentAntTeacher[0].StudentName);
            $("#nameT").attr("placeholder", StudentAntTeacher[0].TeacherName);
            $("#poneT").attr("placeholder", StudentAntTeacher[0].Phone1);
            $("#poneS").attr("placeholder", StudentAntTeacher[0].Phone);
            $("#emailT").attr("placeholder", StudentAntTeacher[0].UserName1);
            $("#passS").attr("placeholder", StudentAntTeacher[0].Password);
            $("#place").attr("placeholder", StudentAntTeacher[0].GatheringPlace);
            $("#ids").attr("placeholder", StudentAntTeacher[0].ID);
            $("#userS").attr("placeholder", StudentAntTeacher[0].userName);
            $("#prices").attr("placeholder", StudentAntTeacher[0].PricePerLesson);
            var tamp = StudentAntTeacher[0].DateAdded.split("T")[0];
            var tamp2 = tamp.split("-");
            var tamp3 = tamp2[2] + "/" + tamp2[1] + "/" + tamp2[0];
            $("#adds").attr("placeholder", tamp3);
        }
        var c;
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
        teacertostudent(idS);
        document.getElementById("nametitel").innerHTML = "הפרופיל שלי ";
        var jsstudentAJAX;
        function send() {
            jsstudentAJAX = { ...StudentAntTeacher };
            jsstudentAJAX = {
                'StudentId': StudentAntTeacher[0].StudentId,
                'TeacherId': StudentAntTeacher[0].TeacherId,
                'StatuseId': StudentAntTeacher[0].StatuseId,
                'StudentName': (names.value ? names.value : names.placeholder),
                'ID': (ids.value ? ids.value : ids.placeholder),
                'Phone': (poneS.value ? poneS.value : poneS.placeholder),
                'UserName': (userS.value ? userS.value : userS.placeholder),
                'Password': (passS.value ? passS.value : passS.placeholder),
                'LicenseTypeID': (document.querySelector('#sel2').value),
                'GatheringPlace': (place.value ? place.value : place.placeholder),
                'PricePerLesson': StudentAntTeacher[0].PricePerLesson,
                'DateAdded': (StudentAntTeacher[0].DateAdded).replace('T', ' '),
                'ProfilePicName': 'dif'
            }
            $.ajax({
                url: "/api/v1/lassonstudent",
                type: "POST",
                dataType: "json",
                data: jsstudentAJAX,
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        teacertostudent(idS);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
    </script>
</asp:Content>
