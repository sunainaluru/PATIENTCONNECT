"use strict";

function initMap() {
    // Specify where the map is centered
    // Defining this variable outside of the map optios markers
    // it easier to dynamically change if you need to recenter
    let myLatLng = {lat: -34.397, lng: 150};
    //You should change this based on markers

    // Create a map object and specify the DOM element for display.
    let map = new google.maps.Map(document.getElementById("map"), {
        center: myLatLng,
        disableDoubleClickZoom: true
    });

    make_markers(map);
}

function make_markers(map) {

    const si_table = $("#si_table");
    const si_dict = si_table.data("sites");


    var i;
    var bounds = new google.maps.LatLngBounds();

    for (i = 0; i < si_dict.length; i++) {

        let LatLng = {lat: si_dict[i]["site_lat"], lng: si_dict[i]["site_lng"]};

        let marker = new google.maps.Marker({
            position: LatLng,
            map: map,
        });

        bounds.extend(marker.position);

        var infowindow = new google.maps.InfoWindow({
            content: si_dict[i]["site_address"]
        });

        marker.addListener("click", function() {
            map.setZoom(10);
            map.setCenter(marker.getPosition());
            infowindow.open(map, marker);
        });
    };

    map.fitBounds(bounds);

    map.addListener("click", function() {
        map.fitBounds(bounds);
        map.setCenter(bounds.getCenter());
    });

};       
