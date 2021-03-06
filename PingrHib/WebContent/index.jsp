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
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>	
   
</head>
<body>

 <script type="text/javascript">
  var pings = [];
  var comments =[];
  var map;
  function voteAlert() {window.alert("Thank you for Posting a Ping!");}

 </script>
  
     
<script src="map.js"></script> 
  
  <c:forEach items="${commentList}" var="commentElement">  
  <script type="text/javascript">
  
  	 var commentContent = '${commentElement.commentContent}';
	 var foreignKey = '${commentElement.theKey}';
	 comments.push([commentContent,foreignKey]);
	
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
   	  function setMarkers(map, locations) {
  	  	
  		  // Add markers to the map
  	  	  // Marker sizes are expressed as a Size of X,Y
  	  	  // where the origin of the image (0,0) is located
  	  	  // in the top left of the image.

  	  	 var infowindow = new google.maps.InfoWindow();
  	  	
  	  	  for (var i = 0; i<locations.length; i++) {
  	  		
  	  	    var ping = locations[i];
  	  	    var showContent = locations[i][0];
  	  	    var categoria = locations[i][3];
  	  	    var up = locations[i][5];
  	  	    var down = locations[i][4];
  	  	    var idGiusto = locations[i][6];
  	  	    var myLatLng = new google.maps.LatLng(ping[1], ping[2]);
  	   	  	      
  	  	   		if( categoria =="Gossip"){
  	  		   	var pinImage = new google.maps.MarkerImage("http://maps.google.com/mapfiles/ms/icons/red-dot.png");
  	  				
   	  	  	  	
   	  	  	    } else if(categoria=="News"){
   	  	   	    var pinImage = new google.maps.MarkerImage("http://maps.google.com/mapfiles/ms/icons/blue-dot.png");
   	  	  			
   	  	  	    	
   	  	  	    } else if (categoria == "Business"){
   	  	  	    	var pinImage = new google.maps.MarkerImage("http://maps.google.com/mapfiles/ms/icons/green-dot.png");
   	  	  				
   	  	  	    }
  	  		
  	  		  	  
  	  	 	var marker = new google.maps.Marker({
  	  	     	position: myLatLng,
	  	        map: map,
	  	        icon: pinImage,
	  	        infowindow: infowindow
	  	    });	
	  	  	  
  	  	  	
  	  	   	 var comment;
  	  	  	 google.maps.event.addListener(marker, 'click',  (function(marker, showContent, up, down, idGiusto, comment, commentoGiusto, categoria) {
  	  	  	  return function() {
  	  			    infowindow.setContent('<p><b> '+ categoria +'</b></p>' + 
  	  			    		'<p> <u>Ping: </u> ' +  showContent +'</p>'+ 
  	                		'<p id="upFieldID"> <u> Up votes: </u> </p>' + '<p id="upID">'+ up +' </p>'+
  	                		'<p id="downFieldID" > <u> Down votes: </u> </p>' + '<p id="downID">'+ down +' </p>' +
  	        				'<input type="submit" id="upClick" value="Up vote" onclick="sendUpVote('+ document.getElementById('upID') + ','+ idGiusto +','+ down+')" ></input>'+
  	          				'<input type="submit" id="downClick" value="Down vote" onclick="sendDownvote('+ document.getElementById('downID') + ','+idGiusto+ ','+ up +')" ></input>'+
  	          				'<p> </p>'+
  	          				'<p> <u> Comments:</u> </p> <p id="commentID"> </p>' +
  	          				'<p> <u> Add a comment to this Ping! </u></p>' +
  	          				'<textarea class="form-control" id="commentArea" rows="2"></textarea>'+
  	          				'<input type="submit" id="commentClick" value="Send comment" onclick="sendComment('+ idGiusto + ','+ comment+')" ></input>');
  	  				
  	  			    retriveTheNewUpVote(idGiusto);
	            	retriveTheNewDownVote(idGiusto);
	            	retriveTheNewComments(idGiusto);
  	  			    infowindow.open(map, marker);
  	              
  	          	}
  	  	  	 
  	  	  	  
  	  		})(marker, showContent, up, down, idGiusto, comment, commentoGiusto, categoria)); 
  	 	  
  	  	
  	  	  	var commentoGiusto = [];
	  		for(var j=0; j<comments.length; j++){
			  	    var chiave = comments[j][1];
			  	    if (idGiusto == chiave){
			  	    commentoGiusto.push(comments[j][0]);
			  	    }
	  		}
	  		
  	  	}
  	 	  	  
  	}

