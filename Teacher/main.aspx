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

    <button type="button" id="motelday" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal" style="display: none" data-backdrop="true">Modal with Overlay (true)</button>


    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4>האם ברצונך להוסיף אירוע בתאריך: </h4><h4 class="modal-title" id="mtitel"></h4>
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
                </div>

                <div class="modal-footer">
                    <button type="button" id="send" class="btn btn-success" data-dismiss="modal" disabled>אישור</button>

                    <button type="button" class="btn btn-danger" data-dismiss="modal">סגור</button>
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
                            tampjs = {
                                id: jsonarr[i]['VacationId'],
                                title: 'חופשה',
                                start: jsonarr[i]['BeginningOfVacation'].replace(' ', 'T'),
                                end: jsonarr[i]['EndOfVacation'].replace(' ', 'T'),
                                //allDay: false,
                                color: 'green',
                                type: 'Vacation'
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
                document.getElementById("send").disabled = false;//הדלקה כפתור אישור
            }
            else {
                $("#timeStart").show();
                document.getElementById("send").disabled = true;//כיבוי כפתור אישור
            }
        });

        $("#motelday").click(() => {//מחיקת תיבות הסימון אם סומנו
            $("#alldayselect").prop('checked', false);
            $("#deleteSelected").prop('checked', false);
            $("#timeStart").show();
            $("#timeEnd").hide();
            document.getElementById("send").disabled = true;

        })
        function iWillCallWhenBlur(value) {
            var timeStart = $("#appt").val().split(":");//$("#appt").val().split(":");
            var timeEnd = value.split(":");
            alert(timeStart[0]);
            alert(timeEnd[0]);
            alert(timeStart[1]);
            alert(timeEnd[1]);
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
            alert(timeStart[0]);
            alert(timeEnd[0]);
            alert(timeStart[1]);
            alert(timeEnd[1]);
            if (timeStart[0] < timeEnd[0]) {

                alert("גדול בשעות");
                document.getElementById("send").disabled = false;
            }
            else if (timeStart[0] == timeEnd[0] && timeStart[1] < timeEnd[1]) {
                alert("גדול בדקות");
                document.getElementById("send").disabled = false;
            }
            else {
                document.getElementById("send").disabled = true;
            }
        }//יציאה מחלון שעת סיום
        $("#send").click(() => {//כפתור אישור
            if ($("#alldayselect").is(':checked')) {
                alert('yes');//להעביר הוראה לשרת
            }
            else {
                alert($('#mtitel').text());
            }
        })



    </script>
</asp:Content>
