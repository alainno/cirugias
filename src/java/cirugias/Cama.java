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
class Cama {
	String IdCama;
	String DescCama;
	
	public String getHtmlOptions() throws SQLException{
		db.ejecutar("SELECT * FROM cama ORDER BY IdCama ASC", null);
		return db.getHtmlOptions("IdCama", "DescCama", this.IdCama, null);
	}

	void get() throws SQLException {
		String sql = "SELECT * FROM cama WHERE IdCama=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdCama);
		db.ejecutar(sql, data);
		this.DescCama = db.results.get(0).get("DescCama");
	}
}