////////////////////// Show the new comments //////////////////////////////
	   function retriveTheNewComments(idGiusto){
  		 	  	   
  		var xmlhttp;
  	  	if (window.XMLHttpRequest)
    	  {// code for IE7+, Firefox, Chrome, Opera, Safari
    	  xmlhttp=new XMLHttpRequest();
    	  }
    	else
    	  {// code for IE6, IE5
    	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    	  }
    	xmlhttp.onreadystatechange=function(){
    		
    		document.getElementById("commentID").innerHTML = xmlhttp.responseText;
    		
    		 		    	      		
    	}
    	xmlhttp.open("GET","InfoWindowDataComments?idGiusto="+idGiusto,true);
      	xmlhttp.send();
  		  
  	  } 
   	 
  			
//////////////////// Show new up vote ///////////////////  	  
  	  function retriveTheNewUpVote(idGiusto){
  		 	  	   
  		var xmlhttp;
  	  	if (window.XMLHttpRequest)
    	  {// code for IE7+, Firefox, Chrome, Opera, Safari
    	  xmlhttp=new XMLHttpRequest();
    	  }
    	else
    	  {// code for IE6, IE5
    	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    	  }
    	xmlhttp.onreadystatechange=function(){
    	
    		document.getElementById("upID").innerHTML= xmlhttp.responseText;
    		    		
    	}
    	xmlhttp.open("GET","InfoWindowDataUpVote?idGiusto="+idGiusto,true);
      	xmlhttp.send();
  		  
  	  }
 /////////// Show the new down vote ////////////////////
   function retriveTheNewDownVote(idGiusto){
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
    		document.getElementById("downID").innerHTML= xmlhttp.responseText;
    	 	}
     		
    	}
    	xmlhttp.open("GET","InfoWindowDataDownVote?idGiusto="+idGiusto,true);
      	xmlhttp.send();
  		  
  	  }
 
 	$.prototype.disable = function () {
  	    $.each(this, function (index, el) {
  	        $(el).attr('disabled', 'disabled');
  	    });
  	}
  ////////////////////////////////// UP VOTE /////////////////////////////
  	function sendUpVote(upVooote, idGiusto, down)
  	{  		
  		var currentUpVote = document.getElementById('upID').innerHTML;
   
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
  		
  		$("#upClick").disable();
  	    document.getElementById("upID").innerHTML= xmlhttp.responseText;
  	 //	document.getElementById("upClick").disable = true ;
  	 
  	    }
  	  
  	}
  	currentUpVote++;
  	
  	xmlhttp.open("GET","SendResponse?up="+currentUpVote+"&down="+down+"&idGiusto="+idGiusto,true);
  	xmlhttp.send();
  	
  	
  	}
  

  	   
  	//////////////// DOWN VOTE ///////////////////////
  	function sendDownvote(downVooote, idGiusto, up)
  	{  		
  		var currentDownVote = document.getElementById('downID').innerHTML;
  		
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
  		 
  		  if((xmlhttp.responseText)=="Error"){
  			
  			alert("This Ping has received to many down votes, thus it will be deleted!");
  			document.forms["myForm"].submit();
  			      			
  		  }
  		  
  		  else{
  		//  document.getElementById("downClick").disabled = true;
  		  $("#downClick").disable();  
  	     document.getElementById("downID").innerHTML= xmlhttp.responseText;
  		  }
  	    }
  	  
  	}
  	
  	currentDownVote++;
  
  	xmlhttp.open("GET","SendResponseDown?down="+currentDownVote+"&up="+up+"&idGiusto="+idGiusto,true);
  	xmlhttp.send();
  	
  
  	}
 
  //////////////// SEND COMMENTS  ///////////////////////
  	function sendComment(idGiusto, content)
  	{  		
  	
  		var currentComment = document.getElementById('commentArea').value;
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
  		 if(xmlhttp.responseText){
  			 $('#commentID').append("-" +xmlhttp.responseText);
  			 document.getElementById('commentArea').value = '';
  	    	}
  	      	  else {
  		  		// do nothing!
  	 		 }
  		 }
  	}
  	
  	xmlhttp.open("GET","SaveComment?comment="+currentComment+"&idGiusto="+idGiusto,true);
  	xmlhttp.send();
  	
  	}

    </script>
      	 </c:forEach>	
      	 
      	 
      	 
   
 				
 	<form method="get" action="/PingrHib/FetchData" id="myForm">
 	
 	</form>
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
  	
    <div id="searchBar">  
	<input id="pac-input" class="controls" type="text" placeholder="Search" ><!-- style="display:none" -->
   </div>      

 <div id="map-canvas" style="height: 100%, width: 100%;"></div>


<div class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
    <div class="container">

		<div class="navbar-header pull-left littleP">
            <a href="info.jsp"><span class="glyphicon glyphicon-info-sign bigger extraP"></span></a>
            
        </div>
    </div>
</div>
    
 
</body>
    

</html> 
