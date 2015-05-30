package pingr.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pingr.model.PingrBean;
import pingr.model.PingrManager;

/**
 * Servlet implementation class SendResponseDown
 */

public class SendResponseDown extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("idGiusto");
		int idPing = Integer.parseInt(id);
		System.out.println("L'id è : "+ id);
			
		String downVote = request.getParameter("down");
		int votoGiu = Integer.parseInt(downVote);
		System.out.println("Voto giù è ora: "+ downVote);
		
		
		List<PingrBean> pingrList = PingrManager.getAllInfo();
			
	 	
	    for(int i=0;i<pingrList.size();i++){
	   
	    	int idDellaLista = pingrList.get(i).getPingrID();
	    	
	    	if (idDellaLista == idPing) {
	    		
	    		pingrList.get(i).setDown_vote(votoGiu);
	    			    		
	    		PingrManager.savePingrElementsDOWN(idPing, votoGiu);
	    		
	    	
	    	}
	    	
	    }
	    //
	   	response.setContentType("text/plain");
		System.out.println("I'm sending from down: "+ downVote);
		response.getWriter().write(downVote);
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
