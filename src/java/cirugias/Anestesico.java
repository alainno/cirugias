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
class Anestesico {
	String IdAnestesic;
	String DescAnestesic;
	
	public String getHtmlOptions() throws SQLException{
		db.ejecutar("SELECT * FROM anestesicos", null);
		return db.getHtmlOptions("IdAnestesic", "DescAnestesic", this.IdAnestesic, null);
	}

	void get() throws SQLException {
		String sql = "SELECT * FROM anestesicos WHERE IdAnestesic=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdAnestesic);
		db.ejecutar(sql, data);
		this.DescAnestesic = db.results.get(0).get("DescAnestesic");
	}
}
