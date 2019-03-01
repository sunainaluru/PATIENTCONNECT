"use strict";

// Change your JS to Jquery, where possible
// Use double quotes
// For demo, condition 367 is really good OR 376 is really good!

function initMap() {
    // Specify where the map is centered
    // Defining this variable outside of the map optios markers
    // it easier to dynamically change if you need to recenter
    let myLatLng = {lat: -34.397, lng: 150};
    //You should change this based on markers

    // Create a map object and specify the DOM element for display.
    let map = new google.maps.Map(document.getElementById("map"), {
        center: myLatLng,
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
            var bounds = new google.maps.LatLngBounds();

            geocoder.geocode({'address': address}, function(results, status) {
                
                for (let result in results) {
                    console.log(status)
                    console.log(results[result].geometry.location.lat(), results[result].geometry.location.lng());
                    let LatLng = {lat: results[result].geometry.location.lat(), lng: results[result].geometry.location.lng()};
                    
                    let marker = new google.maps.Marker({
                        position: LatLng,
                        map: map,
                        label: "Click to Zoom"
                    })

                    bounds.extend(marker.getPosition());

                    var infowindow = new google.maps.InfoWindow({
                        content: results[result].formatted_address
                    });

                    marker.addListener('click', function() {
                        map.setZoom(10);
                        map.setCenter(marker.getPosition());
                    });

                    marker.addListener('click', function() {
                        infowindow.open(map, marker);
                    });
                }

                map.fitBounds(bounds);
            });
        }
    });       
}
