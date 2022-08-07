
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

    }
}
    var day;
    var msg;               //המשתנים הוגדרו כאן כדי לאפשר גישה אליהם לצורך דיבוג בקונסול
    var myData;
    var myJsonObg;
    var lessons;
    var lessArr = [];
    var lessType;
    var test;
    var test2;
    var c5;
    var c6;

    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
            },
            initialDate: '2020-09-12',
            //businessHours: true, // display business hours
            //selectable: true,

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
            selectable: true,
            dateClick: function (info) {
                selcDay(info, idT);
            }

        });

        calendar.render();
        calendar.today();
        calendar.setOption('locale', 'he');

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
function selcDay(info, idT) {
    alert('1Clicked on: ' + info.dateStr);
    alert('2Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    alert('3Current view: ' + info.view.type);
        // change the day's background color just for fun
    info.dayEl.style.backgroundColor = 'red';
    alert(idT);
    var day = info.dateStr;
    day = '"' + day + '"';
        $.ajax({
            url: "/api/v1/Less/" + idT,
            type: "PUT",
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            data: day,
            beforeSend: function () {
                alert(day);
            },
            success: function (data) {
                if (data == 'invalid') {
                    console.log('error');
                }
                else {
                    alert(data);
                    c5 = JSON.parse(data);
                    c6 = JSON.parse(c5);
                    typelesonnes(idT, day);
                }
            },
            error: function (e) {
                console.log('error ' + e);
            }
        });
    }
var lestype1;
var lestype2;
function typelesonnes(idT,day) {
        $.ajax({
            url: "/api/v1/Less/" + idT,
            type: "GET",
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            //data: day,
            beforeSend: function () {
                lestype1 = [];
                lestype2 = [];
            },
            success: function (data) {
                if (data == 'invalid') {
                    console.log('error');
                }
                else {
                    alert(data);
                    lestype1 = JSON.parse(data);
                    lestype2 = JSON.parse(lestype1);
                    minmnute(lestype2,day);
                }
            },
            error: function (e) {
                console.log('error ' + e);
            }
        });
    }
function minmnute(x,day) {
    var mini = x[0]['minute'];
    for (let i of x)
        mini = (i.minute < mini ? mini : mini);
    alert(mini + "////" + day);
    vacctiones(idT, day, mini);
}
var arrLessonse = [];
function dinamucLess(minute, day) {
    var flag = false;
    arrLessonse = [];
        var starth = 8;
        var startm = 0;
        alert("****" + day);
        const d = new Date(day);
        d.setHours(starth);
        d.setMinutes(startm);
        d.setSeconds(0);
        const endd = new Date(day);
        endd.setHours(23);
        endd.setMinutes(59);
        endd.setMinutes(59);
        endd.setSeconds(0);
        while (d < endd) {
            //alert(d)
            flag = false;
            flag = (c6.length > 0 || listvacctiones.length > 0 ? false : true)
            for (let i of c6) {
                var a = i.BeginningTime.split(':');
                const be = new Date(d);
                be.setHours(a[0]);
                be.setMinutes(a[1]);
                be.setSeconds(0);
                a = i.EndTime.split(':');
                //alert(a + "---" + i.EndTime);
                const en = new Date(d);
                en.setHours(a[0]);
                en.setMinutes(a[1]);
                en.setSeconds(0);
                alert(listvacctiones.length + "pppp" + c6.length+d +"tttttt"+be +"[[" + en);
                //alert(be + "---" + en);
                if (!(d >= be && d < en)) {
                    flag = true;
                }
            }
            if (flag || c6.length<=0) {
                for (var j of listvacctiones) {
                    const stvaction = new Date(j['BeginningOfVacation']);
                    const envaction = new Date(j['EndOfVacation']);
                    alert(stvaction + "))))))))))))))))");
                    alert(envaction + "))))))))))))))))");
                    if (!(d > stvaction && d < envaction)) {
                        flag = true;
                    }
                }
            }
            alert(flag );
            if (flag || (c6.length == 0 && listvacctiones.length == 0)) {
                var tamp1 = d.getMinutes() + "";
                var tamp2 = d.getHours() + "";
                arrLessonse[arrLessonse.length] = tamp2.padStart(2, '0') + ":" + tamp1.padEnd(2, '0');
            }
        d.setMinutes(d.getMinutes() + minute);
        }
    alert(arrLessonse)

    
    
    //arrLessonse = arrtamp;
        showModal();
}
function showModal() {
    $('#myModalmew').modal('show');
}
var listvacctiones=[];
function vacctiones(idT,day,mini) {
    //day = '"' + day + '"';
    alert(day + '@@');
    $.ajax({
        url: "/api/v1/Vacations/" + idT,
        type: "PUT",
        contentType: "application/json; charset=utf-8",
        dataType: "text",
        data: day,
        beforeSend: function () {
            listvacctiones = [];
            alert(idT + "====" + day);
        },
        success: function (data) {
            if (data == 'invalid') {
                console.log('error');
            }
            else {
                alert(data);
                listvacctiones = JSON.parse(JSON.parse(data));
                dinamucLess(mini, day);
            }
        },
        error: function (e) {
            console.log('error ' + e);
        }
    });
}