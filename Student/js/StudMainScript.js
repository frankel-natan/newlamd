
//function selectChange() {
//    alert($("#LessTime :selected").text());
//}
//document.getElementById("btn1").click();//מקפיץ את המודול


function DateClickEvent(info) {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = mm + '/' + dd + '/' + yyyy;
    var ArrDate = (info.dateStr).split("-");
    var dateStr = "" + ArrDate[1] + "/" + ArrDate[2] + "/" + ArrDate[0];
    if (Date.parse(dateStr) < Date.parse(today)) {
        //alert(1);
    }
    else {

    
    //alert('Date: ' + info.dateStr);
    var data;
    //var data = JSON.stringify({1: info.dateStr });
    var ArrDate = (info.dateStr).split("-");
    var dateStr = "" + ArrDate[2] + "/" + ArrDate[1] + "/" + ArrDate[0];
    // alert(dateStr);
    var dateStr = "" + ArrDate[1] + "/" + ArrDate[2] + "/" + ArrDate[0];
    //alert(dateStr);
    //dateStr = "02/04/2020";
    // var dateStr=
    //test = dateStr;
    var lt;
    data = {
        'DateStr': dateStr,
        'NumOfDay': (new Date(ArrDate[2], ArrDate[1], ArrDate[0])).getDay()
    };
    $.ajax({
        url: "/api/v1/Less",
        type: "POST",
        dataType: "JSON",
        data: data,
        beforeSend: function () {
        },
        success: function (data) {
            if (data == 'invalid') {
                console.log('error');
            }
            else {
                myData = data;
                lessons = JSON.parse(data);
                //lessons = data.split('_');
                //צריך לרוץ בלולאה
                var bool = true;
                for (var i = 0; i < lessons.length; i++) {
                    if ((lessons[i][1].length) > 0) {
                        bool = false;
                    }
                }
                if (bool) {
                    alert("אין שיעורים פנויים  ביום שבחרת");
                }
                else {
                    document.getElementById("btn1").click();//מקפיץ את המודול
                }
            }
        },
        error: function (e) {
            console.log('error ' + e);
        }
    });

    //for (var key in matLessTypes)
    //{
    //    lt = matLessTypes[key];
    //    data = {
    //        'UserId': 1,
    //        'DateStr': dateStr,
    //        'NumOfDay': (new Date(ArrDate[2], ArrDate[1], ArrDate[0])).getDay(),
    //        'LessType': lt
    //    };


    //}
    }
    //alert(1);
    
    //lessons[0][1].length;
    //lessons[1][1].length;
}
var msg;               //המשתנים הוגדרו כאן כדי לאפשר גישה אליהם לצורך דיבוג בקונסול
var myData;
var myJsonObg;
var lessons;
var lessArr = [];
var lessType;
var test;
var test2;
//matLessTypes = JSON.parse(matLessTypes);
//ייצור לוח שנה
document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
        },
        initialDate: '2020-09-12',
        navLinks: true, // can click day/week names to navigate views
        businessHours: true, // display business hours
        editable: true,
        selectable: true,
        locale: 'he',
        direction: 'rtl',
        slotMinTime: '01:00',
        slotMaxTime: '24:00',
        //events: StudentEvent,
        //[
        //{
        //  title: 'Business Lunch',
        //  start: '2020-09-03T13:00:00',
        //  constraint: 'businessHours'
        //},
        //{
        //  title: 'Meeting',
        //  start: '2020-09-13T11:00:00',
        //  constraint: 'availableForMeeting', // defined below
        //  color: '#257e4a'
        //},
        //{
        //  title: 'Conference',
        //  start: '2020-09-18',
        //  end: '2020-09-20'
        //},
        //{
        //  title: 'Party',
        //  start: '2020-09-29T20:00:00'
        //},

        // areas where "Meeting" must be dropped
        //{
        //  groupId: 'availableForMeeting',
        //  start: '2020-09-11T10:00:00',
        //  end: '2020-09-11T16:00:00',
        //  display: 'background'
        //},
        //{
        //  groupId: 'availableForMeeting',
        //  start: '2020-09-13T10:00:00',
        //  end: '2020-09-13T16:00:00',
        //  display: 'background'
        //},

        //// red areas where no events can be dropped
        //{
        //  start: '2020-09-24',
        //  end: '2020-09-28',
        //  overlap: false,
        //  display: 'background',
        //  color: '#ff9f89'
        //},
        //{
        //  start: '2020-09-06',
        //  end: '2020-09-08',
        //  overlap: false,
        //  display: 'background',
        //  color: "black"
        //}
        //],
        color: 'black',
        dateClick: function (info) {
            //alert(1);
            DateClickEvent(info);
            
        },

    });

    calendar.render();
    calendar.today();

});

$('input[type=radio]').each(function () {//מאפשר לבחור רק אפשרות אחת ברדיו באטן
    var array = $(this).attr('name').split('$');
    $(this).attr('name', array[array.length - 1]);
});
$(document).ready(function () {
    $('input[type=radio]').change(function () {
        var id = $(this).attr("id");
        var lables = document.getElementsByTagName('label');//מערך של כל האלמנטים
        for (var i = 0; i < lables.length; i++) {
            if (lables[i].htmlFor == id) {
                msg = lables[i].innerText;// 40 שיעור כפול 80/רגיל..
            }

        }
        var html = '<select size="10" name="cars" id="LessTime" " >';
        lessType = msg.split("-")[0];//מחלץ א
        for (i = 0; i < lessons.length; i++) {
            var tmp = lessons[i];//[[סוג שיעור,[lessons..]]
            if (tmp[0] == lessType) {
                if (tmp[1].length > 0) {
                    for (var j = 0; j < tmp[1].length; j++) {
                        html += '<option value="' + msg + '-' + tmp[1][j] + '">' + tmp[1][j] + '</option>';
                    }
                }
                else {
                    html = false;
                }
            }
        }
        //for (i in lessons) {
        //    alert(i[0]);
        //    if (i[0] == lessType) {
        //        for (var j in i[1]) {
        //            consol.log(j);
        //            html += '<option value="' + msg + '-' + j + '">' + j + '</option>';
        //        }
        //    }
        //}


        //var lessType = msg.split("-")[0];
        //for (var jsonObg in lessons) {
        //    if (jsonObg["typy"] == lessType) {
        //        myJsonObg = jsonObg;
        //        break;
        //    }
        //}
        //var html = '<select name="cars" id="LessTime" " >';
        //for (i in myJsonObg["lessArr"]) {
        //    html += '<option value="' + msg + '-' + i + '">' + i + '</option>';
        //}
        //var lessType = msg.split("-")[0];
        //var LessObg = lessons[lessType];//מחזיר אובייקט עם השיעורים מהסוג שנבחר
        //var html = '<select name="cars" id="LessTime" " >';
        //for (i in LessObg) {
        //    html += '<option value="' + msg + '-' + LessObg[i] + '">' + LessObg[i] + '</option>';
        //}
        if (html == false) {
            html = "אין שיעורים פנויים מהסוג שבחרת ";
        }
        else {
            html += "</select>";
        }
        document.getElementById('ddlLess').innerHTML = html;


    });
});
