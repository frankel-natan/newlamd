var testVar;
var testVar2;
var testVar3;
var testVar4;
var SelectedSchool;
var SelecedeCity;
$('#SchoolSelect').hide();
$(function () {
    $("#TeacherSelect").on('change', function () {
        SelectedTeacher = $(this).val();
    })

});
$(function () {
    $("#CitySelect").on('change', function () {
        SelecedeCity = $(this).val();
    })

});

function IsEmptyOrWhitespace(str) {
    return !(/\S/.test(str));
}

function fillSelect(Data/*Data[{key:val,key:val..},{},{}..]*/, SchoolSearchVal) {
    var select = document.getElementById('SchoolSelect');
    var options = Data;
    testVar = Data;
    $('#SchoolSelect')
        .find('option')
        .remove()
        .end();
    options.forEach((option, index) => {
        select[index] = new Option(option.SchoolName, option.schoolId);
    });
    if (Data.length == 0) {
        select[0] = new Option('אין תוצאות', 'NoData');
    }
    
    if (SchoolSearchVal == $("#SchoolSearch").val()) {
        $('#SchoolSelect').show();
    }
}

function MakeAjaxCall(SchoolSearchVal) {
    //testVar = JSON.stringify(Data);
    $.ajax({
        url: "/api/v1/SearchSchool",
        type: "POST",
        dataType: "text",
        contentType: "application/json; charset=utf-8",
        //data: JSON.stringify(Data),
        data: '"' + SchoolSearchVal+'"',
        beforeSend: function () {
            //alert(testVar);
        },
        success: function (data) {
            if (data == 'invalid') {
                console.log('error');
            }
            else {
                fillSelect(JSON.parse(JSON.parse( data)), SchoolSearchVal);
            }
        },
        error: function (e) {
            console.log('error ' + e);
        }
    });
}
$("#SchoolSearch").on("input", function () {
    //alert($(this).val());
    var SchoolSearchVal = $("#SchoolSearch").val();
    if (IsEmptyOrWhitespace(SchoolSearchVal)) {
        $('#SchoolSearch').hide();
    }
    else {
        MakeAjaxCall(SchoolSearchVal);
    }
});

$("select").on("change", function () {
    //alert($(this).val());
    if ($(this).attr('name') == 'SchoolSelect') {
        //$("#SelectedTeacher").val(($(this).val()));
        $("#SelectedSchool").val(($(this).val()));
        $("#SetSelectedSchool").click();
    }
    
});

//d = '"aaa"';
//$.ajax({
//    url: "/api/v1/City/1",
//    type: "PUT",
//    contentType: "application/json; charset=utf-8",
//    dataType: "text",

