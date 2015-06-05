package pingr.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pingr.model.CommentBean;
import pingr.model.PingrBean;
import pingr.model.PingrManager;

/**
 * Servlet implementation class InfoWindowDataComments
 */

public class InfoWindowDataComments extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pingrID = request.getParameter("idGiusto");
		int idPing = Integer.parseInt(pingrID);	
			
		 List<CommentBean> comments = PingrManager.getAllComments();
		
	
		for(int i= 0; i<comments.size(); i++ ){
			
			int theKey = comments.get(i).getTheKey();
			
			if (idPing== theKey){
			
			String contenuto = comments.get(i).getCommentContent();
						
			response.setContentType("text/plain");
			response.getWriter().write(contenuto + "<br>");
			
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
