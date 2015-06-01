<!DOCTYPE html>
<html lang="en">
<head>
  <title>Pingr</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="booty.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>  
  <script src="https://maps.googleapis.com/maps/api/js"> </script>
  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>
  
  
  

  
  
  <script type="text/javascript">
  	  
  	 var map;
  	function initialize() {

  	  var markers = [];
  	  map = new google.maps.Map(document.getElementById('map-canvas'), {
  	    mapTypeId: google.maps.MapTypeId.ROADMAP
  	  });

  	if(navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) { 
  	  var defaultBounds = new google.maps.LatLngBounds(new google.maps.LatLng(position.coords.latitude,
	          position.coords.longitude), new google.maps.LatLng(position.coords.latitude+ 0.5,
			          position.coords.longitude+ 0.5));
	  map.fitBounds(defaultBounds); 

	    }, function() {
	      handleNoGeolocation(true);
	    });
	  } else {
	    // Browser doesn't support Geolocation
	    handleNoGeolocation(false);
	  }
	  
  	  // Create the search box and link it to the UI element.
  	  var input = /** @type {HTMLInputElement} */(
  	      document.getElementById('pac-input'));
  	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  	  var searchBox = new google.maps.places.SearchBox(
  	    /** @type {HTMLInputElement} */(input));

  	  // [START region_getplaces]
  	  // Listen for the event fired when the user selects an item from the
  	  // pick list. Retrieve the matching places for that item.
  	  google.maps.event.addListener(searchBox, 'places_changed', function() {
  	    var places = searchBox.getPlaces();

  	    if (places.length == 0) {
  	      return;
  	    }
  	    for (var i = 0, marker; marker = markers[i]; i++) {
  	      marker.setMap(null);
  	    }

  	    // For each place, get the icon, place name, and location.
  	    markers = [];
  	    var bounds = new google.maps.LatLngBounds();
  	    for (var i = 0, place; place = places[i]; i++) {
  	      var image = {
  	        zoom: 12,
  	        url: place.icon,
  	        size: new google.maps.Size(100, 100),
  	        origin: new google.maps.Point(0, 0),
  	        anchor: new google.maps.Point(17, 34),
  	        scaledSize: new google.maps.Size(55, 55)
  	      };

  	
  	      markers.push(marker);

  	      bounds.extend(place.geometry.location);
  	    }

  	    map.fitBounds(bounds);
  	  });
  	  // [END region_getplaces]

  	  // Bias the SearchBox results towards places that are within the bounds of the
  	  // current map's viewport.
  	  google.maps.event.addListener(map, 'bounds_changed', function() {
  	    var bounds = map.getBounds();
  	    searchBox.setBounds(bounds);
  	    map.setZoom(7);
  	  });
  	}
  	
  	//Show Hide Funtion for the Search Button
  	
  		function showHide() {
  			
	  		console.log("I am in the show hide");
	  			$("#searchButton").click(function(e){
	  				e.preventDefault();
	  				$("#pac-input").toggle();
	  			});
  		}


  	

  	google.maps.event.addDomListener(window, 'load', initialize);
          
    function detectBrowser() {
  var useragent = navigator.userAgent;
  var mapdiv = document.getElementById("map-canvas");

  if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1 ) {
    mapdiv.style.width = '100%';
    mapdiv.style.height = '100%';
  } else {
    mapdiv.style.width = '600px';
    mapdiv.style.height = '800px';
  }
}
          detectBrowser();
          
    </script>
    
</head>
<body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header pull-left">
            <a class="navbar-brand" href="/PingrHib/FetchData">Pingr</a>
        </div>

		<div class="navbar-header pull-right littleP">
            <a href="post.jsp"><span class="glyphicon glyphicon-pencil bigger extraP"></span></a>
        </div>
    </div>
</div>
       
  <input id="pac-input" class="controls" type="text" placeholder="Search" style="display:none"> 

 <div id="map-canvas" style="height: 100%, width: 100%;"></div>


<div class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
    <div class="container">
        <div id="searchButton" class="navbar-header pull-left" onclick="showHide()">
            <a href="#" class="navbar-brand"><span class="glyphicon glyphicon-search bigger extraP"></span></a>
        </div>

		<div class="navbar-header pull-right littleP">
            <a href="info.jsp"><span class="glyphicon glyphicon-info-sign bigger extraP"></span></a>
            
        </div>
    </div>
</div>
    

</body>
    

</html> 

