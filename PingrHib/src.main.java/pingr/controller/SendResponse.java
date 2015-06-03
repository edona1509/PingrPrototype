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
	
			
		String id = request.getParameter("idGiusto");
		int idPing = Integer.parseInt(id);
		
		String upVote = request.getParameter("up");
		int votoSu = Integer.parseInt(upVote);
		
		List<PingrBean> pingrList = PingrManager.getAllInfo();
			
	 	for(int i=0;i<pingrList.size();i++){
	   
	    	int idDellaLista = pingrList.get(i).getPingrID();
	    	
	    	if (idDellaLista == idPing) {
	    		
	    		pingrList.get(i).setUp_vote(votoSu);
	    	    			    		
	    		PingrManager.savePingrElementsUP(idPing, votoSu);
	    		
	    	
	    	}
	    	
	    }
	    
	   	response.setContentType("text/plain");
		response.getWriter().write(upVote);
	 
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
