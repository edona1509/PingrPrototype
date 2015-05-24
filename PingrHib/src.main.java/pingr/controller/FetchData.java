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
 * Servlet implementation class FetchData
 */
@WebServlet("/FetchData")
public class FetchData extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<PingrBean> pingrList = PingrManager.getAllInfo();
		
		for(int i=0;i<pingrList.size();i++){
			   
			int id = pingrList.get(i).getPingrID();
			String cont = pingrList.get(i).getContent();
			String cat = pingrList.get(i).getCategory();
			int up = pingrList.get(i).getUp_vote();
			int down = pingrList.get(i).getDown_vote();
			double lat = pingrList.get(i).getLatitude();
			double lon = pingrList.get(i).getLongitude();
			
//			System.out.println(id);
//			System.out.println(cont);
//			System.out.println(cat);
//			System.out.println(up);
//			System.out.println(down);
//			System.out.println(lat);
//			System.out.println(lon);
			
		}
		
		response.setContentType("text/html");
		request.setAttribute("pingrList", pingrList);
		request.getRequestDispatcher("index2.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
