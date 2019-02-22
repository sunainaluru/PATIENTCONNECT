"use strict";

var map;
function initMap() {
    // Specify where the map is centered
    // Defining this variable outside of the map optios markers
    // it easier to dynamically change if you need to recenter
    let myLatLng = {lat: -34.397, lng: 150};
    //You should change this based on markers

    // Create a map object and specify the DOM element for display.
    let map = new google.maps.Map(document.getElementById('map'), {
        center: myLatLng,
        zoom: 8,
            });
}

var geocoder 

$.get('/conditions/<cond_id>/address.json', (address_dict) => function geocodeAddress(geocoder, resultsMap){

      let address, marker, html;

      for (let key in address_dict) {
            address = address_dict[key];

            // Define the marker
            let geocoder = new google.maps.Geocoder();
            geocoder.geocode({'address': address}, function(results, status) {
            let marker = new google.maps.Marker({
              map: map,
              position: results[0].geometry.location
            });
             
        })}});        



// google.maps.event.addDomListener(window, 'load', initMap);