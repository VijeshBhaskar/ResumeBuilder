$(window).on('load', function () {
    debugger
    if ($("#hdnTab").val() == "WarrantyCheck") {
        TabClick("tabExperience");
    }
    else {
        TabClick("tabPersonalDetails");
    }
});

$("document").ready(function () {
});
function InsertPersonalDetails() {
    debugger
    var isValid = true;

    if (!ValidateForm("frmPersonalDetails")) {
        isValid = false;
    }

    var firstName = $("#txtFirstName");

    if (firstName.val() == null || firstName.val() == '') {
        firstName.next("span").html("First name is required");
        firstName.css("border-color", "red");
        isValid = false;
    }
    else {
        firstName.next("span").html("");
        firstName.css("border-color", "");
    }
    var regex = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var email = $("#txtEmail");

    if (email.val().trim() != "") {
        if (!regex.test(email.val().trim())) {
            email.next("span").html("please enter a valid email id");
            email.css("border-color", "red");
            isValid = false;
        }
        else {
            email.next("span").html("");
            email.css("border-color", "");
        }
    }
    else {
        email.next("span").html("Email id is required");
        email.css("border-color", "red");
        isValid = false;
    }
    if ($("#txtPhoneNumber").val() == null || $("#txtPhoneNumber").val() == '') {
        $("#txtPhoneNumber").next("span").html("Phone number is required");
        $("#txtPhoneNumber").css("border-color", "red");
        isValid = false;
    }
    else {
        $("#txtPhoneNumber").next("span").html("");
        $("#txtPhoneNumber").css("border-color", "");
    }
    if ($("#txtAddress").val() == null || $("#txtAddress").val() == '') {
        $("#txtAddress").next("span").html("Address is required");
        $("#txtAddress").css("border-color", "red");
        isValid = false;
    }
    else {
        $("#txtAddress").next("span").html("");
        $("#txtAddress").css("border-color", "");
    }
    if (!isValid) {
        return false;
    }
    $("#loader").show();
    /*$("#frmPersonalDetails").submit();*/
    debugger
    var valdata = $("#frmPersonalDetails").serialize();
    $.ajax({
        url: "/User/InsertPersonalDetails",
        type: "POST",
        dataType: 'html',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: valdata,
        success: function (data) {
            debugger;
            $("#loader").hide();
            $("#personalPartial").html(data);
            toastr.success("Saved Successfully");
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $("#loader").hide();
            alert(errorThrown);
        }
    });
}

