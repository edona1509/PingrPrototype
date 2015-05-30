<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<% List pingrList = (List)session.getAttribute("pingrList");%>
<% List commentList = (List)session.getAttribute("commentList"); %>
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
  
   <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
   
</head>
<body>

 <script type="text/javascript">
  var pings = [];
  var comments =[];
  
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
  
  <c:forEach items="${commentList}" var="commentElement">  
  <script type="text/javascript">
  
  	 var commentContent = '${commentElement.commentContent}';
	 var foreignKey = '${commentElement.theKey}';
	
	 comments.push([commentContent,foreignKey]);
   	// alert(comments);		  
  
  </script>
 </c:forEach>	
 
  <c:forEach items="${pingrList}" var="element">    		 
  <script type="text/javascript">
  	  
  		/**
     	 * Data for the markers consisting of a name, a LatLng and a zIndex for
     	 * the order in which these markers should display on top of each
     	 * other.
     	 */
     		
     		 var id = '${element.pingrID}';
       		 var upvote = '${element.up_vote}';
      		 var downvote = '${element.down_vote}'; 
      		 var cat = '${element.category}';
  			 var lat = '${element.latitude}';
  			 var lon = '${element.longitude}';
  			 var content = '${element.content}';

   	
  	  pings.push([content, lat, lon, cat, downvote, upvote, id]);
   //	alert("Length of pings " + pings.length);
  	  function setMarkers(map, locations) {
  	  	
  		  // Add markers to the map
  	  	  // Marker sizes are expressed as a Size of X,Y
  	  	  // where the origin of the image (0,0) is located
  	  	  // in the top left of the image.

  	  	 var infowindow = new google.maps.InfoWindow();
  	  	
  	  	  for (var i = 0; i<locations.length; i++) {
  	  		
  	  	    var ping = locations[i];
  	  	    var showContent = locations[i][0];
  	  	    var up = locations[i][5];
  	  	    var down = locations[i][4];
  	  	    var idGiusto = locations[i][6];
  	  	    var myLatLng = new google.maps.LatLng(ping[1], ping[2]);
  	 		 
  	  		var commentoGiusto = [];
  	  	    for(var j=0; j<comments.length; j++){
  	  	    	var chiave = comments[j][1];
  	  	      	if (idGiusto == chiave){
  	  	      	commentoGiusto.push(comments[j][0]);
  	  	    	}
  	  	    
  	  	  	   
  	  	    var marker = new google.maps.Marker({
  	  	        position: myLatLng,
  	  	        map: map,
  	  	        infowindow: infowindow
  	  	    });
  	  	    
  	   	  	  
  	  	   	 var comment;
  	  	  	 google.maps.event.addListener(marker, 'click',  (function(marker, showContent, up, down, idGiusto, comment, commentoGiusto) {
  	  		  return function() {
  	  		
  	                infowindow.setContent('<p>Ping: '+ showContent +'</p>'+ 
  	                		'<p id="upFieldID"> Up: '+ '<p id="upID">'+ up +' </p>' +'</p>'+
  	                		'<p id="downFieldID" > Down: '+ '<p id="downID">'+ down +' </p>' +'</p>'+
  	        				'<input type="submit" id="upClick" value="Up vote" onclick="sendUpVote('+ document.getElementById('upID') + ','+ idGiusto +','+ down+')"  ></input>'+
  	          				'<input type="submit" id="downClick" value="Down vote" onclick="sendDownvote('+ document.getElementById('downID') + ','+idGiusto+ ','+ up +')" ></input>'+
  	          				'<p> Comments: '+ commentoGiusto +'</p>' +
  	          				'<p id="commentID"> </p>'+
  	          				'<p> Add a comment to this Ping!</p>' +
  	          				'<textarea class="form-control" id="commentArea" rows="2"></textarea>'+
  	          				'<input type="submit" id="commentClick" value="Send comment" onclick="sendComment('+ idGiusto + ','+ comment+')" ></input>');
  	                infowindow.open(map, marker);
  	            }
  	  		})(marker, showContent, up, down, idGiusto, comment, commentoGiusto));
  	 
  	  	  }
  	  	}
  	  	  
  	 }
  	 
  ////////////////////////////////// UP VOTE /////////////////////////////
  	function sendUpVote(upVooote, idGiusto, down)
  	{
  		
  		var currentUpVote = document.getElementById('upID').innerHTML;
  	//	alert("Become "+ currentUpVote);
  
  	var xmlhttp;
  	if (window.XMLHttpRequest)
  	  {// code for IE7+, Firefox, Chrome, Opera, Safari
  	  xmlhttp=new XMLHttpRequest();
  	  }
  	else
  	  {// code for IE6, IE5
  	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	  }
  	xmlhttp.onreadystatechange=function()
  	  {
  	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
  	    {
  		 // alert(xmlhttp.responseText);
  	    document.getElementById("upID").innerHTML= xmlhttp.responseText;
  	   
  	    }
  	  
  	}
  	//alert("Doing something");
  	currentUpVote++;
  	xmlhttp.open("GET","SendResponse?up="+currentUpVote+"&down="+down+"&idGiusto="+idGiusto,true);
  	xmlhttp.send();
  	//alert("After all");
  	}
  	   
  	//////////////// DOWN VOTE ///////////////////////
  	function sendDownvote(downVooote, idGiusto, up)
  	{  		
  		var currentDownVote = document.getElementById('downID').innerHTML;
  		//alert("Become "+ currentDownVote);
  
  	var xmlhttp;
  	if (window.XMLHttpRequest)
  	  {// code for IE7+, Firefox, Chrome, Opera, Safari
  	  xmlhttp=new XMLHttpRequest();
  	  }
  	else
  	  {// code for IE6, IE5
  	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	  }
  	xmlhttp.onreadystatechange=function()
  	  {
  	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
  	    {
  		 // alert(xmlhttp.responseText);
  	    document.getElementById("downID").innerHTML= xmlhttp.responseText;
   	   
  	    }
  	  
  	}
  	//alert("Doing something");
  	currentDownVote++;
  	xmlhttp.open("GET","SendResponseDown?down="+currentDownVote+"&up="+up+"&idGiusto="+idGiusto,true);
  	xmlhttp.send();
  	//alert("After all");
  	}
  
  	
  	   
  	//////////////// SEND COMMENTS  ///////////////////////
  	function sendComment(idGiusto, content)
  	{  		
  		var currentComment = document.getElementById('commentArea').value;
  		//alert("Become "+ currentDownVote);
  
  	var xmlhttp;
  	if (window.XMLHttpRequest)
  	  {// code for IE7+, Firefox, Chrome, Opera, Safari
  	  xmlhttp=new XMLHttpRequest();
  	  }
  	else
  	  {// code for IE6, IE5
  	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	  }
  	xmlhttp.onreadystatechange=function()
  	  {
  	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
  	    {
  		 // alert(xmlhttp.responseText);
  	    document.getElementById("commentID").innerHTML= xmlhttp.responseText;
   	   
  	    }
  	  
  	}
  	
  	alert(currentComment);
  	xmlhttp.open("GET","SaveComment?comment="+currentComment+"&idGiusto="+idGiusto,true);
  	xmlhttp.send();
  	
  	}

  	           
    </script>
    		
    	 </c:forEach>	
   

        	
				
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
       

 <div id="map-canvas" style="height: 100%, width: 100%;"></div>


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
    
 
</body>
    

</html> 
