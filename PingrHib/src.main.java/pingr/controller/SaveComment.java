package pingr.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pingr.model.PingrBean;
import pingr.model.PingrManager;
import pingr.util.ServletUtilities;

/**
 * Servlet implementation class SaveComment
 */

public class SaveComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String commentFromGraphic = ServletUtilities.filter(request.getParameter("comment"));
						
		String pingrID = request.getParameter("idGiusto");
		int idPing = Integer.parseInt(pingrID);
			
		pingr.model.CommentBean comment = new pingr.model.CommentBean();
		
		if (commentFromGraphic.length()<2){
			
			// do nothing!
		}
		
		else {
		
		comment.setCommentContent(commentFromGraphic);
		comment.setPingr(PingrManager.retrivePing(idPing));
		comment.setTheKey(idPing);				
		PingrManager.saveCommentDetails(comment);
		
  		response.setContentType("text/plain");
  		response.getWriter().write(commentFromGraphic);
		}	
   }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
