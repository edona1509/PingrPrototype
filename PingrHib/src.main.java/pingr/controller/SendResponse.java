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
	
		
		System.out.println("Sono nel sendResponse!!!!!!!!!!!!!!!!!!!!!");
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
		
		
		String id = request.getParameter("idGiusto");
		int idPing = Integer.parseInt(id);
		
	
		pingr.model.PingrBean savePingr = PingrManager.getPingrDetails(idPing);
	
	    String upVote = request.getParameter("up");
	    String downVote = request.getParameter("down");
	    int votoSu = Integer.parseInt(upVote);
	    int votoGiu = Integer.parseInt(downVote);
	    
	    System.out.println("L'id è : "+id);
	    System.out.println("Voto su è ora: "+ upVote);
	    System.out.println("Voto giù è ora: "+downVote);
	    
	    
	    savePingr.setUp_vote(votoSu);
	    savePingr.setUp_vote(votoGiu);
	    
		request.getRequestDispatcher("index3.jsp").forward(request, response);
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
