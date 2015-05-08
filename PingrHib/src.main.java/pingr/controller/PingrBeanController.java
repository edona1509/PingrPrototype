package pingr.controller;


import pingr.model.PingrManager;

import java.io.IOException;
import java.io.PrintWriter;

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
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		pingr.model.PingrBean pingr = new pingr.model.PingrBean();
		
		pingr.setContent("Ciao ragazzi!");
		pingr.setCategory("Gossip");
		pingr.setUp_vote(2);
		pingr.setDown_vote(4);
		pingr.setLatitude(35.6);
		pingr.setLongitude(34.88);
		
		pingr.model.CommentBean comment = new pingr.model.CommentBean();
		
		comment.setCommentContent("Lustig");
		comment.setPingr(pingr);
	
		
		pingr.model.CommentBean comment1 = new pingr.model.CommentBean();
		comment1.setCommentContent("Muahahah");
		comment1.setPingr(pingr);
		
		
		PingrManager.savePingrDetails(pingr);
		PingrManager.saveCommentDetails(comment1);
		PingrManager.saveCommentDetails(comment);
		
		
		
		pingr.model.PingrBean ping1 = PingrManager.getPingrDetails(1);
		
		response.setContentType("text/html");

	     // Actual logic goes here.
	    PrintWriter out = response.getWriter();
	    out.println("<h1>" + ping1.getCategory() + "</h1>");
		
	    
	    String s = request.getParameter("location");
	    System.out.println("Pos val is: " + s);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
	}

}
