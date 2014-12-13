/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cirugias;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alain
 */
@WebServlet(name = "Estadisticas", urlPatterns = {"/Estadisticas"})
public class Estadisticas extends HttpServlet {
	HttpServletRequest requ;
	HttpServletResponse resp;
	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NoSuchMethodException {
		response.setContentType("text/html;charset=UTF-8");
		String vista = request.getParameter("v");
		if(vista == null){
			vista = "indicador01";
		}
//		Method method = getClass().getDeclaredMethod(vista, HttpServletRequest.class, HttpServletResponse.class);		
		this.requ = request;
		this.resp = response;
		Method method = getClass().getDeclaredMethod(vista);
		try {
//			method.invoke(this, request, response);
			method.invoke(this);
		} catch (IllegalAccessException ex) {
			Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
		} catch (IllegalArgumentException ex) {
			Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
		} catch (InvocationTargetException ex) {
			Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (NoSuchMethodException ex) {
			Logger.getLogger(Estadisticas.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (NoSuchMethodException ex) {
			Logger.getLogger(Estadisticas.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

	public void indexPaciente() throws ServletException, IOException, SQLException{	
		this.requ.getRequestDispatcher("/index-paciente.jsp?v=indexPaciente").include(this.requ, this.resp);
	}
	
	public void indicador01() throws ServletException, IOException, SQLException{	
		
		db.ejecutar("SELECT YEAR(FechaOper) AS Anio,MONTH(FechaOper) AS Mes, COUNT(*) AS Intervenciones FROM informe GROUP BY YEAR(FechaOper), MONTH(FechaOper)", null);
		String tableContent = "";
		for(Map<String,String> row : db.results){
			tableContent += "<tr>";
			tableContent += "<td>"+row.get("Anio")+"</td>";
			tableContent += "<td>"+row.get("Mes")+"</td>";
			tableContent += "<td>"+row.get("Intervenciones")+"</td>";
			tableContent += "</tr>";
		}
		
		this.requ.setAttribute("tabla", tableContent);
		
		this.requ.getRequestDispatcher("/indicador01.jsp?v=indicador01").include(this.requ, this.resp);
	}	
	public void predicciones() throws ServletException, IOException{	
		this.requ.getRequestDispatcher("/predicciones.jsp").include(this.requ, this.resp);
	}	
}
