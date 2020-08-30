$( document ).ready(function() {
    var url = window.location.origin;

    // GET REQUEST
    $("#searchButton").click(function(event){
        event.preventDefault();
        ajaxGet();
    });


    // DO GET
    function ajaxGet(){
        var passportNumber = $("#passportNumber").val().toLowerCase();
        var apiurl = url + "/profile/getProfile/" + passportNumber;
        $.getJSON(apiurl, function (data) {


            const table = new Tabulator("#search-table", {
                data: data,
                layout: "fitColumns",
                columns: [{
                    title: "Name",
                    field: "name",
                    width: 150
                }, {
                    title: "PassPort Number",
                    field: "passportNumber",
                    align: "left",
                }, {
                        title: "Country",
                        field: "country",
                        align: "left",
                }, {
                        title: "PassPort Type",
                        field: "passportType",
                        align: "left",
                }, {
                        title: "isPreclearanceDone",
                        field: "preclearanceDone",
                        align: "left",
                }, {
                        title: "isBlacklisted",
                        field: "blacklisted",
                        align: "left",
                },],
            });

        });

    }
})

$( document ).ready(function() {
    var url = window.location.origin;

    // GET REQUEST
    $("#allProfileButton").click(function(event){
        event.preventDefault();
        ajaxGet();
    });


    // DO GET
    function ajaxGet(){
        var apiurl = url + "/profile/getAllProfiles";
        $.getJSON(apiurl, function (data) {


            const table = new Tabulator("#search-table", {
                data: data,
                layout: "fitColumns",
                columns: [{
                    title: "Name",
                    field: "name",
                    width: 150
                }, {
                    title: "PassPort Number",
                    field: "passportNumber",
                    align: "left",
                }, {
                    title: "Country",
                    field: "country",
                    align: "left",
                }, {
                    title: "PassPort Type",
                    field: "passportType",
                    align: "left",
                }, {
                    title: "isPreclearanceDone",
                    field: "preclearanceDone",
                    align: "left",
                }, {
                    title: "isBlacklisted",
                    field: "blacklisted",
                    align: "left",
                },],
            });

        });

    }
})
