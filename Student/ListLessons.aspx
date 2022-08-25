<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="ListLessons.aspx.cs" Inherits="LamedNetLite.ListLessons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="panel panel-yellow">
                    <div class="panel-heading">שיעורים בהמתנה לאישור</div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>תאריך</th>
                                    <th>התחלה</th>
                                    <th>סיום</th>
                                </tr>
                            </thead>
                            <tbody id="Tabel1">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="panel panel-success">
                    <div class="panel-heading">שיעורים מאושרים</div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>תאריך</th>
                                    <th>התחלה</th>
                                    <th>סיום</th>
                                </tr>
                            </thead>
                            <tbody id="Tabel2">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="panel panel-green">
                    <div class="panel-heading">שיעורים שבוצעו</div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>תאריך</th>
                                    <th>התחלה</th>
                                    <th>סיום</th>
                                </tr>
                            </thead>
                            <tbody id="Tabel3">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="panel panel-red">
                    <div class="panel-heading">שיעורים שלא בוצעו</div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>תאריך</th>
                                    <th>התחלה</th>
                                    <th>סיום</th>
                                </tr>
                            </thead>
                            <tbody id="Tabel4">
                            </tbody>
                        </table>
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
        var arrlessonajax;
        var idT;
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
                        page0(ids);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });

        }//חילוץ פרטי מורה ותלמיד--1
        teacertostudent(idS);
        function page0(id) {
            $.ajax({
                url: "/api/v1/studentLessond/" + id,
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                    arrlessonajax = [];
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        arrlessonajax = JSON.parse(data);
                        Tabelstringes();
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }//חילוץ שיעורי התלמיד--2
        var tampString1 ="";
        var tampString2 ="";
        var tampString3 ="";
        var tampString4 ="";
        function Tabelstringes() {
            for (x of arrlessonajax) {
                var da2 = x.DateLesson.split("T")[0];
                var da = da2.split("-")[2] + "/" + da2.split("-")[1] + "/" + da2.split("-")[0];
                var Ts = x.BeginningTime.split(":")[0] + ":" + x.BeginningTime.split(":")[1];
                var Te = x.EndTime.split(":")[0] + ":" + x.EndTime.split(":")[1];
                switch (x.StatuseId1) {
                    case 1:
                        tampString1 += "<tr><td>" + da + "</td><td>" + Ts + "</td><td>" + Te + "</td></tr>";
                        break;
                    case 2:
                        tampString2 += "<tr><td>" + da + "</td><td>" + Ts + "</td><td>" + Te + "</td></tr>";
                        break;
                    case 3:
                        tampString3 += "<tr><td>" + da + "</td><td>" + Ts + "</td><td>" + Te + "</td></tr>";
                        break;
                    case 4:
                        tampString4 += "<tr><td>" + da + "</td><td>" + Ts + "</td><td>" + Te + "</td></tr>";
                        break;
                }
            }
            document.getElementById('Tabel1').innerHTML = tampString1;
            document.getElementById('Tabel2').innerHTML = tampString2;
            document.getElementById('Tabel3').innerHTML = tampString3;
            document.getElementById('Tabel4').innerHTML = tampString4;
            document.getElementById("nametitel").innerHTML = "השיעורים של  " + StudentAntTeacher[0].StudentName;
        }

    </script>
</asp:Content>
