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
		System.out.println("L'id è : "+ id);
		
		String upVote = request.getParameter("up");
		int votoSu = Integer.parseInt(upVote);
		System.out.println("Voto su è ora: "+ upVote);
		
		List<PingrBean> pingrList = PingrManager.getAllInfo();
			
	 	for(int i=0;i<pingrList.size();i++){
	   
	    	int idDellaLista = pingrList.get(i).getPingrID();
	    	
	    	if (idDellaLista == idPing) {
	    		
	    		pingrList.get(i).setUp_vote(votoSu);
	    	    			    		
	    		PingrManager.savePingrElementsUP(idPing, votoSu);
	    		
	    	
	    	}
	    	
	    }
	    
	   	response.setContentType("text/plain");
		System.out.println("I'm sending: "+ upVote);
		response.getWriter().write(upVote);
		//request.setAttribute("pingrList", pingrList);
		//request.getRequestDispatcher("index.jsp").forward(request, response);
	 
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
