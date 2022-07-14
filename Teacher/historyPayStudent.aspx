<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="historyPayStudent.aspx.cs" Inherits="LamedNetLite.historyPayStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    טבלת תשלומי תלמידים
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-lg-3">
            <div class="form-group">
                <label for="selectStudent">למיון לפי תלמיד </label>
                <div style="display: flex;">
                    <select class="form-control" id="selectStudent" style="text-align: center;">
                    </select>
                    <button type="button" class="btn btn-primary" onclick="serch();">חפש</button>
                </div>
            </div>
        </div>
    </div>
    <table class="table table-striped" style="width: 80%; border: inset;">
        <thead>
            <tr>
                <th scope="col">מספר תשלום</th>
                <th scope="col">שם</th>
                <th scope="col">תאריך </th>
                <th scope="col">סכום</th>
                <th scope="col">יתרה</th>
            </tr>
        </thead>
        <tbody id="tabel">
        </tbody>
    </table>

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
        var username = '<%= Session["TeacherId"] %>';//שליפה מסשן
        var a = [];
        var htmldinamic;
        var cuont;
        function page(username) {
            $.ajax({
                url: "/api/v1/payStudent/" + username,
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
                        addColun(a);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function craList(list) {
            htmldinamic = '<ul class="list-group">';
            var i = 1;
            var count = 0;

            $("#selectStudent option").each(function () {
                $(this).remove();
            });
            for (var itam of list) {
                var arrdate = (itam.PaymentDate).split("T");
                var alldate = (arrdate[0]).split("-");
                var datetohtml = alldate[2] + '/' + alldate[1] + '/' + alldate[0];
                count += itam.Sum;
                htmldinamic += '<tr>' +
                    '<th scope="row">' + i + '</th >' +
                    '<td><a data-toggle="modal" href= "#myModal" class="alert-link" id = ' + itam.StudentId + ' onclick = "func(' + [i - 1] + ')" value ="' + [i - 1] + '" >' + itam.StudentName + '</a></td>' +
                    '<td>' + datetohtml + '&nbsp' + 'בשעה:&nbsp ' + arrdate[1] + '</td>' +
                    '<td>' + itam.Sum + '</td>' +
                    '<td>' + itam.pay + '</td>' +
                    '</tr >';
                i++;
                $('#selectStudent').append(`<option selected value="${itam.StudentId}">${itam.StudentName}</option>`);
            }
            htmldinamic += '</ul>';
            document.getElementById('tabel').innerHTML = htmldinamic;
            $('#selectStudent').append(`<option selected value="-1">בחר הכל</option>`);
            $("#selectStudent option").each(function (idx, val) {//מניעת כפילויות בתיבה
                $(this).siblings("[value='" + $(this).val() + "']").remove();
            });
        }
        function func(ew) {
            $("#titel").text(a[ew]['StudentName']);
            $("#Place").attr('placeholder', a[ew]['GatheringPlace']);
            $("#nameFamaly").attr('placeholder', a[ew]['StudentName']);
            //$("#Place").attr('value',);
            document.getElementById('Place').value = "";//פועל
            //$("#Place").text($("#Place").text() + "  " + a[ew.value]['GatheringPlace']);
            //$("#idnumber").text($("#idnumber").text() + " " + a[ew.value]['ID']);
            $("#idnumber").attr('placeholder', a[ew]['ID']);
            $("#phone").attr('placeholder', a[ew]['Phone']);
            $("#email").attr('placeholder', a[ew]['userName']);
            $("#price").attr('placeholder', a[ew]['PricePerLesson']);
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
            $("#footerButten").append(`<button type="button" id=${a[ew]['StudentId']} value=id=${a[ew]['StudentId']} class="btn btn-success" onclick="updetStudent(this)" data-dismiss="modal">עדכן</button>`);
            $("#footerButten").append(`<button type="button" class="btn btn-info" data-dismiss="modal">סגור</button>`);
            selectStatusAjax(a[ew]['StatuseId']);
            selectLicensAjax(a[ew]['LicenseTypeID']);
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
                        page(username);
                        yesmess();
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });

        }
        page(username);
        function serch() {
            htmldinamic = '<ul class="list-group">';
            var i = 1;
            var count = 0;
            if ((document.querySelector('#selectStudent').value) == -1) {
                page(username);
            }
            else {
                for (var itam of a) {
                    if ((document.querySelector('#selectStudent').value) == itam.StudentId) {
                        var arrdate = (itam.PaymentDate).split("T");
                        var alldate = (arrdate[0]).split("-");
                        var datetohtml = alldate[2] + '/' + alldate[1] + '/' + alldate[0];
                        count += itam.Sum;
                        htmldinamic += '<tr>' +
                            '<th scope="row">' + i + '</th >' +
                            '<td><a data-toggle="modal" href= "#myModal" class="alert-link" id = ' + itam.StudentId + ' onclick = "func(' + [i - 1] + ')" value ="' + [i - 1] + '" >' + itam.StudentName + '</a></td>' +
                            '<td>' + datetohtml + '&nbsp' + 'בשעה:&nbsp ' + arrdate[1] + '</td>' +
                            '<td>' + itam.Sum + '</td>' +
                            '<td>' + count + '</td>' +
                            '</tr >';
                        i++;
                    }
                }
                htmldinamic += '</ul>';
                document.getElementById('tabel').innerHTML = htmldinamic;
            }
        }
        function addColun(x) {
            cuont = 0;
            for (var i = x.length - 1; i >= 0; i--) {
                cuont += x[i]['Sum'];
                a[i].pay = cuont;
            }
            craList(a);
        }
    </script>
</asp:Content>
