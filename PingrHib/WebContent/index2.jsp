<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List"%>
<%@ page import="pingr.controller.FetchData"%>
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
 
 <script type="text/javascript">
  var pings = [];

 </script>

  <c:forEach items="${pingrList}" var="element">  
  
     <script src="https://maps.googleapis.com/maps/api/js"> </script>
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
	  	    
	  	   var showEverythig = 
	  	    
	  	 google.maps.event.addListener(marker, 'click',  (function(marker, showContent, up, down, idGiusto) {
	  		  return function() {
	                infowindow.setContent('<p>Ping: '+ showContent +'</p>'+ 
	                		'<p id="upID" > Up: '+ up +'</p>'+
	                		'<p id="downID" > Down: '+ down +'</p>'+
	        				'<button onclick="voteUp('+ up + ','+ idGiusto+')"> Up vote </button>'+
	          				'<button onclick="voteDown('+ down + ','+idGiusto+')"> Down vote </button>');
	                infowindow.open(map, marker);
	            }
	  		})(marker, showContent, up, down, idGiusto));
	 
	  	  }
	  	  
	 }
	 
	  	function voteUp(up, idGiusto) {
			
	  		up++;
	  		document.getElementById('upID').innerHTML = 'Up: '+ up 
	  		
	  		
			alert('Up vote!' + idGiusto);
	  		

		  document.getElementById('idGiusto').value = myID
		  document.getElementById('up').value = newUpVote
		
	  		
	  	  document.write("<form method=\"get\" action=\"/PingrHib/SendResponse\"> "+ 
				  "  <input type=\"hidden\" id=\"idGiusto\" name=\"idGiusto\" /> " +
				   " <input type=\"hidden\" id=\"newUpVote\" name=\"newUpVote\" /> " +
				  " </form>");
	  		
	  		}
	  	 
		  function voteDown(down, idGiusto){
			  
			  down++;
			  document.getElementById('downID').innerHTML = 'Down: '+ down 
			  // alert('Down vote!' + down );
			  
			
			  document.getElementById('idGiusto').value = myID
		 	   document.getElementById('down').value = newDownVote
			  document.write("<form method=\"get\" action=\"/PingrHib/SendResponse\"> "+ 
			  "  <input type=\"hidden\" id=\"idGiusto\" name=\"idGiusto\" /> " +
			   " <input type=\"hidden\" id=\"newDownVote\" name=\"newDownVote\" /> " +
			  " </form>");
		  }
		  
	
	  function initialize() {
  	  var mapOptions = {
  	    zoom: 7,
  	    center: new google.maps.LatLng(46.498295, 11.354758)
  	  }
  	  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  	  setMarkers(map, pings);
  	}
	  
	 
	  
  	google.maps.event.addDomListener(window, 'load', initialize);
  	
    </script>

   
 

     </c:forEach>
    
</head>
<body>

 <script>
	window.alert("Thank you for posting a Ping!");
	</script>

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