function InsertExperienceDetails() {
    debugger
    var isValid = true;

    if (!ValidateForm("frmPersonalDetails")) {
        isValid = false;
    }
    isValid = validateExperience();
    if (!isValid) {
        return false;
    }
    $("#loader").show();
    debugger
    var valdata = $("#frmExperienceDetails").serialize();
    $.ajax({
        url: "/User/InsertExperienceDetails",
        type: "POST",
        dataType: 'html',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: valdata,
        success: function (data) {
            debugger;
            //$("#loader").hide();
            //$("#expPartial").html('');
            //$("#expPartial").html(data);
            //toastr.success("Saved Successfully");
            getResumeDetails('tabExperience');
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $("#loader").hide();
            alert(errorThrown);
        }
    });
}
function getResumeDetails(tabName) {
    $.ajax({
        url: "/User/ResumeDetails",
        type: "POST",
        dataType: 'html',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        success: function (data) {
            debugger;
            if (tabName == 'tabExperience') {
                TabClick("tabExperience");
            }
            else if (tabName == 'tabEducation') {
                TabClick("tabEducation");
            }
            else if (tabName == 'tabSkills') {
                TabClick("tabSkills");
            }
            else if (tabName == 'tabLanguage') {
                TabClick("tabLanguage");
            }
            else if (tabName == 'tabHobbies') {
                TabClick("tabHobbies");
            }
            $("#loader").hide();
            toastr.success("Saved Successfully");
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $("#loader").hide();
            alert(errorThrown);
        }
    });
}
function InsertEducationDetails() {
    var isValid = true;

    if (!ValidateForm("frmEducationDetails")) {
        isValid = false;
    }
    isValid = validateEducation();
    if (!isValid) {
        return false;
    }
    $("#loader").show();
    debugger
    var valdata = $("#frmEducationDetails").serialize();
    $.ajax({
        url: "/User/InsertEducationDetails",
        type: "POST",
        dataType: 'html',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: valdata,
        success: function (data) {
            debugger;
            getResumeDetails('tabEducation');
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $("#loader").hide();
            alert(errorThrown);
        }
    });
}
function InsertSkillDetails() {
    var isValid = true;
    if (!ValidateForm("frmSkillsDetails")) {
        isValid = false;
    }
    isValid = validateSkill();
    if (!isValid) {
        return false;
    }
    $("#loader").show();
    debugger
    var valdata = $("#frmSkillsDetails").serialize();
    $.ajax({
        url: "/User/InsertSkillDetails",
        type: "POST",
        dataType: 'html',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: valdata,
        headers: {
            'Access-Control-Allow-Origin': '*',
        },
        success: function (data) {
            debugger;
            getResumeDetails('tabSkills');
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $("#loader").hide();
            alert(errorThrown);
        }
    });
}
function InsertHobbyDetails() {
    var isValid = true;

    if (!ValidateForm("frmHobbyDetails")) {
        isValid = false;
    }
    isValid = validateHobby();
    if (!isValid) {
        return false;
    }
    $("#loader").show();
    debugger
    var valdata = $("#frmHobbyDetails").serialize();
    $.ajax({
        url: "/User/InsertHobbyDetails",
        type: "POST",
        dataType: 'html',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: valdata,
        success: function (data) {
            debugger;
            tabHobbies
            getResumeDetails('tabHobbies');
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $("#loader").hide();
            alert(errorThrown);
        }
    });
}
function InsertLanguageDetails() {
    var isValid = true;

    if (!ValidateForm("frmLanguageDetails")) {
        isValid = false;
    }
    isValid = validateLanguage();
    if (!isValid) {
        return false;
    }
    $("#loader").show();
    debugger
    var valdata = $("#frmLanguageDetails").serialize();
    $.ajax({
        url: "/User/InsertLanguageDetails",
        type: "POST",
        dataType: 'html',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: valdata,
        success: function (data) {
            debugger;
            getResumeDetails('tabLanguage');
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $("#loader").hide();
            alert(errorThrown);
        }
    });
}
function ViewResume() {
    $("#frmViewResume").submit();
}

