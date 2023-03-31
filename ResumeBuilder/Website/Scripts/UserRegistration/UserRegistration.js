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
    
    $("#dvWarrantyDetails").hide();
    $("#txtInstallerName").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "/User/SelectInstallerDetailsByName",
                data: { installerName: request.term },
                success: function (res) {
                    var data = $.map(res.Data, function (item) {
                        return {
                            label: item.InstallerName,
                            installerDetailsID: item.InstallerDetailsID,
                            address: item.Address
                        };
                    });

                    response(data);
                }
            });
        },
        select: function (event, ui) {
            $("#hdnInstallerDetailsID").val(ui.item ? ui.item.installerDetailsID : 0);
        },
        change: function (event, ui) {
            $("#hdnInstallerDetailsID").val(ui.item ? ui.item.installerDetailsID : 0);
        }
    });

    $("#txtRoleID1").blur(function () {
        $.ajax({
            type: "GET",
            url: "/User/SelectWarrantyByRoleID",
            data: { roleID: $("#txtRoleID1").val() },
            contentType: "application/json",
            headers: {
                'Access-Control-Allow-Origin': '*',
            },
            success: function (response) {
                if (response != null) {
                    switch (response.Status) {
                        case ResponseCode.Success:
                            $("#txtWarranty1").val(response.Data);
                            break;
                        case ResponseCode.InvalidRequest:
                            $("#txtWarranty1").val(null);
                            toastr.error(response.Message);
                            break;
                    }
                }
                else {
                    toastr.error(response.Message);
                }
            },
            error: function (err) {
                console.log(err, 'ajax txtRoleID blur error...');
            }
        });
    });
    $("#txtRoleID2").blur(function () {
        $.ajax({
            type: "GET",
            url: "/User/SelectWarrantyByRoleID",
            data: { roleID: $("#txtRoleID2").val() },
            contentType: "application/json",
            headers: {
                'Access-Control-Allow-Origin': '*',
            },
            success: function (response) {
                if (response != null) {
                    switch (response.Status) {
                        case ResponseCode.Success:
                            $("#txtWarranty2").val(response.Data);
                            break;
                        case ResponseCode.InvalidRequest:
                            $("#txtWarranty2").val(null);
                            toastr.error(response.Message);
                            break;
                    }
                }
                else {
                    toastr.error(response.Message);
                }
            },
            error: function (err) {
                console.log(err, 'ajax txtRoleID blur error...');
            }
        });
    });
    $('#txtPhoneNumber,#txtWarrantyPhoneNumber').on('keypress', function (key) {
        if (key.charCode < 48 || key.charCode > 57) {
            return false;
        }
    });
    $("#txtPhoneNumber,#txtWarrantyPhoneNumber").bind("paste", function (event) {
        if (event.originalEvent.clipboardData.getData('Text').match(/[^\d]/)) {
            event.preventDefault();
        }
    });

    $("body").on("click", "#btnAddRow", function () {
        $("#rw2").show();
        $("#btnAddRow").hide();
    });
    $("body").on("click", "#btnRemoveRow", function () {
        $("#rw2").hide();
        $("#btnAddRow").show();
        $("#txtRoleID2").val('');
        $("#txtWarranty2").val('');
        $("#txtConsumedQty2").val('');
    });

});

