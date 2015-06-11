var map;

function initialize() {
	
	  var mapOptions = {
		  	    zoom: 12,
		  	    maxZoom: 16, 
		  	    mapTypeControl: true,
		  	    mapTypeControlOptions: {
		  	        style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
		  	        position: google.maps.ControlPosition.BOTTOM_CENTER
		  	    },
		  	    zoomControl: true,
		  	    zoomControlOptions: {
		  	        style: google.maps.ZoomControlStyle.LARGE,
		  	        position: google.maps.ControlPosition.LEFT_CENTER
		  	    },
		  	    
		  	  } 
	  
	  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  // Try HTML5 geolocation
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);



      map.setCenter(pos);
    }, function() {
      handleNoGeolocation(true);
    });
  } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }
  setMarkers(map, pings);
 
}

function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(60, 105),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}

google.maps.event.addDomListener(window, 'load', initialize);




function searchBar() {

  // Create the search box and link it to the UI element.
  var input = /** @type {HTMLInputElement} */(
      document.getElementById('pac-input'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input));

  // Listen for the event fired when the user selects an item from the
  // pick list. Retrieve the matching places for that item.
  google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }
 
    // For each place, get the icon, place name, and location.
   
    var bounds = new google.maps.LatLngBounds();
  
    for (var i = 0, place; place = places[i]; i++) {
         bounds.extend(place.geometry.location);
    }

    map.fitBounds(bounds);
  });

  // Bias the SearchBox results towards places that are within the bounds of the
  // current map's viewport.
  google.maps.event.addListener(map, 'bounds_changed', function() {
    var bounds = map.getBounds();
    searchBox.setBounds(bounds);
    
  });
  

}

google.maps.event.addDomListener(window, 'load', searchBar);

