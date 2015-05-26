<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<% List pingrList = (List)session.getAttribute("pingrList");%>
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
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?libraries=places&sensor=false"></script>
   
</head>
<body>

 <script type="text/javascript">
  var pings = [];
  var map;
  function voteAlert() {window.alert("Thank you for voting a Ping!");}
 </script>
  
     
  <script> 

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
    	   
    	   
/* 
    	  	var map;
    	

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
    	  	  var input = /** @type {HTMLInputElement} */
    	  	 /*  (
    	  	      document.getElementById('pac-input'));
    	  	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    	  	  var searchBox = new google.maps.places.SearchBox( */
    	  	    /** @type {HTMLInputElement} */        /*  (input)); */

    	  	  // [START region_getplaces]
    	  	  // Listen for the event fired when the user selects an item from the
    	  	  // pick list. Retrieve the matching places for that item.
    	  	/*   google.maps.event.addListener(searchBox, 'places_changed', function() {
    	  	    var places = searchBox.getPlaces();

    	  	    if (places.length == 0) {
    	  	      return;
    	  	    }
    	  	    for (var i = 0, marker; marker = markers[i]; i++) {
    	  	      marker.setMap(null);
    	  	    } */

    	  	    // For each place, get the icon, place name, and location.
    	  	   // markers = [];
    	  	  /*   var bounds = new google.maps.LatLngBounds();
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
    	  	  }); */
    	  	  // [END region_getplaces]

    	  	  // Bias the SearchBox results towards places that are within the bounds of the
    	  	  // current map's viewport.
/*     	  	  google.maps.event.addListener(map, 'bounds_changed', function() {
    	  	    var bounds = map.getBounds();
    	  	    searchBox.setBounds(bounds);
    	  	    map.setZoom(7);
    	  	  });
    	  	} */
    	  	
    	  	//Show Hide Funtion for the Search Button
    	  	/* 	function showHide() {
    	  			
    		  		console.log("I am in the show hide");
    		  			$("#searchButton").click(function(e){
    		  				e.preventDefault();
    		  				$("#pac-input").toggle();
    		  			});
    	  		}
 */

    	  	

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
	

 <c:forEach items="${pingrList}" var="element">  
  <script type="text/javascript">
  	  
  		/**
     	 * Data for the markers consisting of a name, a LatLng and a zIndex for
     	 * the order in which these markers should display on top of each
     	 * other.
     	 */

     		 var id = '${element.pingrID}'
       		 var upvote = '${element.up_vote}';
      		 var downvote = '${element.down_vote}'; 
      		 var cat = '${element.category}';
  			 var lat = '${element.latitude}';
  			 var lon = '${element.longitude}';
  			 var content = '${element.content}';

  	 
  	  pings.push([content, lat, lon, cat, downvote, upvote, id]);
   
  	  function setMarkers(map, locations) {
  	  	  // Add markers to the map
  	  	  // Marker sizes are expressed as a Size of X,Y
  	  	  // where the origin of the image (0,0) is located
  	  	  // in the top left of the image.

  	  	 var infowindow = new google.maps.InfoWindow();
  	  	
  	  	  for (var i = 0; i < locations.length; i++) {
  	  		  
  	  	    var ping = locations[i];
  	  	    var showContent = locations[i][0];
  	  	    var up = locations[i][5];
  	  	    var down = locations[i][4];
  	  	    var idGiusto = locations[i][6];
  	  	    var myLatLng = new google.maps.LatLng(ping[1], ping[2]);
  	 
  	  	    
  	  	    var marker = new google.maps.Marker({
  	  	        position: myLatLng,
  	  	        map: map,
  	  	        infowindow: infowindow
  	  	    });
  	  	    
  	  	  
  	  	    
  	  	 google.maps.event.addListener(marker, 'click',  (function(marker, showContent, up, down, idGiusto) {
  	  		  return function() {
  	                infowindow.setContent('<p>Ping: '+ showContent +'</p>'+ 
  	                		'<p id="upID" > Up: '+ up +'</p>'+
  	                		'<p id="downID" > Down: '+ down +'</p>'+
  	        				'<input type="submit" value="Up vote" onclick="voteUp('+ up + ','+ idGiusto +','+ down+'),voteAlert()"   form="myForm" ></input>'+
  	          				'<input type="submit" value="Down vote" onclick="voteDown('+ down + ','+idGiusto+ ','+ up +'),voteAlert()" form="myForm"></input>'+
  	          				'<p> </p>' +
  	          				'<p> Add a comment to this Ping!</p>' +
  	          				'<textarea class="form-control" id="commentArea" rows="2"> </textarea>'+
  	          				'<input type="submit" value="Send comment" onclick="sendComment()" form="myCommentForm" ></input>');
  	                infowindow.open(map, marker);
  	            }
  	  		})(marker, showContent, up, down, idGiusto));
  	 
  	  	  }
  	  	  
  	 }
  	  
  	 
  	 function sendComment(){
  		
  		var comment = document.getElementById("commentArea").value;
  		//alert(comment);
  		 
  		 
  	 }
  	 
   	 function voteDown(down, idGiusto, up){
			  
			  down++;
			  idGiusto;
			  up;
			  document.getElementById('downID').innerHTML = 'Down: '+ down 
			  document.getElementById('idGiusto').value = idGiusto
		 	  document.getElementById('down').value = down
		 	  document.getElementById('up').value = up
		 	 
		 	   
		  }

   	 
    	function voteUp(up, idGiusto, down) {
  			
  	  		up++;
  	  		idGiusto;
  	  		down;
  	  		document.getElementById('upID').innerHTML = 'Up: '+ up 
  	  		document.getElementById('idGiusto').value = idGiusto
  			document.getElementById('up').value = up
  			document.getElementById('down').value = down
  			
  			
  	  	}
  	  	 

            
    </script>
     </c:forEach>

      	
				    <form method="get" action="/PingrHib/SendResponse" id="myForm"> 
				    <input type="hidden" id="idGiusto" name="idGiusto" /> 
				    <input type="hidden" id="down" name="down" />
				    <input type="hidden" id="up" name="up" />
				 	</form>
				
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header pull-left">
     
            <a class="navbar-brand" href="index.jsp">Pingr</a>
            
        </div>

		<div class="navbar-header pull-right littleP">
            <a href="post.jsp"><span class="glyphicon glyphicon-pencil bigger extraP"></span></a>
        </div>
    </div>
</div>
       
 <input id="pac-input" class="controls" type="text" placeholder="Search">
 <div id="map-canvas" style="height: 100%, width: 100%;"></div>


<div class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
    <div class="container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand" id="searchButton"><span class="glyphicon glyphicon-search bigger extraP"></span></a>
        </div>

		<div class="navbar-header pull-right littleP">
            <a href="info.jsp"><span class="glyphicon glyphicon-info-sign bigger extraP"></span></a>
            
        </div>
    </div>
</div>
    
 
</body>
    

</html> 