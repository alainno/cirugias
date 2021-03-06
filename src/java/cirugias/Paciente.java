/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cirugias;

//import java.sql.Date;
import java.io.Serializable;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.joda.time.LocalDate;
import org.joda.time.Years;

/**
 *
 * @author Nino
 */
public class Paciente{
	String idPaciente;
	String dni = "";
	String nombres = "";
	String apPaterno = "";
	String apMaterno = "";
	String fechaNac = "";
	String edad = "";
	String sexo = "";
	//String idPais = "";
	Pais pais;
	//String idDistrito = "";
	Distrito distrito;
	String direccion = "";
//	String idOcup = "";
	Ocupacion ocupacion = null;
	String numHc = "0";
	String fechaInscr = "";
	String errorValidacion = "";

	public Paciente(Pais pais) {
		//this.fechaInscr = new SimpleDateFormat("dd/MM/yyyy").format(new Date());
		this.idPaciente = null;
		this.pais = pais;
	}
	
	public void save() throws SQLException, ParseException{
		
		if(this.fechaNac != null){
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Date d = sdf.parse(this.fechaNac);
			sdf.applyPattern("yyyy-MM-dd");
			this.fechaNac = sdf.format(d);
		}
		
		if(this.idPaciente == null){
			String sql = "INSERT INTO pacientes";
			sql += "(DNI,Nombres,ApPaterno,ApMaterno,FechaNac,Edad,IdPais,Direccion,IdDistrito,IdOcup,Sexo,FechaInscr,NumHC)";
			sql += " VALUES(?,?,?,?,?,?,?,?,?,?,?,NOW(),?)";
			List<String> data =  Arrays.asList(this.dni,this.nombres,this.apPaterno,this.apMaterno,this.fechaNac,this.edad,this.pais.IdPais,this.direccion,this.distrito.IdDistrito,this.ocupacion.IdOcup,this.sexo/*,this.fechaInscr*/,this.numHc);
			db.ejecutar(sql, data);
			this.idPaciente = db.insertId;
		} else {
			String sql = "UPDATE pacientes SET";
			sql += " DNI=?,Nombres=?,ApPaterno=?,ApMaterno=?,FechaNac=?,Edad=?,IdPais=?,Direccion=?,IdDistrito=?,IdOcup=?,Sexo=?,NumHC=?";
			sql += " WHERE IdPaciente = ? LIMIT 1";
			List<String> data =  Arrays.asList(this.dni,this.nombres,this.apPaterno,this.apMaterno,this.fechaNac,this.edad,this.pais.IdPais,this.direccion,this.distrito.IdDistrito,this.ocupacion.IdOcup,this.sexo,this.numHc,this.idPaciente);
			db.ejecutar(sql, data);
		}
		//db.finalizar();
	}

	boolean validar() {
		if(!this.dni.matches("^[0-9]{8}$")){
			this.errorValidacion = "DNI incorrecto.";
			return false;
		}
		
		if(this.fechaNac != null && !this.fechaNac.matches("^[0-9]{2}/[0-9]{2}/[0-9]{4}$")){
			this.errorValidacion = "Fecha de nacimiento incorrecta.";
			return false;
		}
		
		if(this.edad != null && !this.edad.matches("\\d+(\\.\\d+)?")){
			this.errorValidacion = "Edad incorrecta.";
			return false;
		}
		
		if(!this.numHc.matches("\\d+(\\.\\d+)?")){
			this.errorValidacion = "Nro. de historia clínica incorrecta.";
			return false;
		}
		
		return true;
	}

