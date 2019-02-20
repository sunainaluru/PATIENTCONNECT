function initMap() {
    // Specify where the map is centered
    // Defining this variable outside of the map optios markers
    // it easier to dynamically change if you need to recenter
    let myLatLng = {lat: 72, lng: -140};

    // Create a map object and specify the DOM element for display.
    let map = new google.maps.Map(document.getElementById('map'), {
        center: myLatLng,
        scrollwheel: false,
        zoom: 5,
        zoomControl: true,
        panControl: false,
        streetViewControl: false,
        mapTypeId: google.maps.MapTypeId.TERRAIN
    });
}

var geocoder = new google.maps.Geocoder();

function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('address').value;
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }