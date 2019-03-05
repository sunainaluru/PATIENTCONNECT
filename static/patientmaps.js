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

    const si_table = $('#si_table');
    const si_dict = si_table.data('sites');


    var i;
    for (i = 0; i < si_dict.length; i++) {

        var bounds = new google.maps.LatLngBounds();

        let LatLng = {lat: si_dict[i]['site_lat'], lng: si_dict[i]['site_lng']};
                
        let marker = new google.maps.Marker({
            position: LatLng,
            map: map,
            label: "Click to Zoom"
        });

        bounds.extend(LatLng);

        // var infowindow = new google.maps.InfoWindow({
        //     content: results[result].formatted_address
        // });

        // marker.addListener('click', function() {
        //     map.setZoom(10);
        //     map.setCenter(marker.getPosition());
        // });

        // marker.addListener('click', function() {
        //     infowindow.open(map, marker);
        // });
    }
    map.fitBounds(bounds);
    // let rect = new google.maps.Rectangle( {bounds: bounds, map: map} );
    // console.log(bounds);
    
      
}       