	void get() throws SQLException, ParseException {
		String sql = "SELECT * FROM pacientes WHERE IdPaciente = ? LIMIT 1";
		List<String> data = Arrays.asList(this.idPaciente);
		db.ejecutar(sql, data);
		Map<String,String> row = db.results.get(0);
		
		this.dni = db.results.get(0).get("DNI");
		this.nombres = db.results.get(0).get("Nombres");
		this.apPaterno = db.results.get(0).get("ApPaterno");
		this.apMaterno = db.results.get(0).get("ApMaterno");
		this.fechaNac = db.changeFormatDate(row.get("FechaNac"),"yyyy-MM-dd","dd/MM/yyyy");
		
		this.edad = db.results.get(0).get("Edad");
		this.edad = (this.fechaNac != null) ? this.getEdad() : this.edad;
		this.direccion = db.results.get(0).get("Direccion");
		this.sexo = db.results.get(0).get("Sexo");
		
		this.numHc = db.results.get(0).get("NumHC");
		this.fechaInscr = db.changeFormatDate(row.get("FechaInscr"),"yyyy-MM-dd","dd/MM/yyyy");
		
		Pais country = new Pais();
		country.IdPais = row.get("IdPais");
		country.get();
		this.pais = country;

		Departamento depa = new Departamento();
		Provincia prov = new Provincia(depa);
		
		Distrito dist = new Distrito(prov);
		dist.IdDistrito = row.get("IdDistrito");
		dist.get();
		this.distrito = dist;
		
		Ocupacion ocup = new Ocupacion();
		ocup.IdOcup = row.get("IdOcup");
		ocup.get();
		this.ocupacion = ocup;
	}

	private String getEdad() {
		if(this.fechaNac == null){
			return "";
		}
		LocalDate now = new LocalDate();
		String[] fecha = this.fechaNac.split("/");
		LocalDate birthday = new LocalDate(Integer.parseInt(fecha[2]), Integer.parseInt(fecha[1]), Integer.parseInt(fecha[0]));
		Years age = Years.yearsBetween(birthday, now);
		return Integer.toString(age.getYears());
	}
	
	public String getTipoEdad(){
		if(this.edad == null){
			return "";
		}
		int age = Integer.parseInt(this.edad);
		if(age <= 12){
			return "NIÑO";
		}else if(age <= 18){
			return "ADOLECENTE";
		}else if(age <= 29){
			return "JOVEN";
		}else if(age <= 65){
			return "ADULTO";
		}else{
			return "ADULTO MAYOR";
		}
	}

	public String buscar(String q) throws SQLException {
		String[] words = q.trim().split(" +");

		String sql = "SELECT * FROM pacientes WHERE ";

		List<String> data = new ArrayList();
		List<String> comparaciones = new ArrayList();

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
		
		return tableContent;
	}

	public String getIdPaciente() {
		return idPaciente;
	}

	public void setIdPaciente(String idPaciente) {
		this.idPaciente = idPaciente;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApPaterno() {
		return apPaterno;
	}

	public void setApPaterno(String apPaterno) {
		this.apPaterno = apPaterno;
	}

	public String getApMaterno() {
		return apMaterno;
	}

	public void setApMaterno(String apMaterno) {
		this.apMaterno = apMaterno;
	}

	public String getFechaNac() {
		return fechaNac;
	}

	public void setFechaNac(String fechaNac) {
		this.fechaNac = fechaNac;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}

	public Distrito getDistrito() {
		return distrito;
	}

	public void setDistrito(Distrito distrito) {
		this.distrito = distrito;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Ocupacion getOcupacion() {
		return ocupacion;
	}

	public void setOcupacion(Ocupacion ocupacion) {
		this.ocupacion = ocupacion;
	}

	public String getNumHc() {
		return numHc;
	}

	public void setNumHc(String numHc) {
		this.numHc = numHc;
	}

	public String getFechaInscr() {
		return fechaInscr;
	}

	public void setFechaInscr(String fechaInscr) {
		this.fechaInscr = fechaInscr;
	}

	public String getErrorValidacion() {
		return errorValidacion;
	}

	public void setErrorValidacion(String errorValidacion) {
		this.errorValidacion = errorValidacion;
	}	
}
