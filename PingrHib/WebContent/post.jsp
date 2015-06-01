<!DOCTYPE html>
<html lang="en">
<head>
  <title>Pingr</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="pingrStyleSheet.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
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

    <form method="get" action="/PingrHib/PingrBeanController">  
    <div id="pingPost">
        
        <div class="form-group">
          <label for="comment">Post an anonymous ping on to the map</label>
          <textarea class="form-control" name="content" rows="5"> </textarea>
           	
          
    <div class="inTheMiddle">
    <label class="radio-inline">
      <input type="radio" name = "check" value="Gossip" CHECKED>Gossip
    </label>
    <label class="radio-inline">
      <input type="radio" name = "check" value="Business">Business
    </label>
    <label class="radio-inline">
      <input type="radio"  name = "check" value="News">News
    </label>
    </div> 
            
        </div>
        <input class="btn btn-info btn-block" type="submit" value="Ping" />
        <input type="hidden" id="locationLat" name="locationLat" value="" /> 
        <input type="hidden" id="locationLon" name="locationLon" value="" />
           
        </div>
    
<div class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
    <div class="container">
        <div class="navbar-header pull-left">
            <a href="search.jsp" class="navbar-brand"><span class="glyphicon glyphicon-search bigger extraP"></span></a>
        </div>

		<div class="navbar-header pull-right littleP">
            <a href="info.jsp"><span class="glyphicon glyphicon-info-sign bigger extraP"></span></a>
            
        </div>
    </div>
</div>

	</form>
	    <div id="map-canvas" style="height: 1%, width: 1%;"></div>

  </body>
 </html>

