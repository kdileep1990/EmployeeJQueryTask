/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    $.ajax({
        type: "get",
        url: "search.html",
        cache: false,
        success: function(response) {
            var responseJSON = $.parseJSON(response);
            var firstNames = responseJSON.firstNames
            $("#firstName").autocomplete({
                source: responseJSON.firstNames
            });
            $("#lastName").autocomplete({
                source: responseJSON.lastNames
            });
            $("#searchEmail").autocomplete({
                source: responseJSON.emails
            });
        },
        error: function() {
            alert('Error while request.');
        }
    });
    $("body").on("change", "#userType", function() {
        if ($("#userType").val() != "")
            $("#searchParameter").parent().parent().parent().show();
        else
            $(".search").hide();
    });
    $("body").on("change", "#searchParameter", function() {
        var selectedParameters = $("#searchParameter").val()
        if (selectedParameters != null)
        {
            $(".search").hide();
            $("#searchUser").show()
            $("#searchParameter").parent().parent().parent().show();
            for (var i = 0; i < selectedParameters.length; i++)
                $("#" + selectedParameters[i]).parent().parent().parent().show();
        }
        else
        {
            $(".search").hide();
            $("#searchParameter").parent().parent().parent().show();
        }
    });
    $("body").on("click", "#startSearch", function() {
        var requestData = "";
        if ($("#firstName").parent().parent().parent().css('display') != 'none')
            requestData = 'firstName=' + $("#firstName").val();
        else
            requestData = 'firstName=';
//                    alert($("#lastName").val())
        if ($("#lastName").parent().parent().parent().css('display') != 'none')
            requestData = requestData + '&lastName=' + $("#lastName").val();
        else
            requestData = requestData + '&lastName=';
        if ($("#searchEmail").parent().parent().parent().css('display') != 'none')
            requestData = requestData + '&email=' + $("#searchEmail").val();
        else
            requestData = requestData + '&email=';
        requestData = requestData + '&userType=' + $("#userType").val();
//                    alert(requestData)
        $.ajax({
            type: "post",
            url: "search.html",
            cache: false,
            data: requestData,
            success: function(response) {
                var responseJSON = response;
                if (responseJSON.length == 0)
                {
                    alert("no data related to your search")
                    return;
                }
                $("table.search").show();
                $("table.search > tbody").html("")
                for (var i = 0; i < responseJSON.length; i++)
                    $("table.search > tbody:last").append('<tr><form><td><span class="value" id="firstName">' + responseJSON[i].firstname + '</span><input type="text" required id="firstNameEdit" class="edit input-medium"></td>' +
                            '<td><span class="value" id="lastName">' + responseJSON[i].lastname + '</span><input required type="text" id="lastNameEdit" class="edit input-medium"></td>' +
                            '<td><span class="value" id="email">' + responseJSON[i].emailid + '</span><input required type="text" id="emailEdit" class="edit input-medium"></td>' +
                            '<td><span class="value" id="salary">' + responseJSON[i].salary + '</span><input required type="text" id="salaryEdit" class="edit input-medium">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="save" class="btn btn-info edit" type="submit">Save</button><div class="btn-group" style="float:right;"><button class="btn"><i class="icon-cog"></i></button><button class="btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button><ul class="dropdown-menu"><li><a id="delete" href="#">Delete</a></li><li><a id="edit" href="#">Edit</a></li></ul></div></td></form></tr>');
                $(".edit").hide();
            },
            error: function() {
                alert('Error while request.');
            }
        });
        return false;
    });
    $("body").on("click", "#delete", function() {
        var row = $(this).parent().parent().parent().parent().parent().get(0);
//                    alert($(row).find("#email").text())
        $.ajax({
            type: "post",
            url: "delete.html",
            cache: false,
            data: 'emailid=' + $(row).find("#email").text(),
            success: function(response) {
                if (response == "true")
                {
                    $(row).remove();
                    if ($("table.search > tbody").text() == "")
                        $("table.search").hide();
                    alert("deleted successfully")
                }
                else
                    alert("unable to delete")
            },
            error: function() {
                alert('Error while request.');
            }
        });
    });
    $("body").on("click", "#edit", function() {
        var row = $(this).parent().parent().parent().parent().parent().get(0);
        $(row).find("#firstName").hide();
        $(row).find("#firstNameEdit").val($(row).find("#firstName").text());
        $(row).find("#lastName").hide();
        $(row).find("#lastNameEdit").val($(row).find("#lastName").text());
        $(row).find("#email").hide();
        $(row).find("#emailEdit").val($(row).find("#email").text());
        $(row).find("#salary").hide();
        $(row).find("#salaryEdit").val($(row).find("#salary").text());
        $(row).find(".edit").show();
    });
    $("body").on("click", "#save", function() {
        var row = $(this).parent().parent().get(0);
        $.ajax({
            type: "post",
            url: "edit.html",
            cache: false,
            data: 'firstname=' + $(row).find("#firstNameEdit").val() + '&lastname=' + $(row).find("#lastNameEdit").val() + '&emailid=' + $(row).find("#emailEdit").val() + '&salary=' + $(row).find("#salaryEdit").val() + '&oldemail=' + $(row).find("#email").text(),
            success: function(response) {
                if (response == "true")
                {
                    $(row).find("#firstName").show();
                    $(row).find("#firstName").text($(row).find("#firstNameEdit").val());
                    $(row).find("#lastName").show();
                    $(row).find("#lastName").text($(row).find("#lastNameEdit").val());
                    $(row).find("#email").show();
                    $(row).find("#email").text($(row).find("#emailEdit").val());
                    $(row).find("#salary").show();
                    $(row).find("#salary").text($(row).find("#salaryEdit").val());
                    $(row).find(".edit").hide();
                    alert("updated successfully")
                }
                else
                    alert(response)
            },
            error: function() {
                alert('Error while request.');
            }
        });
    });
});