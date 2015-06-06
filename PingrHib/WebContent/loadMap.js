	
  function initialize() {
    	 
	  	  directionsDisplay = new google.maps.DirectionsRenderer();
    	   var mapOptions = {
    	    zoom:10,
    	   };
    	 
    	  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    	  directionsDisplay.setMap(map);
	    
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