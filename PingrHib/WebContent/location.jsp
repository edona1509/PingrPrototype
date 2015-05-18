<!DOCTYPE html>
<html>
  <head>
    <title>Geolocation</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
      <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
     
      <script>
    
// Note: This example requires that you consent to location sharing when
// prompted by your browser. If you see a blank space instead of the map, this
// is probably because you have denied permission for location sharing.
			
			var map;
      		var pos;
      		var lat;
      		var lon;
      		
			function initialize() {
			  var mapOptions = {
			    zoom: 8
			  };
			
			  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
			
			  // Try HTML5 geolocation
			  if(navigator.geolocation) {
			    navigator.geolocation.getCurrentPosition(function(position) {
			    
			    pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			     
				   lat = position.coords.latitude;
				   lon = position.coords.longitude;
			      		      
			      document.getElementById('locationLat').value = lat
			      document.getElementById('locationLon').value = lon
			      
			      document.getElementById("geolocation").submit(); 
						      
			     			      
//  			      var infowindow = new google.maps.InfoWindow({
//  			        map: map,
//  			        position: pos,
//  			        content: 'Location found using HTML5.'
//  			      });
				
 				  var marker = new google.maps.Marker({
 					  map: map,
 					  position: pos,
 				      title: 'Hello World!'
 				     
 				  });
 			     
			      map.setCenter(pos);
			    }, function() {
			      handleNoGeolocation(true);
			    });
			  } else {
			    // Browser doesn't support Geolocation
			    handleNoGeolocation(false);
			  }
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
			    content: 'Hi, I m here'
			  };
			
 			//  var infowindow = new google.maps.InfoWindow(options);
 			 
			 var marker = new google.maps.Marker(options);
			 map.setCenter(options.position);
			 
		}		 
			
			google.maps.event.addDomListener(window, 'load', initialize);
			
		</script>
	</head>
   <body>
 	
 		<form id = "geolocation" action="/PingrHib/PingrBeanController" method="GET" >
        <input type="hidden" id="locationLat" name="locationLat" value="" /> 
        <input type="hidden" id="locationLon" name="locationLon" value="" /> 
       	</form>
       	
         <div id="map-canvas"></div>
 </body>
</html>
			
