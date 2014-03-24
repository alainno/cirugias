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

	public void indexPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String q = request.getParameter("q");
		if(q != null){
			request.setAttribute("tabla", "tabla");
			String[] words = q.trim().split(" +");
			
			String sql = "SELECT * FROM pacientes WHERE ";
			
			List<String> data = new ArrayList<String>();
			List<String> comparaciones = new ArrayList<String>();
			
			for(String word : words){
				comparaciones.add("(DNI LIKE ? OR Nombres LIKE ? OR ApPaterno LIKE ? OR ApMaterno LIKE ? OR NumHC LIKE ?)");
				for(int i=0; i<5; i++){
					data.add("%" + word + "%");
				}
			}
			
			int i=0;
			for(String comparacion : comparaciones){
				sql += (i>0) ? "OR " + comparacion : comparacion;
				i++;
			}
			
			db.ejecutar(sql, data);
			
			String tableContent = "";
			for(Map<String,String> row : db.results){
				tableContent += "<tr>";
				tableContent += "<td>"+row.get("Nombres")+"</td>";
				tableContent += "<td>"+row.get("ApPaterno")+"</td>";
				tableContent += "<td>"+row.get("ApMaterno")+"</td>";
				tableContent += "<td>"+row.get("DNI")+"</td>";
				tableContent += "<td>"+row.get("NumHC")+"</td>";
				tableContent += "<td><a href=\"Servlet?v=detallePaciente&id="+row.get("IdPaciente")+"\" class=\"btn btn-xs btn-primary\">Detalles</a></td>";
				tableContent += "</tr>";
			}
			
			request.setAttribute("tabla", tableContent);
			request.setAttribute("q", q);
			
		}
		request.getRequestDispatcher("/index-paciente.jsp?v=indexPaciente").include(request, response);
	}

	public void nuevoPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String optionsPais = "";
		String optionsDepartamento = "";
		String optProvincias = "";
		String optDistritos = "";
		String optsOcupacion = "";

		db.ejecutar("SELECT * FROM pais", null);
		for(Map<String,String> row : db.results){
			String id = row.get("IdPais");
			String desc = row.get("DescPais");
			optionsPais += "<option value="+id+" "+("155".equals(id)?" selected":"")+">" + desc + "</option>";
		}
		
		db.ejecutar("SELECT * FROM departamentos", null);
		for(Map<String,String> row : db.results){
			String id = row.get("IdDepart");
			String desc = row.get("DescDepart");
			optionsDepartamento += "<option value='"+id+"'>" + desc + "</option>";
		}
		
		db.ejecutar("SELECT * FROM provincias", null);
		for(Map<String,String> row : db.results){
			String id = row.get("IdProvin");
			String desc = row.get("DescProvin");
			String idPadre = row.get("IdDepart");
			optProvincias += "<option value='"+id+"' class='conditional "+idPadre+"'>" + desc + "</option>";
		}
		
		db.ejecutar("SELECT * FROM distritos", null);
		for(Map<String,String> row : db.results){
			String id = row.get("IdDistrito");
			String desc = row.get("DescDistrito");
			String idPadre = row.get("IdProvincia");
			optDistritos += "<option value='"+id+"' class='conditional "+idPadre+"'>" + desc + "</option>";
		}
		
		db.ejecutar("SELECT * FROM ocupacion", null);
		for(Map<String,String> row : db.results){
			optsOcupacion += "<option value='"+row.get("IdOcup")+"'>" + row.get("DescOcup") + "</option>";
		}
		
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
		
		Pais pais = new Pais();
		pais.IdPais = request.getParameter("IdPais");
		
		Distrito dist = new Distrito(null);
		dist.IdDistrito = request.getParameter("IdDistrito");
		
		Ocupacion ocup = new Ocupacion();
		ocup.IdOcup = request.getParameter("idOcup");
		
		Paciente nuevoPaciente = new Paciente(pais);
		
		nuevoPaciente.dni = request.getParameter("dni");
		nuevoPaciente.nombres = request.getParameter("nombres");
		nuevoPaciente.apPaterno = request.getParameter("apPaterno");
		nuevoPaciente.apMaterno = request.getParameter("apMaterno");
		nuevoPaciente.fechaNac = request.getParameter("FechaNac");
		nuevoPaciente.edad = request.getParameter("Edad");
		nuevoPaciente.sexo = request.getParameter("Sexo");

		nuevoPaciente.distrito = dist;
		nuevoPaciente.direccion = request.getParameter("direccion");;
		nuevoPaciente.ocupacion = ocup;
		nuevoPaciente.numHc = request.getParameter("historiac");
		
		nuevoPaciente.idPaciente = request.getParameter("id");
		
		if(!nuevoPaciente.validar()){
			this.jsonError(nuevoPaciente.errorValidacion, response);
			return;
		}
		
		nuevoPaciente.save();
		
		response.sendRedirect("Servlet?v=detallePaciente&id=" + nuevoPaciente.idPaciente);
	}
	
	// muestra los detalles del paciente
	public void detallePaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ParseException{
		
		Paciente detPaciente = new Paciente(null);
		detPaciente.idPaciente = request.getParameter("id");
		detPaciente.get();
		
		request.setAttribute("id", detPaciente.idPaciente);
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
		request.setAttribute("ocupacion", detPaciente.ocupacion.DescOcup);
		request.setAttribute("numHc", detPaciente.numHc);
		request.setAttribute("fechaInscr", detPaciente.fechaInscr);
		
		DetalleInterv detInterv = new DetalleInterv(detPaciente, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		request.setAttribute("tablaInfoPre", detInterv.getTableByPaciente());

		request.getRequestDispatcher("/detalle-paciente.jsp").include(request, response);
	}
	
	// muestra el formulario para modificar el paciente
	public void modificarPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ParseException{
		Paciente pac = new Paciente(null);
		pac.idPaciente = request.getParameter("id");
		pac.get();
		
		request.setAttribute("id", pac.idPaciente);
		request.setAttribute("dni", pac.dni);
		request.setAttribute("nombres", pac.nombres);
		request.setAttribute("apPaterno", pac.apPaterno);
		request.setAttribute("apMaterno", pac.apMaterno);
		request.setAttribute("fechaNac", pac.fechaNac);
		
		request.setAttribute("checked", pac.fechaNac == null ? "checked" : "");
		
		request.setAttribute("sexo", pac.sexo);
		
		request.setAttribute("optionsPais", pac.pais.getHtmlOptions());
		request.setAttribute("optionsDepartamento", pac.distrito.provincia.departamento.getHtmlOptions());
		request.setAttribute("optProvincias", pac.distrito.provincia.getHtmlOptions());
		request.setAttribute("optDistritos", pac.distrito.getHtmlOptions());
		
		request.setAttribute("direccion", pac.direccion);
		request.setAttribute("optsOcupacion", pac.ocupacion.getHtmlOptions());
		request.setAttribute("numHc", pac.numHc);
		
		String masScripts = "<script src=\"js/jquery.maskedinput.min.js\"></script>";
		masScripts += "<script src=\"js/paciente.js\"></script>";
		request.setAttribute("masScripts", masScripts);
		
		request.getRequestDispatcher("/modificar-paciente.jsp").include(request, response);
	}
	
	// muestra el formulario para guardar un nuevo informe pre operatorio
	public void nuevoInfoPre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ParseException{
		//String idPaciente = request.getParameter("idpac");
		Paciente pac = new Paciente(null);
		pac.idPaciente = request.getParameter("idpac");
		pac.get();
		
		request.setAttribute("idpac", pac.idPaciente);
		request.setAttribute("nombre", pac.nombres + " " + pac.apPaterno + " " + pac.apMaterno);
		
		DepartHosp depHosp = new DepartHosp();
		ServicioHosp servHosp = new ServicioHosp(depHosp);
		Sala sala = new Sala();
		Cama cama = new Cama();
		Intervencion interv = new Intervencion();
		Premedicacion premed = new Premedicacion();
		Anestesico anestesico = new Anestesico();
		Anestesia anestesia = new Anestesia();
		PersQuir persQuir = new PersQuir();
		String persQuirOptions = persQuir.getHtmlOptions();
//		
		request.setAttribute("optsDepartHosp", depHosp.getHtmlOptions());
		request.setAttribute("optsServicioHosp", servHosp.getHtmlOptions());
		request.setAttribute("optsSala", sala.getHtmlOptions());
		request.setAttribute("optsCama", cama.getHtmlOptions());
		request.setAttribute("optsIntervencion", interv.getHtmlOptions());
		request.setAttribute("optsPremedicacion", premed.getHtmlOptions());
		request.setAttribute("optsAnestesico", anestesico.getHtmlOptions());
		request.setAttribute("optsAnestesia", anestesia.getHtmlOptions());
		request.setAttribute("optsCirujano", persQuirOptions);
		request.setAttribute("optsPrimerAyudante", persQuirOptions);
		request.setAttribute("optsSegundoAyudante", persQuirOptions);
		request.setAttribute("optsInstrumentista", persQuirOptions);
		request.setAttribute("optsCirculante", persQuirOptions);
		request.setAttribute("optsAnestesiologo", persQuirOptions);
		request.setAttribute("optsEspecialista", persQuirOptions);
		
		String masScripts = "<script src=\"js/jquery.maskedinput.min.js\"></script>";
		masScripts += "<script src=\"js/info-pre.js\"></script>";
		request.setAttribute("masScripts", masScripts);
		
		request.getRequestDispatcher("/form-info-pre.jsp").include(request, response);
	}
	
	public void guardarInfoPre(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException, ParseException {
		Paciente paciente = new Paciente(null);
		paciente.idPaciente = request.getParameter("idpac");
		ServicioHosp servhosp = new ServicioHosp(null);
		servhosp.IdServHosp = request.getParameter("IdServHosp");
		Sala sala = new Sala();
		sala.IdSala = request.getParameter("IdSala");
		Cama cama = new Cama();
		cama.IdCama = request.getParameter("IdCama");
		Intervencion interv = new Intervencion();
		interv.IdInterv = request.getParameter("IdInterv");
		Premedicacion premed = new Premedicacion();
		premed.IdPremed = request.getParameter("IdPremed");
		Anestesico anestesic = new Anestesico();
		anestesic.IdAnestesic = request.getParameter("IdAnestesic");
		Anestesia anest = new Anestesia();
		anest.IdAnest = request.getParameter("IdAnest");
		PersQuir cirujano = new PersQuir();
		cirujano.IdPersQuir = request.getParameter("cirujano");
		PersQuir primerAyudante = new PersQuir();
		primerAyudante.IdPersQuir = request.getParameter("primerA");
		PersQuir segundoAyudante = new PersQuir();
		segundoAyudante.IdPersQuir = request.getParameter("segundoA");
		PersQuir instrumentista = new PersQuir();
		instrumentista.IdPersQuir = request.getParameter("instrumentista");
		PersQuir circulante = new PersQuir();
		circulante.IdPersQuir = request.getParameter("circulante");
		PersQuir anestesiologo = new PersQuir();
		anestesiologo.IdPersQuir = request.getParameter("anestesiologo");
		PersQuir especialista = new PersQuir();
		especialista.IdPersQuir = request.getParameter("especialista");
		
		DetalleInterv detInterv = new DetalleInterv(paciente, servhosp, sala, cama, interv, premed, anestesic, anest, cirujano, primerAyudante, segundoAyudante, instrumentista, circulante, anestesiologo, especialista);
		detInterv.cantidad = request.getParameter("cantidad");
		detInterv.iniAnest = request.getParameter("IniAnest");
		detInterv.finAnest = request.getParameter("FinAnest");
		detInterv.fechaInterv = request.getParameter("FechaInterv");
		
		if(!detInterv.validar()){
			this.jsonError(detInterv.errorValidacion, response);
			return;
		}
		detInterv.save();
		response.sendRedirect("Servlet?v=detalleInfoPre&id=" + detInterv.IdDetalleInterv);
	}
	
	public void detalleInfoPre(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, SQLException, ParseException{
		
		DetalleInterv detalle = new DetalleInterv(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		detalle.IdDetalleInterv = request.getParameter("id");
		detalle.get();
		
		request.setAttribute("idpac", detalle.paciente.idPaciente);
		request.setAttribute("id", detalle.IdDetalleInterv);
		request.setAttribute("apellidos", detalle.paciente.apPaterno + " " + detalle.paciente.apMaterno);
		request.setAttribute("nombres", detalle.paciente.nombres);
		request.setAttribute("departamento", detalle.servhosp.departHosp.DescDepartH);
		request.setAttribute("piso", detalle.servhosp.departHosp.Piso);
		request.setAttribute("servicio", detalle.servhosp.DescServHosp);
		request.setAttribute("sala", detalle.sala.DescSala);
		request.setAttribute("cama", detalle.cama.DescCama);
		request.setAttribute("tipoIntervencion", detalle.interv.DescInterv);
		request.setAttribute("premedicacion", detalle.premed.DescPremed);
		request.setAttribute("anestesicos", detalle.anestesic.DescAnestesic);
		request.setAttribute("cantidad", detalle.cantidad);
		request.setAttribute("anestesia", detalle.anest.DescAnest);
		request.setAttribute("inicio", detalle.iniAnest);
		request.setAttribute("fin", detalle.finAnest);
		request.setAttribute("fechaInterv", detalle.fechaInterv);
		request.setAttribute("cirujano", detalle.cirujano.DescPersQuir);
		request.setAttribute("primerAyudante", detalle.primerAyudante.DescPersQuir);
		request.setAttribute("segundoAyudante", detalle.segundoAyudante.DescPersQuir);
		request.setAttribute("instrumentista", detalle.instrumentista.DescPersQuir);
		request.setAttribute("circulante", detalle.circulante.DescPersQuir);
		request.setAttribute("anestesiologo", detalle.anestesiologo.DescPersQuir);
		request.setAttribute("especialista", detalle.especialista.DescPersQuir);
		
		request.getRequestDispatcher("/detalle-info-pre.jsp").include(request, response);
	}
	
	public void modificarInfoPre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String masScripts = "<script src=\"js/jquery.maskedinput.min.js\"></script>";
		masScripts += "<script src=\"js/info-pre.js\"></script>";
		request.setAttribute("masScripts", masScripts);
		request.getRequestDispatcher("/form-info-pre.jsp").include(request, response);		
	}
	
	private void jsonError(String mensaje, HttpServletResponse response) throws IOException{
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
