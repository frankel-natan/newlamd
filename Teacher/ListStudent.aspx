<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="ListStudent.aspx.cs" Inherits="LamedNetLite.ListStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    רשימת תלמידים
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div id="tabel">
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
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
                            <div class="form-group">
                                <label for="statusstudent">מצב תלמיד</label>
                                <input class="form-control input-sm" id="statusstudent" type="text">
                            </div>
                            <div id="PresentageComplishion"></div>
                        </div>
                        <div style="width: 60%; text-align: center;">
                            <img src="../Student/images/cat.jpg" class="img-circle" alt="Cinque Terre" width="304" height="236">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">סגור</button>
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
                                '<a data-toggle="collapse" style="text-decoration: none;" href="#collapse' + [i] + '">' + a[i]['StudentName'] + '&nbsp כתובת : &nbsp  ' + a[i]['GatheringPlace'] + '&nbspטלפון: &nbsp' + a[i]['Phone'] + '&nbsp&nbspמצב:&nbsp' + a[i]['StatusName'] + '</a>' +
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
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        lists(1);
        function func(ew) {
            $("#titel").text(a[ew.value]['StudentName']);
            $("#Place").attr('placeholder', a[ew.value]['GatheringPlace']);
            //$("#Place").attr('value',);
            document.getElementById('Place').value = "";//פועל
            //$("#Place").text($("#Place").text() + "  " + a[ew.value]['GatheringPlace']);
            //$("#idnumber").text($("#idnumber").text() + " " + a[ew.value]['ID']);
            $("#idnumber").attr('placeholder', a[ew.value]['ID']);
            $("#phone").attr('placeholder', a[ew.value]['Phone']);
            $("#email").attr('placeholder', a[ew.value]['userName']);
            $("#price").attr('placeholder', a[ew.value]['PricePerLesson']);
            $("#statusstudent").attr('placeholder', a[ew.value]['StatusName']);
            $("#PresentageComplishion").text('לעשות חישוב');
            clairValue(['Place', 'phone', 'idnumber', 'email', 'price', 'statusstudent', 'PresentageComplishion']);
        }
        jsstudent = []
        function upd(x) {
            for (let name of a) {
                if (name.StudentId === x) {
                    jsstudent = { ...name };//העתקת גי'סון ולא מצביע(שלא ישנה את המקור)
                }
            }
            $.ajax({
                url: "/api/v1/lassonstudent/" + x,
                type: "PUT",
                dataType: "JSON",
                data: tampVe = {
                    'StudentId': -1,
                    'TeacherId': username,
                    'StatuseId': slice2 + " 00:00",
                    'StudentName': $("#titel").value(),
                    'ID':"",
                    'Phone': "",
                    'userName': '',
                    'Password': '',
                    'LicenseTypeID': '',
                    'GatheringPlace': '',
                    'PricePerLesson': "",
                    'DateAdded':""
                } ,
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {

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
        //for (let name of a) {
        //    if (name.StudentId === 2) {
        //        alert(name.StudentId);
        //    }
        //}

    </script>
</asp:Content>
