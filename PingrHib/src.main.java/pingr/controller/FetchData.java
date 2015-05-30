	package pingr.controller;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pingr.model.CommentBean;
import pingr.model.PingrBean;
import pingr.model.PingrManager;

/**
 * Servlet implementation class FetchData
 */


public class FetchData extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		List<PingrBean> pingrList = PingrManager.getAllInfo();
		List<CommentBean> commentList = PingrManager.getAllComments();
		
//		for(int i=0;i<pingrList.size();i++){
//			   
////			int id = commentList.get(i).getCommentID();
////			
////			String cont = commentList.get(i).getCommentContent();
////			
////			PingrBean ping = commentList.get(i).getPingr();
////			
////			System.out.println(id);
////			System.out.println(cont);
////			System.out.println(ping);
//			
//			commentList = pingrList.get(i).getComments();
//			
//			
// }		
	
		response.setContentType("text/html");
		request.setAttribute("pingrList", pingrList);
		request.setAttribute("commentList", commentList);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

}
