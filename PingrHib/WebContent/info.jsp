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
    
     <script src="https://maps.googleapis.com/maps/api/js"> </script>
  	 
    
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
       
    <div id="infoID">
        <h3> Pingr</h3>
        <p>Pingr is a location based web application that allows you to post pings anonymously based on your location. It shows the markers of different colors based on the type of category that can be: gossip, business and news!  This is currently a prototype that will be developed into an app. The authors of this prototype are Edona Gashi and Tee Bourque. The project started at the Free University of Bolzano for the course of Internet and Mobile Services of the Faculty of Computer Science.</p>
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