function InsertPersonalDetails() {
    var isValid = true;

    if (!ValidateForm("frmPersonalDetails")) {
        isValid = false;
    }

    var firstName = $("#txtFirstName");

    if (firstName.val() == null) {
        firstName.next("span").html("First name is required");
        firstName.css("border-color", "red");
        isValid = false;
    }
    else {
        firstName.next("span").html("");
        firstName.css("border-color", "");
    }
    //if ($("#txtRoleID2").val() != '' && $("#txtRoleID2").val() > 0) {
    //    if ($("#txtConsumedQty2").val() == '') {
    //        $("#txtConsumedQty2").next("span").html("consumed quantity is required");
    //        email.css("border-color", "red");
    //        isValid = false;
    //    }
    //    else {
    //        $("#txtConsumedQty2").next("span").html("");
    //        $("#txtConsumedQty2").css("border-color", "");
    //    }
    //    if ($("#txtWarranty2").val() == '') {
    //        $("#txtWarranty2").next("span").html("warranty is required");
    //        email.css("border-color", "red");
    //        isValid = false;
    //    }
    //    else {
    //        $("#txtWarranty2").next("span").html("");
    //        $("#txtWarranty2").css("border-color", "");
    //    }
    //}
    //else {
    //    if ($("#txtConsumedQty2").val() != '' && $("#txtConsumedQty2").val() > 0) {
    //        $("#txtRoleID2").next("span").html("roll id is required");
    //        email.css("border-color", "red");
    //        isValid = false;
    //    }
    //    else {
    //        $("#txtRoleID2").next("span").html("");
    //        $("#txtRoleID2").css("border-color", "");
    //    }
    //}
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
    //if ($("#txtRoleID1").val()!='' && $("#txtRoleID1").val() == $("#txtRoleID2").val()) {
    //    isValid = false;
    //    toastr.error("Duplicate Roll ID");
    //}
    //if (!isValid) {
    //    return false;
    //}

    $("#loader").show();

    var model = {
        FirstName: $("#txtFirstName").val(),
        LastName: $("#txtLastName").val(),
        Email: $("#txtEmail").val(),
        PhoneNumber: $("#txtPhoneNumber").val(),
        Address: $("#txtAddress").val()
    };
    $.ajax({
        type: "POST",
        url: "/User/InsertPersonalDetails",
        data: JSON.stringify(model),
        contentType: "application/json",
        headers: {
            'Access-Control-Allow-Origin': '*',
        },
        success: function (response) {
            $("#loader").hide();
            if (response != null) {
                switch (response.Status) {
                    case ResponseCode.Success:
                        toastr.success("Registered Successfully");
                        ClearForm('frmPersonalDetails');
                        break;
                    case ResponseCode.Failed:
                    case ResponseCode.Error:
                    case ResponseCode.ModelIsNotValid:
                        toastr.error(response.Message);
                        break;
                }
            }
            else {
                message = "Registration Failed";
                toastr.error(message);
            }
        },
        error: function (err) {
            console.log(err, 'ajax InsertUserDetails error...');
        }
    });
}

function CheckWarrantyDetails() {
    if (!ValidateForm("frmWarrantyCheck")) {
        return false;
    }

    var model = {
        VIN: $("#txtWarrantyVIN").val(),
        PhoneNumber: $("#txtWarrantyPhoneNumber").val()
    };
    $.ajax({
        type: "POST",
        url: "/User/CheckWarranty",
        data: JSON.stringify(model),
        contentType: "application/json",
        headers: {
            'Access-Control-Allow-Origin': '*',
        },
        success: function (response) {
            if (response != null) {
                switch (response.Status) {
                    case ResponseCode.Success:
                        if (response.Data == null) {
                            $("#invalidMsg").show();
                            $("#invalidMsg").text("no record found!");
                            $("#dvWarrantyCheckDetails").hide();
                        }
                        else {
                            $("#invalidMsg").hide();
                            $("#dvWarrantyCheckDetails").show();
                            var messgae = response.Data.IsWarrantyAvailable ? "Your warranty expires on " + formatDate(response.Data.WarrantyExpiryDate) : "Your warranty expired on " + formatDate(response.Data.WarrantyExpiryDate);
                            ClearForm('frmWarrantyCheck');
                            if (response.Data.IsWarrantyAvailable) {
                                $('#waarantyExpiredMsg').hide();
                                $('#waarantyExpireMsg').show();
                                $('#waarantyExpireMsg').text(messgae);
                            }
                            else {
                                $('#waarantyExpireMsg').hide();
                                $('#waarantyExpiredMsg').show();
                                $('#waarantyExpiredMsg').text(messgae);
                            }

                            $('#warrantyUserName').text(response.Data.UserName);
                            $('#warrantyPhoneNumber').text(response.Data.PhoneNumber);
                            $('#warrantyEmail').text(response.Data.Email);
                            $('#warrantyVin').text(response.Data.VIN);
                            $('#warrantyRegNo').text(response.Data.RegistrationNumber);
                            $('#warranty').text(response.Data.Warranty);
                            $('#warrantyInstaller').text(response.Data.InstallerName);
                            $('#roleID').text(response.Data.RoleID);
                        }
                        break;
                    case ResponseCode.Failed:
                    case ResponseCode.Error:
                    case ResponseCode.ModelIsNotValid:
                        toastr.error(response.Message);
                        break;
                }
            }
            else {
                message = "Warranty checking Failed";
                toastr.error(message);
            }
        },
        error: function (err) {
            console.log(err, 'ajax CheckWarrantyDetails error...');
        }
    });
}

function TabClick(tab) {
    debugger
    $(".column").css("background-color", "black");
    $("#" + tab).css("background-color", "#f5af05");

    if (tab == "tabExperience") {
        $("#dvPersonalDetails").hide();
        $("#dvExperience").show();
    }
    else if (tab == "tabPersonalDetails") {
        $("#dvExperience").hide();
        $("#dvPersonalDetails").show();
        $("#dvWarrantyCheckDetails").hide();
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