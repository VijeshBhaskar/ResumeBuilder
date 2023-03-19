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

    //$("#dvWarrantyDetails").hide();
    //$("#txtInstallerName").autocomplete({
    //    source: function (request, response) {
    //        $.ajax({
    //            url: "/User/SelectInstallerDetailsByName",
    //            data: { installerName: request.term },
    //            success: function (res) {
    //                var data = $.map(res.Data, function (item) {
    //                    return {
    //                        label: item.InstallerName,
    //                        installerDetailsID: item.InstallerDetailsID,
    //                        address: item.Address
    //                    };
    //                });

    //                response(data);
    //            }
    //        });
    //    },
    //    select: function (event, ui) {
    //        $("#hdnInstallerDetailsID").val(ui.item ? ui.item.installerDetailsID : 0);
    //    },
    //    change: function (event, ui) {
    //        $("#hdnInstallerDetailsID").val(ui.item ? ui.item.installerDetailsID : 0);
    //    }
    //});

    //$("#txtRoleID1").blur(function () {
    //    $.ajax({
    //        type: "GET",
    //        url: "/User/SelectWarrantyByRoleID",
    //        data: { roleID: $("#txtRoleID1").val() },
    //        contentType: "application/json",
    //        headers: {
    //            'Access-Control-Allow-Origin': '*',
    //        },
    //        success: function (response) {
    //            if (response != null) {
    //                switch (response.Status) {
    //                    case ResponseCode.Success:
    //                        $("#txtWarranty1").val(response.Data);
    //                        break;
    //                    case ResponseCode.InvalidRequest:
    //                        $("#txtWarranty1").val(null);
    //                        toastr.error(response.Message);
    //                        break;
    //                }
    //            }
    //            else {
    //                toastr.error(response.Message);
    //            }
    //        },
    //        error: function (err) {
    //            console.log(err, 'ajax txtRoleID blur error...');
    //        }
    //    });
    //});
    //$("#txtRoleID2").blur(function () {
    //    $.ajax({
    //        type: "GET",
    //        url: "/User/SelectWarrantyByRoleID",
    //        data: { roleID: $("#txtRoleID2").val() },
    //        contentType: "application/json",
    //        headers: {
    //            'Access-Control-Allow-Origin': '*',
    //        },
    //        success: function (response) {
    //            if (response != null) {
    //                switch (response.Status) {
    //                    case ResponseCode.Success:
    //                        $("#txtWarranty2").val(response.Data);
    //                        break;
    //                    case ResponseCode.InvalidRequest:
    //                        $("#txtWarranty2").val(null);
    //                        toastr.error(response.Message);
    //                        break;
    //                }
    //            }
    //            else {
    //                toastr.error(response.Message);
    //            }
    //        },
    //        error: function (err) {
    //            console.log(err, 'ajax txtRoleID blur error...');
    //        }
    //    });
    //});
    //$('#txtPhoneNumber,#txtWarrantyPhoneNumber').on('keypress', function (key) {
    //    if (key.charCode < 48 || key.charCode > 57) {
    //        return false;
    //    }
    //});
    //$("#txtPhoneNumber,#txtWarrantyPhoneNumber").bind("paste", function (event) {
    //    if (event.originalEvent.clipboardData.getData('Text').match(/[^\d]/)) {
    //        event.preventDefault();
    //    }
    //});

    //$("body").on("click", "#btnAddRow", function () {
    //    $("#rw2").show();
    //    $("#btnAddRow").hide();
    //});
    //$("body").on("click", "#btnRemoveRow", function () {
    //    $("#rw2").hide();
    //    $("#btnAddRow").show();
    //    $("#txtRoleID2").val('');
    //    $("#txtWarranty2").val('');
    //    $("#txtConsumedQty2").val('');
    //});

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
        email.next("span").html("email id is required");
        email.css("border-color", "red");
        isValid = false;
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
        dataType: 'json',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: valdata,
        success: function (data, textStatus, XmlHttpRequest) {
            debugger;
            $("#loader").hide();
            if (XmlHttpRequest.status === 200) {
                TabClick('tabExperience');
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $("#loader").hide();
            alert(errorThrown);
        }
    });
}

function InsertExperienceDetails() {
    var isValid = true;

    if (!ValidateForm("frmPersonalDetails")) {
        isValid = false;
    }

  /*  $("#frmExperienceDetails").submit();*/

    $("#loader").show();
    debugger
    var valdata = $("#frmExperienceDetails").serialize();
    $.ajax({
        url: "/User/InsertExperienceDetails",
        type: "POST",
        dataType: 'json',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: valdata,
        success: function (data, textStatus, XmlHttpRequest) {
            debugger;
            $("#loader").hide();
            if (XmlHttpRequest.status === 200) {
                TabClick('tabEducation');
            }
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

    $("#frmEducationDetails").submit();
}
function ViewResume() {
    $("#frmViewResume").submit();
}

function TabClick(tab) {
    debugger
    $(".column").css("background-color", "black");
    $("#" + tab).css("background-color", "#f5af05");

    if (tab == "tabExperience") {
        $("#dvPersonalDetails").hide();
        $("#dvExperience").show();
        $("#dvEducation").hide();
    }
    else if (tab == "tabPersonalDetails") {
        $("#dvExperience").hide();
        $("#dvPersonalDetails").show();
        $("#dvEducation").hide();
    }
    else if (tab == "tabEducation") {
        $("#dvExperience").hide();
        $("#dvPersonalDetails").hide();
        $("#dvEducation").show();
    }
}
function formatDate(date) {
    var date = new Date(parseInt(date.substr(6)));
    var month = date.getMonth() + 1;
    return (date.getDate().toString().length > 1 ? date.getDate() : "0" + date.getDate()) + "-" + (month.toString().length > 1 ? month : "0" + month) + "-" + date.getFullYear();
}