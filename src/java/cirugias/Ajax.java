/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cirugias;

import com.google.gson.Gson;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.HashMap;
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
 * @author Nino
 */
@WebServlet(name = "Ajax", urlPatterns = {"/Ajax"})
public class Ajax extends HttpServlet {
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
			throws ServletException, IOException, InvocationTargetException, NoSuchMethodException {
		response.setContentType("text/html;charset=UTF-8");
		String vista = request.getParameter("v");
//		if(vista == null){
//			vista = "indexPaciente";
//		}
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
		} catch (InvocationTargetException ex) {
			Logger.getLogger(Ajax.class.getName()).log(Level.SEVERE, null, ex);
		} catch (NoSuchMethodException ex) {
			Logger.getLogger(Ajax.class.getName()).log(Level.SEVERE, null, ex);
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
		} catch (InvocationTargetException ex) {
			Logger.getLogger(Ajax.class.getName()).log(Level.SEVERE, null, ex);
		} catch (NoSuchMethodException ex) {
			Logger.getLogger(Ajax.class.getName()).log(Level.SEVERE, null, ex);
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
	
//	void buscarProcs(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException{
	void buscarProcs() throws IOException, SQLException{
		String q = this.requ.getParameter("q");
		if(q == null){
			return;
		}
		
		q = q.trim();
		
		if(q.equals("")){
			return;
		}
		
		Procedimiento proced = new Procedimiento();
		this.jsonResponse(proced.buscar(q), this.resp);
	}
	
//	void buscarDiags(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException{
	void buscarDiags() throws IOException, SQLException{
		String q = this.requ.getParameter("q");
		if(q == null){
			return;
		}
		
		q = q.trim();
		
		if(q.equals("")){
			return;
		}
		
		Cie cie = new Cie();
		this.jsonResponse(cie.buscar(q), this.resp);
	}
	
	void guardarInfoPost() throws IOException{
//		DatalleOper detaoper = new DetalleOper();
//		
//		detaoper.InterAntOper =	this.requ.getParameter("InterAntOper");
//		detaoper.FechaIniOper =	this.requ.getParameter("FechaIniOper");
//		detaoper.FechaFinOper =	this.requ.getParameter("FechaFinOper");
//		detaoper.HoraIniOper = this.requ.getParameter("HoraIniOper");
//		detaoper.HoraFinOper = this.requ.getParameter("HoraFinOper");
//		
//		detaoper.IdSalaOper = this.requ.getParameter("IdSalaOper");
//		detaoper.OperHoraIni = this.requ.getParameter("OperHoraIni");
//		detaoper.OperHoraFin = this.requ.getParameter("OperHoraFin");
//		
//		detaoper.IdSalaRecup = this.requ.getParameter("IdSalaRecup");
//		detaoper.RecupFechaIni = this.requ.getParameter("RecupFechaIni");
//		detaoper.RecupFechaFin = this.requ.getParameter("RecupFechaFin");
//		detaoper.RecupHoraIni = this.requ.getParameter("RecupHoraIni");
//		detaoper.RecupHoraFin = this.requ.getParameter("RecupHoraFin");
		
		String[] IdProced = this.requ.getParameterValues("IdProced[]");
		String out = "";
		for(int i=0;i<IdProced.length;i++){
			out += "," + IdProced[i];
		}
		
		this.jsonError(out, resp);
		
		//this.jsonRedireccion("Servlet?v=detalleInfoPost&id=", this.resp);
	}

	private void jsonError(String mensaje, HttpServletResponse response) throws IOException{
		Map json = new HashMap();
		json.put("error", true);
		json.put("mensaje", mensaje);
		this.jsonResponse(json, response);		
	}
	
	private void jsonRedireccion(String url, HttpServletResponse response) throws IOException{
		Map json = new HashMap();
		json.put("error", false);
		json.put("redireccion", url);
		this.jsonResponse(json, response);		
	}

	private void jsonResponse(Map json, HttpServletResponse response) throws IOException {
		response.setContentType("text/json");
		response.getWriter().write(new Gson().toJson(json));
//		response.getWriter().println(new Gson().toJson(json));
	}
}
