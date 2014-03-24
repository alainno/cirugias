/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cirugias;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

public class Pais {
	String IdPais;
	String DescPais;

	public Pais() {
		this.IdPais = null;
		this.DescPais = "";
	}
	
	public void get() throws SQLException{
		String sql = "SELECT IdPais, DescPais FROM pais WHERE IdPais=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdPais);
		db.ejecutar(sql, data);
		this.DescPais = db.results.get(0).get("DescPais");
	}
	
	public String getHtmlOptions() throws SQLException{
		db.ejecutar("SELECT * FROM pais", null);
		return db.getHtmlOptions("IdPais", "DescPais", this.IdPais, null);	
	}
}
