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

/**
 * Servlet implementation class SaveComment
 */

public class SaveComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
		//////// Inserting comments by hand to see the relations in the database :D ///////////
		
		String commentFromGraphic = request.getParameter("comment");
		System.out.println("My comment from the graphic should be here: " + commentFromGraphic);
				
		String pingrID = request.getParameter("idGiusto");
		int idPing = Integer.parseInt(pingrID);
			
		pingr.model.CommentBean comment = new pingr.model.CommentBean();
		
		comment.setCommentContent(commentFromGraphic);
		comment.setPingr(PingrManager.retrivePing(idPing));
		comment.setTheKey(idPing);				
		PingrManager.saveCommentDetails(comment);
		
  		response.setContentType("text/plain");
  		response.getWriter().write(commentFromGraphic);
	  		
			//request.setAttribute("pingrList", pingrList);
			//request.getRequestDispatcher("index.jsp").forward(request, response);
   }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
