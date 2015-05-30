package pingr.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pingr.model.PingrBean;
import pingr.model.PingrManager;

/**
 * Servlet implementation class InfoWindowDataDownVote
 */

public class InfoWindowDataDownVote extends HttpServlet {
	private static final long serialVersionUID = 1L;
  	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//System.out.println("Sono nel INFOWINDOWDATA");
		
		String pingrID = request.getParameter("idGiusto");
		int idPing = Integer.parseInt(pingrID);
		
		PingrBean pingr = PingrManager.getPingrDetails(idPing);
	
		int down = pingr.getDown_vote();
		String voto = String.valueOf(down);
		//System.out.println("Up in InfoWindowData: "+ down);
		
		response.setContentType("text/plain");
		response.getWriter().write(voto);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
