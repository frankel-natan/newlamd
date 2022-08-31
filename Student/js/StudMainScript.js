
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
var seday;
var mini;
var arrvent;
var langeLassons;
function calnder() {
    //document.addEventListener('DOMContentLoaded', function () {
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
            events: arrvent,
            dateClick: function (info) {
                seday = info.dateStr;
                const aq = new Date(info.dateStr);
                const aw = new Date();
                if (aq > aw)
                    selcDay(info, idT);
                else
                    alert("אין אפשרות להזמין שיעור לתאריך שעבר");
            }
        });
        calendar.render();
        calendar.today();
        calendar.setOption('locale', 'he');

    //});
}

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
    //alert('1Clicked on: ' + info.dateStr);
    //alert('2Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    //alert('3Current view: ' + info.view.type);
        // change the day's background color just for fun
    //info.dayEl.style.backgroundColor = 'red';
    //alert(idT);
    var day = info.dateStr;
    day = '"' + day + '"';
        $.ajax({
            url: "/api/v1/Less/" + idT,
            type: "PUT",
            contentType: "application/json; charset=utf-8",
            dataType: "text",
            data: day,
            beforeSend: function () {
                c5, c6 = [];
            },
            success: function (data) {
                if (data == 'invalid') {
                    console.log('error');
                }
                else {
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
    mini = x[0]['minute'];
    for (let i of x)
        mini = (i.minute < mini ? mini : mini);
    vacctiones(idT, day, mini);
}
var arrLessonse = [];
function dinamucLess(minute, day) {
    var flag = false;
    arrLessonse = [];
        var starth = 8;
        var startm = 0;
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
            if (c6.length > 0) {
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
                    //alert(be + "---" + en);
                    const d2 = new Date(d);
                    d2.setMinutes(d2.getMinutes() + minute);
                    if (!(d >= be && d < en) && !(d2 > be && d2<en)) {
                        flag = true;
                    }
                    else {
                        flag = false;
                        break;
                    }
                }
                if (flag) {
                    for (var j of listvacctiones) {
                        const stvaction = new Date(j['BeginningOfVacation']);
                        const envaction = new Date(j['EndOfVacation']);
                        if (!(d > stvaction && d < envaction) && !(d2 > stvaction && d2 < envaction)) {
                            flag = true;
                        }
                        else {
                            break;
                        }
                    }
                }
            }
            else {
                for (var j of listvacctiones) {
                    const stvaction = new Date(j['BeginningOfVacation']);
                    const envaction = new Date(j['EndOfVacation']);
                    const d2 = new Date(d);
                    d2.setMinutes(d2.getMinutes() + minute);
                    if (!(d >= stvaction && d < envaction) && !(d2 > stvaction && d2 < envaction)) {
                        flag = true;
                    }
                    else {
                        flag = false;
                        break;
                    }
                }
            }
            var flag2 = (c6.length == 0 && listvacctiones == 0 ? true : false);
            if (flag || flag2) {
                var tamp1 = d.getMinutes() + "";
                var tamp2 = d.getHours() + "";
                arrLessonse[arrLessonse.length] = tamp2.padStart(2, '0') + ":" + tamp1.padEnd(2, '0');
            }
        d.setMinutes(d.getMinutes() + minute);
        }
    $("#days").empty();
    var arrspilt = seday.split("-");
    var paragraph = document.getElementById("days");
    var text = document.createTextNode(arrspilt[2] + "/" + arrspilt[1] + "/" + arrspilt[0]);
    document.getElementById('days').innerHTML = '';
    paragraph.appendChild(text);
    RedioDinamic(lestype2);
    selectlistlic(arrLessonse);
    $("#" + mini).prop("checked", true);
        showModal();
}
function showModal() {
    $('#myModalmew').modal('show');
    document.getElementById("send").disabled = true;
}
var listvacctiones=[];
function vacctiones(idT,day,mini) {
    $.ajax({
        url: "/api/v1/Vacations/" + idT,
        type: "PUT",
        contentType: "application/json; charset=utf-8",
        dataType: "text",
        data: day,
        beforeSend: function () {
            listvacctiones = [];
        },
        success: function (data) {
            if (data == 'invalid') {
                console.log('error');
            }
            else {
                listvacctiones = JSON.parse(JSON.parse(data));
                dinamucLess(mini, day);
            }
        },
        error: function (e) {
            console.log('error ' + e);
        }
    });
}
function selectlistlic(x) {//יצירת תיבת השיעורים
    $("#licdinamic").empty();
    for (var i of x)
        addOneTOListLic(i);
}
function addOneTOListLic(y) {//הכנסת שיעור בודד לרשימה
    var select = document.getElementById('licdinamic');
    var opt = document.createElement('option');
    opt.value = seday+" "+ y;
    opt.innerHTML = y;
    select.appendChild(opt);
}

function RedioDinamic(x) {//יצירת רדיו באטן
    $("#rediodinamic").empty();
    for (var i of x) {
        $('#rediodinamic').append(`<div><label ><input type="radio" id="${i.minute}"  name="contact" value="${i.minute}" onchange="typele(this)">&nbsp;${i.TypeName}&nbsp;</label></div>`);
    } 
}

function typele(x) {
    document.getElementById(x.id).checked = true;
    changListLes(seday, mini, x.value);
    document.getElementById(x.id).checked = true;
}
function changListLes(day, minute, langlesson) {
    var flag = false;
    arrLessonse = [];
    var starth = 8;
    var startm = 0;
    const d = new Date(day);
    d.setHours(starth);
    d.setMinutes(startm);
    d.setSeconds(0);
    const endd = new Date(day);
    endd.setHours(23);
    endd.setMinutes(59);
    endd.setSeconds(0);
    const d3 = new Date(d);

    while (d < endd && d3 <= endd) {
        flag = false;
        flag = (c6.length > 0 || listvacctiones.length > 0 ? false : true)
        if (c6.length > 0) {
            for (let i of c6) {
                var a = i.BeginningTime.split(':');
                const be = new Date(d);
                be.setHours(a[0]);
                be.setMinutes(a[1]);
                be.setSeconds(0);
                a = i.EndTime.split(':');
                const en = new Date(d);
                en.setHours(a[0]);
                en.setMinutes(a[1]);
                en.setSeconds(0);
                const d2 = new Date(d);
                d2.setMinutes(d2.getMinutes() + minute);
                if (!(d >= be && d < en) && !(d2 >= be && d2 < en) && !(d3 >= be && d3 < en)) {
                    flag = true;
                }
                else {
                    flag = false;
                    break;
                }
            }
            if (flag) {
                for (var j of listvacctiones) {
                    const stvaction = new Date(j['BeginningOfVacation']);
                    const envaction = new Date(j['EndOfVacation']);

                    if (!(d > stvaction && d < envaction) && !(d2 >= stvaction && d2 < envaction) && !(d3 >= stvaction && d3 < envaction)) {
                        flag = true;
                    }
                    else {
                        break;
                    }
                }
            }
        }
        else {
            for (var j of listvacctiones) {
                const stvaction = new Date(j['BeginningOfVacation']);
                const envaction = new Date(j['EndOfVacation']);
                const d2 = new Date(d);
                d2.setMinutes(d2.getMinutes() + minute);
                if (!(d >= stvaction && d < envaction) && !(d2 >= stvaction && d2 < envaction) && !(d3 >= stvaction && d3 < envaction)) {
                    flag = true;
                }
                else {
                    flag = false;
                    break;
                }
            }
        }
        var flag2 = (c6.length == 0 && listvacctiones == 0 ? true : false);
        if (flag || flag2) {
            var tamp1 = d.getMinutes() + "";
            var tamp2 = d.getHours() + "";
            arrLessonse[arrLessonse.length] = tamp2.padStart(2, '0') + ":" + tamp1.padEnd(2, '0');
        }
        d3.setHours(d.getHours());
        d3.setMinutes(d.getMinutes());
        var h = Number(d3.getMinutes()) + Number(langlesson);
        var h1 = Math.floor(h / 60);
        var m1 = (Number(d3.getMinutes()) + Number(langlesson)) % 60;
        d3.setMinutes(d3.getMinutes() + Number(langlesson));
        d.setMinutes(d.getMinutes() + minute);

    }
    selectlistlic(arrLessonse);
    document.getElementById("send").disabled = true;
    showModal();
}
document.getElementById("licdinamic").onchange = function () {
    document.getElementById("send").disabled = false;
}

var StudentAntTeacher;
function getStudentAntTeacher(ids) {
    $.ajax({
        url: "/api/v1/studentAntTeacher/" + ids,
        type: "GET",
        dataType: "JSON",
        data: day,
        beforeSend: function () {
            StudentAntTeacher = [];
        },
        success: function (data) {
            if (data == 'invalid') {
                console.log('error');
            }
            else {
                //StudentAntTeacher = JSON.parse(JSON.parse(data));
                StudentAntTeacher = JSON.parse(data);
                idT = StudentAntTeacher[0].TeacherId1;
                document.getElementById("nametitel").innerHTML = "ברוך שובך " + StudentAntTeacher[0].StudentName;
                document.getElementById("nametitel").style.color = "red";
            }
        },
        error: function (e) {
            console.log('error ' + e);
        }
    });    
}
var arrlessonajax;
function page(id) {
    $.ajax({
        url: "/api/v1/studentLessond/" + id,
        type: "GET",
        dataType: "JSON",
        data: day,
        beforeSend: function () {
            arrvent = [];
            arrlessonajax = [];
        },
        success: function (data) {
            if (data == 'invalid') {
                console.log('error');
            }
            else {
                arrlessonajax = JSON.parse(data);
                var tampjs;
                for (var i of arrlessonajax) {
                    var arrt = i.DateLesson.split('T');
                    tampjs = {
                        id: i.DrivingLessonsId,
                        title: i.StatusesName,
                        start: arrt[0] + "T" +i.BeginningTime,
                        end: arrt[0] + "T" + i.EndTime,
                        //allDay: false,
                        color: 'green',
                        type: 'Vacation'
                    }
                    arrvent.push(tampjs);
                }
                calnder();
                getStudentAntTeacher(id);
            }
        },
        error: function (e) {
            console.log('error ' + e);
        }
    });  
   
}
$("#send").click(() => {
    var dayTime = $("#licdinamic").val();
    var lange = $("input[type='radio'][name='contact']:checked").val();
    var arrtandday = dayTime.split(' ');
    var send = {
        'srrd': arrtandday[0], 'srrt': arrtandday[1], 'srrla': lange
    };
    $.ajax({
        url: "/api/v1/lassonstudent/" + idS,
        type: "PUT",
        //contentType: "application/json; charset=utf-8",
        dataType: "JSON",
        data: send,
        beforeSend: function () {
        },
        success: function (data) {
            if (data == 'invalid') {
                console.log('error');
            }
            else {
                alert('עודכן');
                page(idS);
            }
        },
        error: function (e) {
            console.log('error ' + e);
        }
    });
})
