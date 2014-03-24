/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cirugias;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
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
@WebServlet(name = "Servlet", urlPatterns = {"/Servlet"})
public class Servlet extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 * @throws java.lang.NoSuchMethodException
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NoSuchMethodException {
		response.setContentType("text/html;charset=UTF-8");
		/*try (PrintWriter out = response.getWriter()) {
		
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet Servlet</title>");			
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet Servlet at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}*/
		
		String vista = request.getParameter("v");
		if(vista == null){
			vista = "indexPaciente";
		}
		//	return;
		//request.getRequestDispatcher("/"+vista+".jsp").include(request, response);
		//response.sendRedirect("index-paciente.jsp");
		Method method = getClass().getDeclaredMethod(vista, HttpServletRequest.class, HttpServletResponse.class);
		try {
			method.invoke(this, request, response);
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
			Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
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
			Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
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

	public void indexPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//request.setAttribute("v", "indexPaciente");
		request.getRequestDispatcher("/index-paciente.jsp?v=indexPaciente").include(request, response);
	}

	public void nuevoPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		String optionsPais = "";
		String optionsDepartamento = "";
		String optProvincias = "";
		String optDistritos = "";
		String optsOcupacion = "";

		db.ejecutar("SELECT * FROM pais", null);
		while(db.rs.next()){
			String id = db.rs.getString("IdPais");
			String desc = db.rs.getString("DescPais");
			optionsPais += "<option value="+id+" "+("155".equals(id)?" selected":"")+">" + desc + "</option>";
			//paises.put(rs.getString("IdPais"), rs.getString("DescPais"));
		}
		db.finalizar();
		
		db.ejecutar("SELECT * FROM departamentos", null);
		while(db.rs.next()){
			String id = db.rs.getString("IdDepart");
			String desc = db.rs.getString("DescDepart");
			optionsDepartamento += "<option value='"+id+"'>" + desc + "</option>";
		}
		db.finalizar();
		
		db.ejecutar("SELECT * FROM provincias", null);
		while(db.rs.next()){
			String id = db.rs.getString("IdProvin");
			String desc = db.rs.getString("DescProvin");
			String idPadre = db.rs.getString("IdDepart");
			optProvincias += "<option value='"+id+"' class='conditional "+idPadre+"'>" + desc + "</option>";
		}
		db.finalizar();
		
		db.ejecutar("SELECT * FROM distritos", null);
		while(db.rs.next()){
			String id = db.rs.getString("IdDistrito");
			String desc = db.rs.getString("DescDistrito");
			String idPadre = db.rs.getString("IdProvincia");
			optDistritos += "<option value='"+id+"' class='conditional "+idPadre+"'>" + desc + "</option>";
		}
		db.finalizar();
		
		db.ejecutar("SELECT * FROM ocupacion", null);
		while(db.rs.next()){
			String id = db.rs.getString("IdOcup");
			String desc = db.rs.getString("DescOcup");
			optsOcupacion += "<option value='"+id+"'>" + desc + "</option>";
		}
		db.finalizar();
		
		request.setAttribute("optionsPais", optionsPais);
		request.setAttribute("optionsDepartamento", optionsDepartamento);
		request.setAttribute("optProvincias", optProvincias);
		request.setAttribute("optDistritos", optDistritos);
		request.setAttribute("optsOcupacion", optsOcupacion);
		
		String masScripts = "<script src=\"js/jquery.maskedinput.min.js\"></script>";
		masScripts += "<script src=\"js/paciente.js\"></script>";
		request.setAttribute("masScripts", masScripts);
		
		request.getRequestDispatcher("/nuevo-paciente.jsp").include(request, response);
	}

	public void guardarPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ParseException{
		//request.getRequestDispatcher("/nuevo-paciente.jsp").include(request, response);
		String dni = request.getParameter("dni");
		String nombres = request.getParameter("nombres");
		String apPaterno = request.getParameter("apPaterno");
		String apMaterno = request.getParameter("apMaterno");
		String fechaNac = request.getParameter("FechaNac");
		String edad = request.getParameter("Edad");
		String sexo = request.getParameter("Sexo");
//		String idPais = request.getParameter("IdPais");
//		String idDistrito = request.getParameter("IdDistrito");
		String direccion = request.getParameter("direccion");
		String idOcup = request.getParameter("idOcup");
		String historiac = request.getParameter("historiac");
		
		Pais pais = new Pais();
		pais.IdPais = request.getParameter("IdPais");
		
		Distrito dist = new Distrito(null);
		dist.IdDistrito = request.getParameter("IdDistrito");
		
		Paciente nuevoPaciente = new Paciente(pais);
		nuevoPaciente.dni = dni;
		nuevoPaciente.nombres = nombres;
		nuevoPaciente.apPaterno = apPaterno;
		nuevoPaciente.apMaterno = apMaterno;
		nuevoPaciente.fechaNac = fechaNac;
		nuevoPaciente.edad = edad;
		nuevoPaciente.sexo = sexo;
//		nuevoPaciente.idPais = idPais;
//		nuevoPaciente.idDistrito = idDistrito;
		nuevoPaciente.distrito = dist;
		nuevoPaciente.direccion = direccion;
		nuevoPaciente.idOcup = idOcup;
		nuevoPaciente.numHc = historiac;
		
		if(!nuevoPaciente.validar()){
			this.jsonError(nuevoPaciente.errorValidacion, response);
			return;
		}
		
		nuevoPaciente.save();
		
		response.sendRedirect("Servlet?v=detallePaciente&id=" + nuevoPaciente.idPaciente);
		
//		try (PrintWriter out = response.getWriter()) {
////			out.println(db.lastInsertId());
//			out.println(nuevoPaciente.idPaciente);
//			
//		}
	}
	
	// muestra los detalles del paciente
	void detallePaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		
		Paciente detPaciente = new Paciente(null);
		detPaciente.idPaciente = request.getParameter("id");
		detPaciente.get();
		//request.setAttribute("dni", detPaciente.dni);
		request.setAttribute("dni", detPaciente.dni);
		request.setAttribute("nombres", detPaciente.nombres);
		request.setAttribute("apPaterno", detPaciente.apPaterno);
		request.setAttribute("apMaterno", detPaciente.apMaterno);
		request.setAttribute("fechaNac", detPaciente.fechaNac);
		request.setAttribute("edad", detPaciente.edad);
		request.setAttribute("tipoEdad", detPaciente.getTipoEdad());
		request.setAttribute("sexo", detPaciente.sexo);
		request.setAttribute("pais", detPaciente.pais.DescPais);
		if(detPaciente.distrito !=  null){
			request.setAttribute("distrito", detPaciente.distrito.DescDistrito);
			request.setAttribute("provincia", detPaciente.distrito.provincia.DescProvin);
			request.setAttribute("departamento", detPaciente.distrito.provincia.departamento.DescDepart);
		}
		request.setAttribute("direccion", detPaciente.direccion);
		request.setAttribute("numHc", detPaciente.numHc);
		request.setAttribute("fechaInscr", detPaciente.fechaInscr);

		request.getRequestDispatcher("/detalle-paciente.jsp").include(request, response);
	}
	
	void jsonError(String mensaje, HttpServletResponse response) throws IOException{
		Map json = new HashMap();
		json.put("error", true);
		json.put("mensaje", mensaje);
		this.jsonResponse(json, response);		
	}

	private void jsonResponse(Map json, HttpServletResponse response) throws IOException {
		//response.setContentType("text/json");
		//response.getWriter().write(new Gson().toJson(json));
		response.getWriter().println(new Gson().toJson(json));
	}
} // fin servlet
