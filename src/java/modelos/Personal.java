/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 *
 * @author Alain
 */
public class Personal {
	public String IdPersonal;
	public String Nombre;

	public Personal() {
	}

	public String getIdPersonal() {
		return IdPersonal;
	}

	public void setIdPersonal(String IdPersonal) {
		this.IdPersonal = IdPersonal;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String Nombre) {
		this.Nombre = Nombre;
	}
	
	public void save(){
		
	}
	
	boolean validar() {
		/*
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
		*/
		return true;
	}	
}
