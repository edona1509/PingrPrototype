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
  	  var lat = '${element.latitude}';
	  var lon = '${element.longitude}';
	  var content = '${element.content}';
	  
	  pings.push([content,lat,lon]);
 
	  function setMarkers(map, locations) {
	  	  // Add markers to the map
	  	  // Marker sizes are expressed as a Size of X,Y
	  	  // where the origin of the image (0,0) is located
	  	  // in the top left of the image.

	  	  for (var i = 0; i < locations.length; i++) {
	  	    var ping = locations[i];
	  	    var myLatLng = new google.maps.LatLng(ping[1], ping[2]);
	  	   
	  	    var marker = new google.maps.Marker({
	  	        position: myLatLng,
	  	        map: map,
	  	        infowindow: infowindow
	  	    });
	  	    
	  	  var infowindow = new google.maps.InfoWindow({
	  		   content: ""
	  		});
	  	  
	  	 google.maps.event.addListener(marker, 'click', function() {
	  		 
	  	 	 infowindow.setContent('<p>Ping: '+ ping[0] +'</p>'+
	  				'<button onclick="upvote()"> Up vote </button>'	+
	  				'<button onclick="downvote()"> Down vote </button>'
	  		 
	  		 );   
	  		 	infowindow.open(map,this); });
	  	  }
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
    
 <!--   	
  	<td>`${element.pingrID}`</td>
  	<td>`${element.latitude}`</td>
  	<td>`${element.longitude}`</td>
  	<td>`${element.up_vote}`</td>
  	<td>`${element.down_vote}`</td>  -->

</head>
<body>

 <script>
	window.alert("Thank you for posting a Ping!");
	</script>

  <!-- 	<td>`${element.content}`</td>
  	<td>`${element.category}`</td>
  	<td>`${element.pingrID}`</td>
  	<td>`${element.latitude}`</td>
  	<td>`${element.longitude}`</td>
  	<td>`${element.up_vote}`</td>
  	<td>`${element.down_vote}`</td>
 -->

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

