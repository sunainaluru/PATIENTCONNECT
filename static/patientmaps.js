"use strict";

// #Change your JS to Jquery, where possible
// #Use double quotes

function initMap() {
    // Specify where the map is centered
    // Defining this variable outside of the map optios markers
    // it easier to dynamically change if you need to recenter
    let myLatLng = {lat: -34.397, lng: 150};
    //You should change this based on markers

    // Create a map object and specify the DOM element for display.
    let map = new google.maps.Map(document.getElementById("map"), {
        center: myLatLng,
        zoom: 8,
        streetViewControl: false
    });

    make_markers(map);
}

function make_markers(map) {

    let cond_id = $("#cond_id").text();
    let url = `/conditions/${cond_id}/address.json`;
    $.get(url, (address_dict) => {

      let address, marker;

      for (let key in address_dict) {
            address = address_dict[key];

            // Define the marker
            let geocoder = new google.maps.Geocoder();

            geocoder.geocode({'address': address}, function(results, status) {
                for (let result in results) {
                    console.log(status)
                    console.log(results[result].geometry.location.lat(), results[result].geometry.location.lng());
                    let LatLng = {lat: results[result].geometry.location.lat(), lng: results[result].geometry.location.lng()};
                    map.setCenter(LatLng)
                    let marker = new google.maps.Marker({
                        position: LatLng,
                        map: map,
                        label: "Trial Location"
                    })
                }
            });
        }
    });       
}