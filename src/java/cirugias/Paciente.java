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
import java.util.Arrays;
import java.util.Date;
import java.util.List;
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
	String idOcup = "";
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
			List<String> data =  Arrays.asList(this.dni,this.nombres,this.apPaterno,this.apMaterno,this.fechaNac,this.edad,this.pais.IdPais,this.direccion,this.distrito.IdDistrito,this.idOcup,this.sexo/*,this.fechaInscr*/,this.numHc);			
			db.ejecutar(sql, data);
			this.idPaciente = db.insertId;
		}
		
		db.finalizar();
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

	void get() throws SQLException {
		String sql = "SELECT * FROM pacientes WHERE IdPaciente = ? LIMIT 1";
		List<String> data = Arrays.asList(this.idPaciente);
		db.ejecutar(sql, data);
		db.rs.next();
		
		this.dni = db.rs.getString("DNI");
		this.nombres = db.rs.getString("Nombres");
		this.apPaterno = db.rs.getString("ApPaterno");
		this.apMaterno = db.rs.getString("ApMaterno");
		this.fechaNac = db.rs.getString("FechaNac");
		this.fechaNac = this.fechaNac == null ? "-" : this.fechaNac;
		this.edad = "-".equals(this.fechaNac) ? db.rs.getString("Edad") : this.getEdad();
		//this.idPais = db.rs.getString("IdPais");
		this.direccion = db.rs.getString("Direccion");
		//this.idDistrito = db.rs.getString("IdDistrito");
		String IdDistrito = db.rs.getString("IdDistrito");
		this.idOcup = db.rs.getString("IdOcup");
		this.sexo = db.rs.getString("Sexo");
		this.fechaInscr = db.rs.getString("FechaInscr");
		this.numHc = db.rs.getString("NumHC");
		
		Pais country = new Pais();
		country.IdPais = db.rs.getString("IdPais");
		country.get();
		this.pais = country;
		
		if(IdDistrito != null){
			Distrito dist = new Distrito(null);
			dist.IdDistrito = IdDistrito;
			//dist.IdDistrito = "1590";
			dist.get();
			this.distrito = dist;
		}
	}

	private String getEdad() {
		LocalDate now = new LocalDate();
		String[] fecha = this.fechaNac.split("-");
		LocalDate birthday = new LocalDate(Integer.parseInt(fecha[0]), Integer.parseInt(fecha[1]), Integer.parseInt(fecha[2]));
		Years age = Years.yearsBetween(birthday, now);
		return Integer.toString(age.getYears());
	}
	
	public String getTipoEdad(){
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
}
