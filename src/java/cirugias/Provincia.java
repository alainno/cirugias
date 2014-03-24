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
class Provincia {
	String IdProvin;
	String DescProvin;
	Departamento departamento;

	public Provincia(Departamento departamento) {
		this.IdProvin = "";
		this.DescProvin = "";
		this.departamento = departamento;
	}
	
	public void get() throws SQLException{
		String sql = "SELECT * FROM provincias WHERE IdProvin=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdProvin);
		db.ejecutar(sql, data);
		db.rs.next();
		this.DescProvin = db.rs.getString("DescProvin");
		
		Departamento depart = new Departamento();
		depart.IdDepart = db.rs.getString("IdDepart");
		depart.get();
		this.departamento = depart;
	}	
}