function TabClick(tab) {
    debugger
    $(".column").css("background-color", "black");
    $("#" + tab).css("background-color", "#f5af05");

    if (tab == "tabExperience") {
        $("#personalPartial").hide();
        $("#expPartial").show();
        $("#eduPartial").hide();
        $("#skillsPartial").hide();
        $("#hobbyPartial").hide();
        $("#LanguagePartial").hide();
    }
    else if (tab == "tabPersonalDetails") {
        $("#expPartial").hide();
        $("#personalPartial").show();
        $("#eduPartial").hide();
        $("#skillsPartial").hide();
        $("#hobbyPartial").hide();
        $("#LanguagePartial").hide();
    }
    else if (tab == "tabEducation") {
        $("#expPartial").hide();
        $("#personalPartial").hide();
        $("#eduPartial").show();
        $("#skillsPartial").hide();
        $("#hobbyPartial").hide();
        $("#LanguagePartial").hide();
    }
    else if (tab == "tabSkills") {
        $("#expPartial").hide();
        $("#personalPartial").hide();
        $("#eduPartial").hide();
        $("#skillsPartial").show();
        $("#hobbyPartial").hide();
        $("#LanguagePartial").hide();
    }
    else if (tab == "tabHobbies") {
        $("#expPartial").hide();
        $("#personalPartial").hide();
        $("#eduPartial").hide();
        $("#skillsPartial").hide();
        $("#hobbyPartial").show();
        $("#LanguagePartial").hide();
    }
    else if (tab == "tabLanguage") {
        $("#expPartial").hide();
        $("#personalPartial").hide();
        $("#eduPartial").hide();
        $("#skillsPartial").hide();
        $("#hobbyPartial").hide();
        $("#LanguagePartial").show();
    }
}
function onClickWorkingCompany(i) {
    debugger
    if ($("#checkBoxWorkingCompany" + i).prop('checked') == true) {
        $("#hiddenWrkngCmpny" + i).val(true);
        $("#dateExpEndDate" + i).prop('disabled', true);
    }
    else {
        $("#hiddenWrkngCmpny" + i).val(false);
        $("#dateExpEndDate" + i).prop('disabled', false);
    }
}
function addEmployment() {
    debugger
    var isValid = validateExperience();
    if (isValid) {
        var valdata = $("#frmExperienceDetails").serialize();
        $.ajax({
            url: "/User/AddNewExperience",
            type: "POST",
            dataType: 'html',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: valdata,
            success: function (result) {
                debugger
                $("#expPartial").html(result);
            }
        });
    }
}
function addEducation() {
    debugger
    var isValid = validateEducation();
    if (isValid) {
        var valdata = $("#frmEducationDetails").serialize();
        $.ajax({
            url: "/User/AddNewEducation",
            type: "POST",
            dataType: 'html',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: valdata,
            success: function (result) {
                debugger
                $("#eduPartial").html(result);
            }
        });
    }
}
function addSkill() {
    debugger
    var isValid = validateSkill();
    if (isValid) {
        var valdata = $("#frmSkillsDetails").serialize();
        $.ajax({
            url: "/User/AddNewSkill",
            type: "POST",
            dataType: 'html',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: valdata,
            success: function (result) {
                debugger
                $('#skillsPartial').html(null);
                $('#skillsPartial').html(result);
            }
        });
    }
}
function addHobby() {
    debugger
    var isValid = validateHobby();
    if (isValid) {
        var valdata = $("#frmHobbyDetails").serialize();
        $.ajax({
            url: "/User/AddNewHobby",
            type: "POST",
            dataType: 'html',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: valdata,
            success: function (result) {
                debugger
                $("#hobbyPartial").html(result);
            }
        });
    }
}
function addLanguage() {
    debugger
    var isValid = validateLanguage();
    if (isValid) {
        var valdata = $("#frmLanguageDetails").serialize();
        $.ajax({
            url: "/User/AddNewLanguage",
            type: "POST",
            dataType: 'html',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: valdata,
            success: function (result) {
                debugger
                $("#LanguagePartial").html(result);
            }
        });
    }
}
function removeEmployment(index) {
    debugger
    $('#hiddenEmplIsActive' + index).val(false);
    //$('#expTopDiv' + index).hide();
    $('#expTopDiv' + index).hide();
}
function removeEducation(index) {
    debugger
    $('#hiddenEduIsActive' + index).val(false);
    $('#eduTopDiv' + index).hide();
}
function removeSkill(index) {
    debugger
    $('#hiddenSkillsIsActive' + index).val(false);
    /*  $('#sklTopDiv' + index).css({ "display": "none" });*/
    $('#sklTopDiv' + index).hide();
}
function removeHobby(index) {
    debugger
    $('#hiddenHobbyIsActive' + index).val(false);
    $('#hbyTopDiv' + index).hide();
}
function removeLanguage(index) {
    debugger
    $('#hiddenLngIsActive' + index).val(false);
    $('#lngTopDiv' + index).hide();
}
function formatDate(date) {
    var date = new Date(parseInt(date.substr(6)));
    var month = date.getMonth() + 1;
    return (date.getDate().toString().length > 1 ? date.getDate() : "0" + date.getDate()) + "-" + (month.toString().length > 1 ? month : "0" + month) + "-" + date.getFullYear();
}
function validateExperience() {
    debugger
    var isValid = true;
    $(".clsExp").each(function () {
        if ($(this).find(".clsIsActive").val().toLowerCase() == "true") {
            if ($(this).find(".clsJobTitle").val() == null || $(this).find(".clsJobTitle").val() == '') {
                $(this).find(".clsJobTitle").next("span").html("Job Title is required");
                $(this).find(".clsJobTitle").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsJobTitle").next("span").html("");
                $(this).find(".clsJobTitle").css("border-color", "");
            }

            if ($(this).find(".clsEmployer").val() == null || $(this).find(".clsEmployer").val() == '') {
                $(this).find(".clsEmployer").next("span").html("Employer is required");
                $(this).find(".clsEmployer").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsEmployer").next("span").html("");
                $(this).find(".clsEmployer").css("border-color", "");
            }

            if ($(this).find(".clsCity").val() == null || $(this).find(".clsCity").val() == '') {
                $(this).find(".clsCity").next("span").html("City is required");
                $(this).find(".clsCity").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsCity").next("span").html("");
                $(this).find(".clsCity").css("border-color", "");
            }

            if ($(this).find(".clsCountry").val() == null || $(this).find(".clsCountry").val() == '') {
                $(this).find(".clsCountry").next("span").html("Country is required");
                $(this).find(".clsCountry").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsCountry").next("span").html("");
                $(this).find(".clsCountry").css("border-color", "");
            }

            if ($(this).find(".clsStartDate").val() == null || $(this).find(".clsStartDate").val() == '') {
                $(this).find(".clsStartDate").next("span").html("Start date is required");
                $(this).find(".clsStartDate").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsStartDate").next("span").html("");
                $(this).find(".clsStartDate").css("border-color", "");
            }
            if ($(this).find(".clsWrkngCmpny").val().toLowerCase() == "false") {
                if ($(this).find(".clsEndDate").val() == null || $(this).find(".clsEndDate").val() == '') {
                    $(this).find(".clsEndDate").next("span").html("End date is required");
                    $(this).find(".clsEndDate").css("border-color", "red");
                    isValid = false;
                }
                else {
                    $(this).find(".clsEndDate").next("span").html("");
                    $(this).find(".clsEndDate").css("border-color", "");
                }
            }
            else {
                $(this).find(".clsEndDate").next("span").html("");
                $(this).find(".clsEndDate").css("border-color", "");
            }
        }
    });
    //$(".clsJobTitle").each(function () {
    //    if ($(this).val() == null || $(this).val() == '') {
    //        $(this).next("span").html("Job Title is required");
    //        $(this).css("border-color", "red");
    //        isValid = false;
    //    }
    //    else {
    //        $(this).next("span").html("");
    //        $(this).css("border-color", "");
    //    }
    //});
    //$(".clsEmployer").each(function () {
    //    if ($(this).val() == null || $(this).val() == '') {
    //        $(this).next("span").html("Employer is required");
    //        $(this).css("border-color", "red");
    //        isValid = false;
    //    }
    //    else {
    //        $(this).next("span").html("");
    //        $(this).css("border-color", "");
    //    }
    //});
    //$(".clsCity").each(function () {
    //    if ($(this).val() == null || $(this).val() == '') {
    //        $(this).next("span").html("City is required");
    //        $(this).css("border-color", "red");
    //        isValid = false;
    //    }
    //    else {
    //        $(this).next("span").html("");
    //        $(this).css("border-color", "");
    //    }
    //});
    //$(".clsCountry").each(function () {
    //    if ($(this).val() == null || $(this).val() == '') {
    //        $(this).next("span").html("Country is required");
    //        $(this).css("border-color", "red");
    //        isValid = false;
    //    }
    //    else {
    //        $(this).next("span").html("");
    //        $(this).css("border-color", "");
    //    }
    //});
    //$(".clsStartDate").each(function () {
    //    if ($(this).val() == null || $(this).val() == '') {
    //        $(this).next("span").html("Start date is required");
    //        $(this).css("border-color", "red");
    //        isValid = false;
    //    }
    //    else {
    //        $(this).next("span").html("");
    //        $(this).css("border-color", "");
    //    }
    //});
    //$(".clsEndDate").each(function () {
    //    if ($(this).val() == null || $(this).val() == '') {
    //        $(this).next("span").html("End date is required");
    //        $(this).css("border-color", "red");
    //        isValid = false;
    //    }
    //    else {
    //        $(this).next("span").html("");
    //        $(this).css("border-color", "");
    //    }
    //});
    return isValid;
}
function validateEducation() {
    debugger
    var isValid = true;
    $(".clsEdu").each(function () {
        if ($(this).find(".clsEduIsActive").val().toLowerCase() == "true") {
            if ($(this).find(".clsEducation").val() == null || $(this).find(".clsEducation").val() == '') {
                $(this).find(".clsEducation").next("span").html("Education is required");
                $(this).find(".clsEducation").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsEducation").next("span").html("");
                $(this).find(".clsEducation").css("border-color", "");
            }

            if ($(this).find(".clsEduSchool").val() == null || $(this).find(".clsEduSchool").val() == '') {
                $(this).find(".clsEduSchool").next("span").html("School is required");
                $(this).find(".clsEduSchool").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsEduSchool").next("span").html("");
                $(this).find(".clsEduSchool").css("border-color", "");
            }

            if ($(this).find(".clsEduStartDate").val() == null || $(this).find(".clsEduStartDate").val() == '') {
                $(this).find(".clsEduStartDate").next("span").html("Start date is required");
                $(this).find(".clsEduStartDate").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsEduStartDate").next("span").html("");
                $(this).find(".clsEduStartDate").css("border-color", "");
            }

            if ($(this).find(".clsEduEndDate").val() == null || $(this).find(".clsEduEndDate").val() == '') {
                $(this).find(".clsEduEndDate").next("span").html("End date is required");
                $(this).find(".clsEduEndDate").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsEduEndDate").next("span").html("");
                $(this).find(".clsEduEndDate").css("border-color", "");
            }

            if ($(this).find(".clsEduCity").val() == null || $(this).find(".clsEduCity").val() == '') {
                $(this).find(".clsEduCity").next("span").html("City is required");
                $(this).find(".clsEduCity").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsEduCity").next("span").html("");
                $(this).find(".clsEduCity").css("border-color", "");
            }
        }
    });
    return isValid;
}
function validateSkill() {
    debugger
    var isValid = true;
    $(".clsSkill").each(function () {
        if ($(this).find(".clsSkillIsActive").val().toLowerCase() == "true") {
            if ($(this).find(".clsSkillName").val() == null || $(this).find(".clsSkillName").val() == '') {
                $(this).find(".clsSkillName").next("span").html("Skill name required");
                $(this).find(".clsSkillName").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsSkillName").next("span").html("");
                $(this).find(".clsSkillName").css("border-color", "");
            }

            if ($(this).find(".clsRating").val() == null || $(this).find(".clsRating").val() == '' || $(this).find(".clsRating").val() == '0'
                || parseInt($(this).find(".clsRating").val()) > 5 || parseInt($(this).find(".clsRating").val()) < 0) {
                $(this).find(".clsRating").next("span").html("Please enter a rating between 0 to 5");
                $(this).find(".clsRating").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsRating").next("span").html("");
                $(this).find(".clsRating").css("border-color", "");
            }
        }
    });
    return isValid;
}
function validateLanguage() {
    debugger
    var isValid = true;
    $(".clsLang").each(function () {
        if ($(this).find(".clsLngIsActive").val().toLowerCase() == "true") {
            if ($(this).find(".clsLngName").val() == null || $(this).find(".clsLngName").val() == '') {
                $(this).find(".clsLngName").next("span").html("Language is required");
                $(this).find(".clsLngName").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsLngName").next("span").html("");
                $(this).find(".clsLngName").css("border-color", "");
            }
        }
    });
    return isValid;
}
function validateHobby() {
    debugger
    var isValid = true;
    $(".clsHobby").each(function () {
        if ($(this).find(".clsHobbyIsActive").val().toLowerCase() == "true") {
            if ($(this).find(".clsHobbyName").val() == null || $(this).find(".clsHobbyName").val() == '') {
                $(this).find(".clsHobbyName").next("span").html("Hobby is required");
                $(this).find(".clsHobbyName").css("border-color", "red");
                isValid = false;
            }
            else {
                $(this).find(".clsHobbyName").next("span").html("");
                $(this).find(".clsHobbyName").css("border-color", "");
            }
        }
    });
    return isValid;
}