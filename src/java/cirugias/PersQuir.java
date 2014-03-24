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
class PersQuir {
	String IdPersQuir;
	String DescPersQuir;
	String Direccion;
	String Telefono;
	String DNI;
	
	public String getHtmlOptions() throws SQLException{
		db.ejecutar("SELECT * FROM persquir", null);
		return db.getHtmlOptions("IdPersQuir", "DescPersQuir", this.IdPersQuir, null);
	}

	void get() throws SQLException {
		String sql = "SELECT * FROM persquir WHERE IdPersQuir=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdPersQuir);
		db.ejecutar(sql, data);
		this.DescPersQuir = db.results.get(0).get("DescPersQuir");
		this.Direccion = db.results.get(0).get("Direccion");
		this.Telefono = db.results.get(0).get("Telefono");
		this.DNI = db.results.get(0).get("DNI");
	}
}
