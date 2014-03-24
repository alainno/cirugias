/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cirugias;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Nino
 */
class Departamento {
	String IdDepart;
	String DescDepart;
	//Pais pais;

	public Departamento(/*Pais pais*/) {
		this.IdDepart = "";
		this.DescDepart = "";
		//this.pais = pais;
	}
	
	public void get() throws SQLException{
		String sql = "SELECT * FROM departamentos WHERE IdDepart=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdDepart);
		db.ejecutar(sql, data);
		db.rs.next();
		this.DescDepart = db.rs.getString("DescDepart");
		
		/*Pais country = new Pais();
		country.IdPais = db.rs.getString("IdPais");
		country.get();
		this.pais = country;*/
	}	
}
