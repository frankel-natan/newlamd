var testVar;
var testVar2;
var testVar3;
var testVar4;
var SelectedTeacher;
var SelecedeCity;
$('#TeacherSelect').hide();
$('#CitySelect').hide();


function IsEmptyOrWhitespace(str) {
    return !(/\S/.test(str));
}
function ValidationSearchVals(TeacherSearchVal, CitySearcheVal) {
    if (IsEmptyOrWhitespace(TeacherSearchVal)
        && IsEmptyOrWhitespace(CitySearcheVal)) {
        //האם שתי התיבות טקסט ריקות או רווחים
        return null;
    }
    //האם התיבת חיפוש מורה לא מכילה טקסט
    if (IsEmptyOrWhitespace(TeacherSearchVal)) {
        TeacherSearchVal = null;
    }
    //האם התיבת חיפוש עיר לא מכילה טקסט
    if (IsEmptyOrWhitespace(CitySearcheVal)) {
        CitySearcheVal = null;
    }
    var Data = {
        'TeacherSearchVal': TeacherSearchVal,
        'CitySearcheVal': CitySearcheVal
    }
    return Data;
}
function fillSelect(SelectId, Data/*Data[{key:val,key:val..},{},{}..]*/, TeacherSearchVal, CitySearcheVal) {
    var select = document.getElementById(SelectId);
    var options = Data;
    testVar = Data;
    $('#' + SelectId)
        .find('option')
        .remove()
        .end();
    options.forEach((option, index) => {
        select[index] = new Option(option.val, option.id);
    });
    if (Data.length == 0) {
        select[0] = new Option('אין תוצאות', 'NoData');
    }
    TeacherSearchVal = (TeacherSearchVal == null) ? "" : TeacherSearchVal;
    CitySearcheVal = (CitySearcheVal == null) ? "" : CitySearcheVal;
    if (TeacherSearchVal == $("#TeacherSearch").val() && CitySearcheVal == $("#CitySearch").val()) {
        $('#' + SelectId).show();
    }
}
function fillData(TeacherSearchVal, CitySearcheVal,Data) {
    if (TeacherSearchVal == null) {
        fillSelect('CitySelect', JSON.parse(Data), TeacherSearchVal, CitySearcheVal);
        $('#TeacherSelect').hide();
        //לחלץ את הנתונים 
        //להזריק לרשימה
        //לגלות את הרשימה
    }
    else if (CitySearcheVal == null) {
        fillSelect('TeacherSelect', JSON.parse(Data), TeacherSearchVal, CitySearcheVal);
        $('#CitySelect').hide();

    }
    else {
        fillSelect('TeacherSelect', (JSON.parse(Data))[0], TeacherSearchVal, CitySearcheVal);
        fillSelect('CitySelect', (JSON.parse(Data))[1], TeacherSearchVal, CitySearcheVal);
    }
    
}
function MakeAjaxCall(Data) {
    //testVar = JSON.stringify(Data);
    $.ajax({
        url: "/api/v1/SearchTeachers",
        type: "POST",
        dataType: "json",
        //data: JSON.stringify(Data),
        data:Data,
        beforeSend: function () {
            //alert(testVar);
        },
        success: function (data) {
            if (data == 'invalid') {
                console.log('error');
            }
            else {
                fillData(Data.TeacherSearchVal, Data.CitySearcheVal, data);
            }
        },
        error: function (e) {
            console.log('error ' + e);
        }
    });
}
$("#TeacherSearch").on("input", function () {
    //alert($(this).val());
    var TeacherSearchVal = $("#TeacherSearch").val();
    var CitySearcheVal = $("#CitySearch").val();
    var Data = ValidationSearchVals(TeacherSearchVal, CitySearcheVal);
    if (Data != null) {
        MakeAjaxCall(Data)
    }
    else {
        $('#TeacherSelect').hide();
        $('#CitySelect').hide();
    }
});
$("#CitySearch").on("input", function () {
    //alert($(this).val());
    var TeacherSearchVal = $("#TeacherSearch").val();
    var CitySearcheVal = $("#CitySearch").val();
    var Data = ValidationSearchVals(TeacherSearchVal, CitySearcheVal);
    if (Data != null) {
        MakeAjaxCall(Data)
    }
    else {
        $('#TeacherSelect').hide();
        $('#CitySelect').hide();
    }


});
$("select").on("change", function () {
    //alert($(this).val());
    if ($(this).attr('name') == 'TeacherSelect') {
        //$("#SelectedTeacher").val(($(this).val()));
        $("#SelectedTeacher").val(($(this).val()));
        $("#SetSelectedTeacher").click();
    }
    else if ($(this).attr('name') == 'CitySelect') {
        //$("#CitySelect").html($(this).val());
        $("#SelectedCity").val(($(this).val()));
        $("#SetSelecedCity").click();

    }
});



