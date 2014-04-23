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
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
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
	
	public void guardarInfoPost() throws IOException, SQLException, ParseException{
		DetalleOper detaoper = new DetalleOper();
		
		//detaoper.idPaciente = this.requ.getParameter("idpac");
		Paciente paciente = new Paciente(null);
		paciente.idPaciente = this.requ.getParameter("idpac");
		detaoper.paciente = paciente;
		detaoper.idDetalleInterv = this.requ.getParameter("iddi");
		detaoper.idDetalleOper = this.requ.getParameter("id");
		
		detaoper.interAntOper =	this.requ.getParameter("InterAntOper");
		detaoper.fechaIniOper =	this.requ.getParameter("FechaIniOper");
		detaoper.fechaFinOper =	this.requ.getParameter("FechaFinOper");
		detaoper.horaIniOper = this.requ.getParameter("HoraIniOper");
		detaoper.horaFinOper = this.requ.getParameter("HoraFinOper");
		
		SalaOper salaoper = new SalaOper();
		salaoper.idSalaOper = this.requ.getParameter("IdSalaOper");
		detaoper.salaOper = salaoper;
		detaoper.operHoraIni = this.requ.getParameter("OperHoraIni");
		detaoper.operHoraFin = this.requ.getParameter("OperHoraFin");

		SalaRecup salarecup = new SalaRecup();
		salarecup.idSalaRecup = this.requ.getParameter("IdSalaRecup");
		detaoper.salaRecup = salarecup;
		detaoper.recupFechaIni = this.requ.getParameter("RecupFechaIni");
		detaoper.recupFechaFin = this.requ.getParameter("RecupFechaFin");
		detaoper.recupHoraIni = this.requ.getParameter("RecupHoraIni");
		detaoper.recupHoraFin = this.requ.getParameter("RecupHoraFin");
			
		detaoper.protocoloOperat = this.requ.getParameter("ProtocoloOperat");
		Cie diagpre = new Cie();
		diagpre.idCie = this.requ.getParameter("IdDiagPre");
		detaoper.diagPre = diagpre;
		Cie diagpost = new Cie();
		diagpost.idCie = this.requ.getParameter("IdDiagPost");
		detaoper.diagPost = diagpost;

		detaoper.descEnvio = this.requ.getParameter("DescEnvio");
		detaoper.obsEnvio = this.requ.getParameter("ObsEnvio");
		
		detaoper.patologia = this.requ.getParameter("Patologia");
		detaoper.patologia = detaoper.patologia == null ? "0" : "1";
		detaoper.patologiaEspec = this.requ.getParameter("PatologiaEspec");
		
		Complicacion comp = new Complicacion();
		comp.idComp = this.requ.getParameter("IdComp");
		detaoper.comp = comp;
		detaoper.compEspec = this.requ.getParameter("CompEspec");
		
		CondEgreso cond = new CondEgreso();
		cond.idCondEgr = this.requ.getParameter("IdCondEgr");
		detaoper.condEgr = cond;
		detaoper.condEspec = this.requ.getParameter("CondEgr");
	
		if(!detaoper.validar()){
			this.jsonError(detaoper.errorValidacion, this.resp);
			return;
		}
		detaoper.save();
		
		
		///
		String sql = "DELETE FROM detalle_procedimientos WHERE IdDetalleOper = ?";
		List<String> data = Arrays.asList(detaoper.idDetalleOper);
		db.ejecutar(sql, data);
		
		String[] IdProced = this.requ.getParameterValues("IdProced[]");
		List datos = new ArrayList();
		for(int i=0;i<IdProced.length;i++){
			Map fila = new HashMap();
			fila.put("IdDetalleOper", detaoper.idDetalleOper);
			fila.put("IdProced", IdProced[i]);
			datos.add(fila);
		}
		
		db.insertarEnLote("detalle_procedimientos", datos);
//		
//		//detaproc.IdProced
//	
//		String[] IdProced = this.requ.getParameterValues("IdProced[]");
//		for(int i=0;i<IdProced.length;i++){
//			DetalleProcs detaproc = new DetalleProcs();
//			detaproc.IdProced = IdProced[i];
//			detaproc.IdDetalleOper = detaoper.IdDetalleOper;
//			detaproc.save();
//		}
//		
//		this.jsonError(out, resp);
		//		String[] IdProced = this.requ.getParameterValues("IdProced[]");
//		String out = "";
//		for(int i=0;i<IdProced.length;i++){
//			out += "," + IdProced[i];
//		}
//		
//		this.jsonError(out, resp);
		this.jsonRedireccion("Servlet?v=detalleInfoPost&id=" + detaoper.idDetalleOper, this.resp);
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
