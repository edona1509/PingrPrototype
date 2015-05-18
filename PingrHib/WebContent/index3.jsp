<!DOCTYPE html>
<%@page import="pingr.model.PingrBean"%>
<html lang="en">
<head>
  <title>Pingr</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="booty.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
      <script src="https://maps.googleapis.com/maps/api/js"> </script>
  	  <script type="text/javascript">
   	  var map;
      function initialize() { 
        	  directionsDisplay = new google.maps.DirectionsRenderer();
        	  
        	  var mapOptions = {
        	    zoom:7,
        	    
        	  };
        	  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        	  directionsDisplay.setMap(map);
 	    
        	  var lat = '<%= (String)request.getAttribute("lat")%>';
        	  var lon = '<%= (String)request.getAttribute("lon")%>';
        	      // Try HTML5 geolocation
        	      if(navigator.geolocation) {
        	        navigator.geolocation.getCurrentPosition(function(position) {
        	          var pos = new google.maps.LatLng(lat,lon);
        		   // creation of marker on the map
        		  
        		   var markerTitle = '<%= (String)request.getAttribute("content")%>';
        	          var marker = new google.maps.Marker({
        	              position: pos,
        	              map: map,
        	              title: markerTitle
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
  <script>
	window.alert("Thank you for posting a Ping!");
	</script>

   <%System.out.println("Cat is: " + (String)request.getAttribute("cat"));%> 
   <%System.out.println("Up is: " + (String)request.getAttribute("up"));%> 
   <%System.out.println("Down is: " + (String)request.getAttribute("down"));%> 
   <%System.out.println("Lat is: " + (String)request.getAttribute("lat"));%> 
   <%System.out.println("Lon is: " + (String)request.getAttribute("lon"));%> 
   <%System.out.println("Content is: " + (String)request.getAttribute("content"));%> 
    
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand bottom" href="index.jsp">Pingr</a>
    
      
      <div id="floatRightBitch">
    <li><a href="post.jsp"><span class="glyphicon glyphicon-pencil bigger extraP"></span></a></li>
      </div>
</div>
  </div>
</nav>

        <div id="map-canvas" style="height: 100%, width: 100%;"></div>

    
<nav class="navbar navbar-inverse navbar-fixed-bottom">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-search bigger extraP"></span></a>
    
      
      <div id="floatRightBitch">
    <li><a href="info.jsp"><span class="glyphicon glyphicon-info-sign bigger extraP"></span></a></li>
      </ul>
    </div></div>
  
</div>
</nav>

</body>
    

</html>

