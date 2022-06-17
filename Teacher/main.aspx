<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="LamedNetLite.main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="head2" runat="server" ID="js2">
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
    <%--    <script src="../JQ/jquery.min.js"></script>--%>
    <%--    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>--%>
    <%--    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />--%>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />--%>
    <%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>
    <%--    <script src="../Bootstrap/js/bootstrap.min.js"></script>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    ברוך שובך המורה 
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="main" runat="server">
    <div id="calendar"></div>

-
     <button type="button" id="motelday" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="display: none">Open Modal</button>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4>האם ברצונך להוסיף חופשה בתאריך: </h4>
                    <h4 class="modal-title" id="mtitel"></h4>
                </div>
                <div class="modal-body">
                    <h5>נא לבחור שעת התחלה וסיום מתוך הרשימה</h5>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="deleteSelected">
                        <label class="form-check-label" for="flexCheckDefault">
                            האם ברצונך לבטל את כל האירועים שקיימים בזמן שנבחר?
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="alldayselect">
                        <label class="form-check-label" for="flexCheckDefault">
                            לבחירת כל היום סמן כאן
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="selectMoreday">
                        <label class="form-check-label" for="flexCheckDefault">
                            לבחירת מספר ימים סמן כאן
                        </label>
                    </div>
                    <div id="timeStart">
                        <label for="appt">נא לבחור שעה מתוך הרשימה</label>
                        <small>שעת התחלה</small>
                        <input type="time" id="appt" name="appt" onblur="iWillCallWhenBlur1(this.value)"
                            min="08:00" max="20:00" required>
                    </div>
                    <div id="timeEnd">
                        <label for="appt2"></label>
                        <small>שעת סיום</small>
                        <input type="time" id="appt2" name="appt" onblur="iWillCallWhenBlur(this.value)"
                            min="08:00" max="20:00" required>
                    </div>
                    <div id="dateStartDiv">
                        <label for="dateStart"></label>
                        <small>יום התחלה</small>
                        <input type="datetime-local" id="dateStart" name="dateStart" onblur="iWillCallWhenBlurStartDay(this.value)" />
                    </div>
                    <div id="dateEndDiv">
                        <label for="dateEnd"></label>
                        <small>יום סיום</small>
                        <input type="datetime-local" id="dateEnd" name="dateEnd" onblur="iWillCallWhenBlurEndDay(this.value)" />
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" id="send" class="btn btn-success" data-dismiss="modal" disabled>אישור</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">סגור</button>
                </div>
            </div>

        </div>
    </div>


    <button type="button" id="model2" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2" style="display: none">Open Modal</button>

    <!-- Modal -->
    <div class="modal fade" id="myModal2" role="dialog">
        <div class="modal-dialog " >

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">להלן האירועים שימחקו לאחר האישור</h4>
                </div>
                <div class="modal-body " style="height:250px; overflow:auto;">
                    <div id="modl2data">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" id="closemodel" data-dismiss="modal">ביטול</button>
                    <button type="button" class="btn btn-success" id="nodel2Del" data-dismiss="modal">אישור</button>
                    <button type="button" class="btn btn-default" id="closemodel2" data-dismiss="modal">סגור</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; align-content: center;">כל הזכויות שמורות </div>
    <script src="../Calendar/lib/main.js"></script>
    <script src="../Calendar/lib/locales/he.js"></script>
    <link href="../Calendar/lib/main.css" rel="stylesheet" />
    <script src="eventsHandler.ashx"></script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="js" runat="server">
    <script>
        var jsonarr;
        var arrvent = [];
        function ajLassons(x) {
            $.ajax({
                url: "/api/v1/taemain/" + x,
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
                        jsonarr = JSON.parse(data);
                        alert(data.responseJSON);
                        for (var i = 0; i < jsonarr.length; i++) {
                            var indexT = jsonarr[i]['DateLesson'].indexOf("T");
                            var da = jsonarr[i]['DateLesson'].substring(0, indexT);
                            tampjs = {
                                id: jsonarr[i]['DrivingLessonsId'],
                                title: 'שיעור נהיגה ' + jsonarr[i]['StudentName'],
                                start: da + 'T' + jsonarr[i]['BeginningTime'],
                                end: da + 'T' + jsonarr[i]['EndTime'],
                                allDay: false,
                                type: 'Lesson'
                            }
                            arrvent[i] = tampjs;
                        }
                        ajVac(arrvent, x);
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function ajVac(arrvent, x) {
            $.ajax({
                url: "/api/v1/Vacations/" + x,
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
                        jsonarr = JSON.parse(data);
                        alert(data.responseJSON);
                        for (var i = 0; i < jsonarr.length; i++) {
                            if (jsonarr[i]['BeginningOfVacation'].split("T")[1] == "00:00:00" && jsonarr[i]['EndOfVacation'].split("T")[1] === "23:59:00") {
                                tampjs = {
                                    id: jsonarr[i]['VacationId'],
                                    title: 'חופשה',
                                    start: jsonarr[i]['BeginningOfVacation'].split("T")[0],
                                    //end: jsonarr[i]['EndOfVacation'].replace(' ', 'T'),
                                    allDay: true,
                                    color: 'green',
                                    type: 'Vacation'
                                }
                            }
                            else {
                                tampjs = {
                                    id: jsonarr[i]['VacationId'],
                                    title: 'חופשה',
                                    start: jsonarr[i]['BeginningOfVacation'].replace(' ', 'T'),
                                    end: jsonarr[i]['EndOfVacation'].replace(' ', 'T'),
                                    //allDay: false,
                                    color: 'green',
                                    type: 'Vacation'
                                }
                            }
                            arrvent[arrvent.length] = tampjs;
                        }
                        creatCalnder();//פונקצייה ליומן
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function ajVacDelete(idVacation) {
            $.ajax({
                url: "/api/v1/Vacations/" + idVacation,
                type: 'DELETE',
                beforeSend: function () { deletArr() },
                success: function (result) {
                    ajLassons(username);
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function ajVacDeleteList(idVacation) {//פונקציה שרק מוחקת ללא קריאה לעיצוב הדף מחדש
            $.ajax({
                url: "/api/v1/Vacations/" + idVacation,
                type: 'DELETE',
                beforeSend: function () { deletArr() },
                success: function (result) {
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        function ajLessDeleteList(idLesson) {//פונקציה שרק מוחקת ללא קריאה לעיצוב הדף מחדש
            $.ajax({
                url: "/api/v1/taemain/" + idLesson,
                type: 'DELETE',
                beforeSend: function () { deletArr() },
                success: function (result) {
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });
        }
        var username = '<%= Session["TeacherId"] %>';//שליפה מסשן
        ajLassons(username);//מערך שיעורים והפעלת פונקצייה יומן
        function creatCalnder() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                }, // buttons for switching between views
                locale: 'he',
                buttonIcons: true, // show the prev/next text
                weekNumbers: false,
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                dayMaxEvents: true,
                direction: 'rtl',
                slotMinTime: '01:00',
                slotMaxTime: '24:00',
                slotDuration: '00:20:00',
                selectable: false,
                events: arrvent,//אירועים ביומן
                dateClick: function (info) {
                    var tampdate = revesrseDare(info.dateStr);//שליפת תאריך
                    alert('Date: ' + tampdate);
                    $("#motelday").click();
                    $("#mtitel").text(tampdate);
                    $("#mbady").text('בחר שעת התחלה מתוך הרשימה');


                },
                eventClick: function (info) {
                    if (confirm('האם ברצונך למחוק את ' + info.event.title + ' מתאריך ' + info.event.start)) {
                        alert(info.event.start);
                        if (info.event.title === 'חופשה') {
                            ajVacDelete(info.event.id);//ajax מחיקה + בנייה חדשה של היומן
                            alert('נמחק בהצלחה');
                        }
                        else {
                            if (confirm('האם לשלוח הודעה לתלמיד?')) {
                                //ajax מחיקה ושליחה לSM
                            }
                        }
                    }

                    else {
                        alert('Event: ' + info.event.title);
                        alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
                        alert('View: ' + info.view.type);
                        alert('Event: ' + info.event.id);

                        // change the border color just for fun
                        //info.el.Style.color= "red";
                    }
                }
            });
            calendar.render();
        }
        function deletArr() {//מחיקת מערך
            arrvent = [];
        }
        function deletArr2() {//מחיקת מערך
            delitams = [];
        }
        function reverse(s) {//היפוך מחרוזת
            return s.split("").reverse().join("");
        }
        function revesrseDare(date) {//מהפך תאריך שמגיע בצורה yyyy-hh-dd
            var x = date.split("-").reverse().join("");
            return x.substring(0, 2) + "-" + x.substring(2, 4) + "-" + x.substring(4);
        }
        $("#alldayselect").change(function () {//הסתרה או גילוי של תיבת בחירת שעה
            if ($(this).is(':checked')) {
                $("#timeStart").hide(); // checked 
                $("#timeEnd").hide();
                $("#dateStartDiv").hide();
                $("#dateEndDiv").hide();
                $("#selectMoreday").prop('checked', false);
                document.getElementById("dateStart").value = "";
                document.getElementById("dateEnd").value = "";
                document.getElementById("send").disabled = false;//הדלקה כפתור אישור
            }
            else {
                $("#timeStart").show();
                document.getElementById("send").disabled = true;//כיבוי כפתור אישור
            }
        });
        $("#selectMoreday").change(function () {//הסתרה או גילוי של תיבת בחירת שעה
            if ($(this).is(':checked')) {
                $("#dateStartDiv").show(); // checked
                $("#dateEndDiv").show();
                $("#timeStart").hide();
                $("#timeEnd").hide();
                $("#alldayselect").prop('checked', false);
                document.getElementById("send").disabled = true;//הדלקה כפתור אישור
                document.getElementById("appt").value = "";
                document.getElementById("appt2").value = "";
            }
            else {
                $("#dateStartDiv").hide();
                $("#dateEndDiv").hide();
                $("#timeStart").show();
                $("#timeEnd").hide();
                document.getElementById("dateStart").value = "";
                document.getElementById("dateEnd").value = "";
                document.getElementById("send").disabled = true;//כיבוי כפתור אישור
            }
        });
        $("#motelday").click(() => {//מחיקת תיבות הסימון אם סומנו
            $("#alldayselect").prop('checked', false);
            $("#deleteSelected").prop('checked', false);
            $("#selectMoreday").prop('checked', false);
            $("#timeStart").show();
            $("#timeEnd").hide();
            $("#dateStartDiv").hide();
            $("#dateEndDiv").hide();
            document.getElementById("send").disabled = true;
            document.getElementById("dateStart").value = "";
            document.getElementById("dateEnd").value = "";
            document.getElementById("appt").value = "";
            document.getElementById("appt2").value = "";

        })
        function iWillCallWhenBlur(value) {
            var timeStart = $("#appt").val().split(":");
            var timeEnd = value.split(":");
            if (timeStart[0] < timeEnd[0]) {

                alert("גדול בשעות");
                document.getElementById("send").disabled = false;
            }
            else if (timeStart[0] == timeEnd[0] && timeStart[1] < timeEnd[1]) {
                alert("גדול בדקות");
                document.getElementById("send").disabled = false;
            }
            else {
                alert("שגיאה");
                document.getElementById("send").disabled = true;
            }
        }//יציאה מחלון שעת התחלה
        function iWillCallWhenBlur1(value) {
            $("#timeEnd").show();
            var timeEnd = $("#appt2").val().split(":");//$("#appt").val().split(":");
            var timeStart = value.split(":");
            if (timeStart[0] < timeEnd[0]) {

                alert("גדול בשעות");
                document.getElementById("send").disabled = false;
            }
            else if (timeStart[0] == timeEnd[0] && timeStart[1] < timeEnd[1]) {
                alert("גדול בדקות");
                document.getElementById("send").disabled = false;
            }
            else if (!$("#appt").val()) {
                $("#timeEnd").hide();
                document.getElementById("send").disabled = true;
            }
        }//יציאה מחלון שעת סיום
        function iWillCallWhenBlurStartDay(value) {
            if (!$("#dateEnd").val()) {
                document.getElementById("send").disabled = true;
            }
            else {
                var arrSatrt = value.replace("T", " ");
                var arrEnd = $("#dateEnd").val().replace("T", " ");
                const srd = new Date(arrSatrt);//הכנסה לאובייקט תאריך
                const end = new Date(arrEnd);//הכנסה לאובייקט תאריך
                if (end > srd) {
                    document.getElementById("send").disabled = false;
                    alert(2);
                }
                else {
                    document.getElementById("send").disabled = true;
                }
            }

        }//יציאה מחלון יום התחלה
        function iWillCallWhenBlurEndDay(value) {
            var arrEnd = value.replace("T", " ");
            var arrSatrt = $("#dateStart").val().replace("T", " ");
            const srd = new Date(arrSatrt);//הכנסה לאובייקט תאריך
            const end = new Date(arrEnd);//הכנסה לאובייקט תאריך
            //if (value) {
            //    document.getElementById("send").disabled = false;
            //    alert(1);
            //}
            if (end > srd) {
                document.getElementById("send").disabled = false;
                alert(2);
            }
            else {
                document.getElementById("send").disabled = true;
            }
        }//יציאה מחלון יום סיוםnodel2Del
        var jsonveAjax;
        var tampVe
        var delitams = [];//מערך עבור אירועים העומדים להמחק
        $("#send").click(() => {//כפתור אישור
            if ($("#alldayselect").is(':checked')) {//סימון יום שלם
                var slice = $('#mtitel').text().split("-");
                var slice2 = slice[1] + "/" + slice[0] + "/" + slice[2];
                alert(slice2);
                tampVe = {
                    'VacationId': -1,
                    'TeacherId': username,
                    'BeginningOfVacation': slice2 + " 00:00",
                    'EndOfVacation': slice2 + " 23:59"
                }
            }
            else if ($("#selectMoreday").is(':checked')) {
                var arrSatrt = $("#dateStart").val().replace("T", " ");
                var arrEnd = $("#dateEnd").val().replace("T", " ");
                tampVe = {
                    'VacationId': -1,
                    'TeacherId': username,
                    'BeginningOfVacation': arrSatrt,
                    'EndOfVacation': arrEnd
                }

            }
            else {
                var slice = $('#mtitel').text().split("-");
                var slice2 = slice[1] + "/" + slice[0] + "/" + slice[2];
                tampVe = {
                    'VacationId': -1,
                    'TeacherId': username,
                    'BeginningOfVacation': slice2 + " " + $("#appt").val(),
                    'EndOfVacation': slice2 + " " + $("#appt2").val()
                }
            }
            //Vacationsadd(tampVe);
            if ($("#deleteSelected").is(':checked')) {//הסכמה לביטול השיעורים שנקבעו
                alert($('#mtitel').text() + "לבטל אירועים");
                var arrSatrt = $("#dateStart").val().replace("T", " ");
                var arrEnd = $("#dateEnd").val().replace("T", " ");
                const srd = new Date(arrSatrt);//הכנסה לאובייקט תאריך
                const end = new Date(arrEnd);
                for (var i = 0; i < arrvent.length; i++) {
                    const delsrd = new Date(arrvent[i]['start']);//הכנסה לאובייקט תאריך
                    const delend = new Date(arrvent[i]['end']);
                    if ((delsrd >= srd && delsrd <= end) || (delend >= srd && delend <= end)) {
                        delitams[delitams.length] = arrvent[i];
                    }
                }
                $('#modl2data').append(' <div class="spinner-border text-danger" role="status"><span class="sr-only">Loading...</span></div>');

                for (var i = 0; i < delitams.length; i++) {
                    var w1 = " " + delitams[i]['start'];
                    var q1 = " " + delitams[i]['end'];
                    var w2 = w1.replaceAll("T", " ");
                    var q2 = q1.replaceAll("T", " ");
                    $('#modl2data').append('<div class="well">' + delitams[i]['title'] + '  ' + w2 + ' ' + q2 + '</div>');
                }
                if (delitams.length > 0) {
                    $("#model2").click();
                }
                else {
                    Vacationsadd(tampVe);
                }
                    
                //Vacationsadd(tampVe);
            }//הכנסת האירועים העומדים להמחק
            else {
                alert("לא לבטל אירועים");
                Vacationsadd(tampVe);
            }

        })
        function Vacationsadd(tampVe) {
            $.ajax({
                url: "/api/v1/Vacations",
                type: "POST",
                dataType: "json",
                data: tampVe,
                beforeSend: function () {
                    deletArr();
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log('error');
                    }
                    else {
                        ajLassons(username);
                        yesmess();
                    }
                },
                error: function (e) {
                    console.log('error ' + e);
                }
            });

        }
        $("#closemodel").click(() => {
            delitams = [];//מחיקת מערך
            $('#modl2data').empty();//מחיקת הערכים מHTML
        })
        $("#closemodel2").click(() => {
            delitams = [];//מחיקת מערך
            $('#modl2data').empty();//מחיקת הערכים מHTML
        })
        var listDeliteVacation = [];//מערך עבור חופשות למחיקה
        var listDeliteLesson = [];//מערך עבור שיעורים למחיקה
        $("#nodel2Del").click(() => {
            for (var i = 0; i < delitams.length; i++) {
                if (delitams[i]['title'] === 'חופשה') {
                    ajVacDeleteList(delitams[i]['id']);
                }
                else {
                    ajLessDeleteList(delitams[i]['id']);
                }
            }
            Vacationsadd(tampVe);

        })



    </script>
</asp:Content>
