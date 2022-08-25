<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="graf.aspx.cs" Inherits="LamedNetLite.graf" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_header" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div class="col-md-8">
                <div class="panel panel-yellow" style="box-shadow: 10px 10px rgb(140 140 140);">
                    <div class="panel-heading" style="text-align: center;">
                        <h4>גרף התקדמות</h4>
                    </div>
                    <div class="panel-body">
                        <canvas id="myChart" style="width: 100%; max-width: 600px"></canvas>
                    </div>
                </div>
            </div>


</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="scripts" runat="server">
    <script>
        var idS = Number('<%=Session["StudentId"] %>');//שליפה מסשן
        var arrlessonajax = [];//חילוץ שיעורי התלמיד
        var StudentAntTeacher = [];
        var infrdata = { '1': "manual", '2': "automatic", '3': "manualtotelminute",'4':"automatictotelminute" };
        var idT;
        var mini;
        var xValues = [0];//, 1, 2, 3, 4, 5, 6, 7];
        var yValues = [0];//, 5, 10, 15, 20, 25, 30, 35];
        function page1() {
            new Chart("myChart", {
                type: "line",
                data: {
                    labels: xValues,
                    datasets: [{
                        fill: false,
                        lineTension: 0,
                        backgroundColor: "rgba(0,0,255,1.0)",
                        borderColor: "rgba(0,0,255,0.1)",
                        data: yValues
                    }]
                },
                options: {
                    legend: { display: false },
                    scales: {
                        yAxes: [{ ticks: { min: 0, max: 100 } }],
                    }
                }
            });
        }//kלגרף
        var lestype1;
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
                            miniajax(idT);
                        }
                    },
                    error: function (e) {
                        console.log('error ' + e);
                    }
                });
        }//חילוץ שיעורי התלמיד--2
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
                        summinut(arrlessonajax);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }//שיעור הכי קטן של המורה--3
        function minileson(x) {
            mini = x[0]['minute'];
            for (let i of x)
                mini = (i.minute < mini ? mini : mini);
        }//שיעור הכי קטן של המרוה לא לקרוא לה נקראת באג'קס
        var countminut = 0;//ספירת הדקות שנלמדו
        function summinut(x) {
            for (var i of x) {
                if (i.StatusesName == 'בוצע') {
                    var y = new Date(i.DateLesson.split('T')[0] + ' '+ i.BeginningTime);
                    var z = new Date(i.DateLesson.split('T')[0] +' '+ i.EndTime);
                    countminut += ((z - y) / 1000) / 60;
                }
            }
            lifunc(StudentAntTeacher[0].LicenseTypeID);
        }//ספירת הדקות שנלמדו--4
        var top1 = 0;//מקסימום דקות לימוד אפשרית
        function inf(strtype) {
            $.ajax({
                url: "/api/v1/information/" + strtype,
                type: "GET",
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        top1 = Number( data );
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        } //מקסימום דקות לימוד אפשרית לשלוח שם סוג לימוד ציותר!!!
        var maxleson = 0;//מקסימום שיעורים
        function lesonMax(strtype) {
            $.ajax({
                url: "/api/v1/information/" + strtype,
                type: "GET",
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        top1 = Number(data);
                        maxminutes = top1 * mini;
                        arrxyandy();
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }//--6 מקסימום שיעורים לשלוח שם לימוד
        var maxminutes;
        var li;
        function lifunc(x){
            li = Number(x); //StudentAntTeacher[0].LicenseTypeID;
            lesonMax(infrdata[li]);
            
        }//לא לקרוא נקראת באג'קס מקסימום דקות אפשרית--5
        document.getElementById("nametitel").innerHTML = "גרף התקדמות";
        function arrxyandy() {
            var lop = countminut / mini;
            for (var i = 1; i <= lop; i++) {
                xValues.push(i);
                yValues.push((i * 100) / top1);
            }
            page1();
        }//--7
        teacertostudent(idS);
    </script>




</asp:Content>
