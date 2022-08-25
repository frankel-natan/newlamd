<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="tabelPay.aspx.cs" Inherits="LamedNetLite.tabelPay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="panel panel-yellow">
                    <div class="panel-heading" style="text-align: center">תשלומים</div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>תאריך</th>
                                    <th>סכום</th>
                                    <th>יתרה</th>
                                </tr>
                            </thead>
                            <tbody id="Tabel1">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <div class="col-md-5">
                <div class="panel panel-success">
                    <div class="panel-heading" style="text-align: center">חיובים (שיעורים שבוצעו) </div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>תאריך</th>
                                    <th>סכום </th>
                                    <th>יתרה</th>
                                </tr>
                            </thead>
                            <tbody id="Tabel2">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="panel panel-green" id="balt">
                    <div class="panel-heading" style="text-align: center">יתרה </div>
                    <div class="panel-body">
                        <div id="bal" style="text-align:center"></div>
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
        var pays;
        var lestype1;
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
                        //idT = StudentAntTeacher[0].TeacherId1;
                        page0(ids);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });

        }//חילוץ פרטי מורה ותלמיד--1
        //teacertostudent(idS);
        function page0(ids) {
            $.ajax({
                url: "/api/v1/studentLessond/" + ids,
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
                        payfunc(idS);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }//חילוץ שיעורי התלמיד--2
        var tampString1 = "";
        var tampString2 = "";
        var tampString3 = "";
        var tampString4 = "";
        var count = 0;
        var mini;
        function Tabelstringes() {
            pays.slice().reverse().forEach(function (x) {
                var da2 = x.PaymentDate.split("T")[0];
                var da = da2.split("-")[2] + "/" + da2.split("-")[1] + "/" + da2.split("-")[0];
                //if (x.StatuseId1 == 3) {
                count += x.Sum;
                tampString1 = "<tr><td>" + da + "</td><td>" + x.Sum + "</td><td style=\"color: lightseagreen\">" + count + "</td></tr>" + tampString1;
                //}
            });
            document.getElementById('Tabel1').innerHTML = tampString1;

        }// יצור נתונים בטבלת תשלומים (אפשר בסוף)
        function payfunc(ids) {
            $.ajax({
                url: "/api/v1/getstudentPay/" + ids,
                type: "GET",
                dataType: "JSON",
                beforeSend: function () {
                    //StudentAntTeacher = [];
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        pays = JSON.parse(data);
                        idT = StudentAntTeacher[0].TeacherId1;
                        Tabelstringes();
                        miniajax(idT);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }//3 תשולמים
        function miniajax(idT) {
            $.ajax({
                url: "/api/v1/Less/" + idT,
                type: "GET",
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                beforeSend: function () {
                    lestype1 = [];
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        lestype1 = JSON.parse(JSON.parse(data));
                        minileson(lestype1);
                        //summinut(arrlessonajax);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }//שיעור הכי קטן של המורה--4
        function minileson(x) {
            mini = x[0]['minute'];
            for (let i of x)
                mini = (i.minute < mini ? mini : mini);
            summinut(arrlessonajax);
        }//שיעור הכי קטן של המרוה לא לקרוא לה נקראת באג'קס
        var balens = 0;
        function summinut(x) {
            x.slice().reverse().forEach(function (i) {
                if (i.StatusesName == 'בוצע') {
                    var da2 = i.DateLesson.split("T")[0];
                    var da = da2.split("-")[2] + "/" + da2.split("-")[1] + "/" + da2.split("-")[0];
                    var y = new Date(i.DateLesson.split('T')[0] + ' ' + i.BeginningTime);
                    var z = new Date(i.DateLesson.split('T')[0] + ' ' + i.EndTime);
                    countminut = ((z - y) / 1000) / 60;
                    var tamp = (countminut / mini) * StudentAntTeacher[0].PricePerLesson;
                    balens += tamp;
                    if (balens > 0)
                        tampString2 = "<tr><td>" + da + "</td><td>" + tamp + "</td><td style=\"color: red;\">" + balens + "-</td></tr>" + tampString2;
                    else
                        tampString2 = "<tr><td>" + da + "</td><td>" + tamp + "</td><td>" + balens + "</td></tr>" + tampString2;
                    
                }
            });
            document.getElementById('Tabel2').innerHTML = tampString2;
            var te = balens - count;
            if (te > 0) {
                document.getElementById("bal").innerHTML = te + "-";
                $("#balt").addClass("panel panel-red");
            }
            else {
                document.getElementById("bal").innerHTML = te;
            }
            
        }
        document.getElementById("nametitel").innerHTML = "פירוט חיובים וזיכויים";
        teacertostudent(idS);

    </script>
</asp:Content>
