package pingr.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pingr.model.PingrManager;

public class SendResponse extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
//		String id = (String)request.getAttribute("idPingr");
//		int pingID = Integer.parseInt(id);
//		pingr.model.PingrBean pingr = PingrManager.getPingrDetails(pingID);
//		response.setContentType("text/html");
//		
//		Double latitudine = pingr.getLatitude();
//		Double longitudine = pingr.getLongitude();
//		int up_vote = pingr.getUp_vote();
//		int down_vote = pingr.getDown_vote();
//		
//		String lat = Double.toString(latitudine);
//		String lon = Double.toString(longitudine);
//		String up = Integer.toString(up_vote);
//		String down = Integer.toString(down_vote);
//		String content = pingr.getContent();
//		String cat = pingr.getCategory();
//		
//		request.setAttribute("lat", lat);
//		request.setAttribute("lon", lon);
//		request.setAttribute("cat", cat);
//		request.setAttribute("content", content);
//		request.setAttribute("up", up);
//		request.setAttribute("down", down);
		
		//request.getRequestDispatcher("index3.jsp").forward(request, response);
		
		
		pingr.model.PingrBean pingr = new pingr.model.PingrBean();
		String id = request.getParameter("idGiusto");
	    String upVote = request.getParameter("newUpVote");
	    String downVote = request.getParameter("newDownVote");
	
	    
	    System.out.println(id);
	    System.out.println(upVote);
	    System.out.println(downVote);
	    
		request.getRequestDispatcher("FetchData").forward(request, response);
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
