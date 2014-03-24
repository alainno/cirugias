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
class Intervencion {
	String IdInterv;
	String DescInterv;
	
	public String getHtmlOptions() throws SQLException{
		db.ejecutar("SELECT * FROM intervencion", null);
		return db.getHtmlOptions("IdInterv", "DescInterv", this.IdInterv, null);
	}

	void get() throws SQLException {
		String sql = "SELECT * FROM intervencion WHERE IdInterv=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdInterv);
		db.ejecutar(sql, data);
		this.DescInterv = db.results.get(0).get("DescInterv");
	}
}
