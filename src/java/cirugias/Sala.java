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
class Sala {
	String IdSala;
	String DescSala;
	
	public String getHtmlOptions() throws SQLException{
		db.ejecutar("SELECT * FROM sala", null);
		return db.getHtmlOptions("IdSala", "DescSala", this.IdSala, null);
	}	

	void get() throws SQLException {
		String sql = "SELECT * FROM sala WHERE IdSala=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdSala);
		db.ejecutar(sql, data);
		this.DescSala = db.results.get(0).get("DescSala");
	}
}
