<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="ListStudent.aspx.cs" Inherits="LamedNetLite.ListStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    רשימת תלמידים
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div id="tabel" style="width:80%">
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog" style="text-align: center;">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="titel">כותרת</h4>
                </div>
                <div class="modal-body">
                    <div style="display: flex;">
                        <div style="width: 40%;">
                            <div class="form-group">
                                <label for="Place">שם פרטי ומשפחה</label>
                                <input class="form-control input-sm" id="nameFamaly" type="text">
                            </div>
                            <div class="form-group">
                                <label for="Place">כתובת</label>
                                <input class="form-control input-sm" id="Place" type="text">
                            </div>
                            <div class="form-group">
                                <label for="idnumber">מספר זהות</label>
                                <input class="form-control input-sm" id="idnumber" type="text" disabled>
                            </div>
                            <div class="form-group">
                                <label for="phone">טלפון</label>
                                <input class="form-control input-sm" id="phone" type="text">
                            </div>
                            <div class="form-group">
                                <label for="email">דוא"ל</label>
                                <input class="form-control input-sm" id="email" type="text">
                            </div>
                            <div class="form-group">
                                <label for="price">מחיר לשיעור</label>
                                <input class="form-control input-sm" id="price" type="text">
                            </div>
                        </div>
                        <div style="width: 60%; text-align: -webkit-center;">
                            <img src="../Student/images/cat.jpg" class="img-circle" alt="Cinque Terre" width="304" height="236">
                            <div class="form-group" style="width: 50%; text-align: center">
                                <label for="sel1">סטאטוס תלמיד</label>
                                <select class="form-control" id="sel1" style="text-align: center;">
                                </select>
                            </div>
                            <div class="form-group" style="width: 50%; text-align: center">
                                <label for="sel2">סוג רשיון</label>
                                <select class="form-control" id="sel2" style="text-align: center;">
                                </select>
                            </div>
                            <div>
                                התקדמות תלמיד
                            </div>
                            <div class="progress" style="width: 80%; text-align: center">
                                <div class="progress-bar-success progress-bar-striped active" id="grf" role="progressbar"
                                    aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" id="footerButten">
                </div>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="js" runat="server">
    <script>
        var a;
        var b;
        var c;
        var stringta;
        var tamp = '';
        function lists(x) {
            $.ajax({
                url: "/api/v1/lassonstudent/" + x,
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        alert(data);
                        a = JSON.parse(data);
                        for (var i = 0; i < a.length; i++) {
                            tamp += '<div class="alert alert-success alert-dismissible fade in">' +
                                '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>' +
                                a[i]['StudentName'] +
                                '</strong>  &nbsp מספר השיעורים שביצע : &nbsp&nbsp ' + a[i]['one'] +
                                '</div > ';
                        }
                        for (var i = 0; i < a.length; i++) {
                            tamp += '<div class="panel-group">' +
                                '<div class="panel panel-success">' +
                                '<div class="panel-heading">' +
                                '<h4 class="panel-title">' +
                                '<a data-toggle="collapse" style="text-decoration: none;" href="#collapse' + [i] + '">' + a[i]['StudentName'] + '&nbsp כתובת : &nbsp  ' + a[i]['GatheringPlace'] + '&nbspטלפון: &nbsp' + a[i]['Phone'] + '&nbsp&nbspמצב:&nbsp' + a[i]['StatuseName'] + '</a>' +
                                '</h4>' +
                                '</div>' +
                                '<div id="collapse' + [i] + '" class="panel-collapse collapse">' +
                                '<ul class="list-group">' +
                                '<li class="list-group-item">שיעורים שבוצעו : ' + a[i]['three'] + '</li > ' +
                                '<li class="list-group-item">שיעורים שלא בוצעו : ' + a[i]['fore'] + '</li>' +
                                '<li class="list-group-item">שיעורים ממתינים : ' + a[i]['tow'] + '</li >' +
                                '<li class="list-group-item">שיעורים ממתינים לאישור : ' + a[i]['one'] + '</li>' +
                                '</ul>' +
                                '<div class="panel-footer" style="text-align: end;">' + '<button  type="button" onclick="func(this)" id="' + a[i]['StudentId'] + '"value="' + [i] + '" class="btn btn-success bid" data-toggle="modal" data-target="#myModal">לפרטי התלמיד </button>' + '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>';
                        }
                        document.getElementById('tabel').innerHTML = tamp;
                        tamp = "";
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function page() {
            var username = '<%= Session["TeacherId"] %>';//שליפה מסשן
            lists(username);//לשנות ולקחת מסשן

        }
        page();
        function func(ew) {
            $("#titel").text(a[ew.value]['StudentName']);
            $("#Place").attr('placeholder', a[ew.value]['GatheringPlace']);
            $("#nameFamaly").attr('placeholder', a[ew.value]['StudentName']);
            //$("#Place").attr('value',);
            document.getElementById('Place').value = "";//פועל
            //$("#Place").text($("#Place").text() + "  " + a[ew.value]['GatheringPlace']);
            //$("#idnumber").text($("#idnumber").text() + " " + a[ew.value]['ID']);
            $("#idnumber").attr('placeholder', a[ew.value]['ID']);
            $("#phone").attr('placeholder', a[ew.value]['Phone']);
            $("#email").attr('placeholder', a[ew.value]['userName']);
            $("#price").attr('placeholder', a[ew.value]['PricePerLesson']);
            var maximom = (a[ew.value]['LicenseTypeID'] == 1 ? 30 : 20);
            var grfText = Math.round((a[ew.value]['three'] * 100) / maximom) + "%";//הוחלט ש20 זה כמות השיעורים
            $('#grf').css('width', grfText);
            $('#grf').text(grfText);
            clairValue(['Place', 'nameFamaly', 'phone', 'idnumber', 'email', 'price']);
            $("#sel1 option").each(function () {
                $(this).remove();
            });
            $("#sel2 option").each(function () {
                $(this).remove();
            });
            $("#footerButten button").each(function () {
                $(this).remove();
            });
            $("#footerButten").append(`<button type="button" id=${a[ew.value]['StudentId']} value=id=${a[ew.value]['StudentId']} class="btn btn-success" onclick="updetStudent(this)" data-dismiss="modal">עדכן</button>`);
            $("#footerButten").append(`<button type="button" class="btn btn-info" data-dismiss="modal">סגור</button>`);
            selectStatusAjax(a[ew.value]['StatuseId']);
            selectLicensAjax(a[ew.value]['LicenseTypeID']);
        }
        jsstudent = [];
        jsstudentAJAX = [];
        function updetStudent(bw) {
            for (let name of a) {
                if (name.StudentId == bw.id) {
                    jsstudent = { ...name };//העתקת גי'סון ולא מצביע(שלא ישנה את המקור)
                }
            }
            jsstudent.GatheringPlace = (Place.value ? Place.value : Place.placeholder);//$("#Place").val();
            jsstudent.StatuseId = document.querySelector('#sel1').value;//($('#sel1 option:selected').val ? $('#sel1 option:selected').val : 55);//תיבת בחירה
            jsstudent.StudentName = (nameFamaly.value ? nameFamaly.value : nameFamaly.placeholder);
            jsstudent.ID = (idnumber.value ? idnumber.value : idnumber.placeholder);
            jsstudent.Phone = (phone.value ? phone.value : phone.placeholder);
            jsstudent.userName = (email.value ? email.value : email.placeholder);
            jsstudent.LicenseTypeID = document.querySelector('#sel2').value;//זמני
            jsstudent.PricePerLesson = (price.value ? price.value : price.placeholder);
            delete jsstudent.Id1;
            delete jsstudent.StatusName;
            delete jsstudent.fore;
            delete jsstudent.one;
            delete jsstudent.three;
            delete jsstudent.tow;
            jsstudentAJAX = {
                'StudentId': jsstudent.StudentId,
                'TeacherId': jsstudent.TeacherId,
                'StatuseId': jsstudent.StatuseId,
                'StudentName': jsstudent.StudentName,
                'ID': jsstudent.ID,
                'Phone': jsstudent.Phone,
                'UserName': jsstudent.userName,
                'Password': jsstudent.Password,
                'LicenseTypeID': jsstudent.LicenseTypeID,
                'GatheringPlace': jsstudent.GatheringPlace,
                'PricePerLesson': jsstudent.PricePerLesson,
                'DateAdded': (jsstudent.DateAdded).replace('T', ' '),
                'ProfilePicName': 'dif'
            }
            $.ajax({
                url: "/api/v1/lassonstudent",
                type: "POST",
                dataType: "json",
                data: jsstudentAJAX,
                beforeSend: function () {
                    alert(jsstudent.StudentId);
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        document.getElementById('tabel').innerHTML = "";
                        page();
                        yesmess();
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });

        }
        function asi() {
            var v = Place.value;
            alert(v);
            var bla = (Place.value ? Place.value : Place.placeholder);
            alert(bla);
        }
        function clairValue(idinput) {
            for (let itam of idinput) {
                document.getElementById(itam).value = "";//פועל
            }
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
                                $('#sel1').append(`<option selected value="${name.Id}">${name.name}</option>`);
                            }
                            else {
                                $('#sel1').append(`<option value="${name.Id}">${name.name}</option>`);
                            }
                        })
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
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
    </script>
</asp:Content>
