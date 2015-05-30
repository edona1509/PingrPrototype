package pingr.controller;


import pingr.model.PingrManager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserDetails
 */
@WebServlet("/pingrbean")
public class PingrBeanController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	pingr.model.PingrBean pingr = new pingr.model.PingrBean();
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
//		//************* Taking the latitude and longitude from jsp form ************************//  
	    String lat = request.getParameter("locationLat");
	    String lon = request.getParameter("locationLon");
	    String textAreaContent = request.getParameter("content");
		String checkBox = request.getParameter("check");
	    		
		if (lon.equalsIgnoreCase(null) || lat.equalsIgnoreCase(null) || textAreaContent.equalsIgnoreCase(null) || (lon.equalsIgnoreCase(null) && lat.equalsIgnoreCase(null) && textAreaContent.equalsIgnoreCase(null))){
	    
	       	
	    	// Giving the response to the user redirecting them on the post2.jsp
	    	RequestDispatcher rd = request.getRequestDispatcher("post2.jsp");
			rd.forward(request,response);
			
		
	    }
	    else {
	 

		    System.out.println("Latitude val is: " + lat);
		    double myLat = Double.parseDouble(lat);
		    
		  
		    System.out.println("Longitude val is: " + lon);
		    double myLon = Double.parseDouble(lon);
			
		    
		    // In order to check if the date are in the correct format we should do it here
		    // if not do not insert any entry in the database :D
			
			pingr.setContent(textAreaContent);
			pingr.setCategory(checkBox);
			pingr.setUp_vote(0);
			pingr.setDown_vote(0);
			pingr.setLatitude(myLat);
			pingr.setLongitude(myLon);
			
	
			PingrManager.savePingrDetails(pingr);
		
			
////			int id = pingr.getPingrID();
////			String idPingr = Integer.toString(id);
////			
////			request.setAttribute("idPingr", idPingr);
			
		
			// Giving the response to the user redirecting them on the FetchData Servlet!
			RequestDispatcher rd = request.getRequestDispatcher("FetchData");
			rd.forward(request,response);
	    }
	  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
	}

}
