package pingr.controller;


import pingr.model.PingrManager;

import java.io.IOException;
import java.io.PrintWriter;

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
		
		
		//************* Taking the latitude and longitude from jsp form ************************//  
	    String lat = request.getParameter("locationLat");
	    String lon = request.getParameter("locationLon");
	    String textAreaContent = request.getParameter("content");
		String checkBox = request.getParameter("check");
	    		
	    if (!lon.equals("") || !lat.equals("") || !textAreaContent.equals("") || (!lon.equals("") && !lat.equals("") && !textAreaContent.equals(""))){
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
		
		
		//////// Inserting comments by hand to see the relations in the database :D ///////////
		pingr.model.CommentBean comment = new pingr.model.CommentBean();
		
		comment.setCommentContent("Lustig");
		comment.setPingr(pingr);
	
		
		pingr.model.CommentBean comment1 = new pingr.model.CommentBean();
		comment1.setCommentContent("Muahahah");
		comment1.setPingr(pingr);
		
		
	
		PingrManager.savePingrDetails(pingr);
		PingrManager.saveCommentDetails(comment1);
		PingrManager.saveCommentDetails(comment);
		
		int id = pingr.getPingrID();
		String idPingr = Integer.toString(id);
		
		request.setAttribute("idPingr", idPingr);
		
		// Giving the response to the user redirecting them on the FetchData Servlet!
		RequestDispatcher rd = request.getRequestDispatcher("FetchData");
		rd.forward(request,response);
		
	    }
	    else {
	    	
	    	// Giving the response to the user redirecting them on the index.jsp
	    	response.sendRedirect("index.jsp");
	    }
	  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
	}

}
