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
class Anestesia {
	String IdAnest;
	String DescAnest;
	String TipoAnest;
	
	public String getHtmlOptions() throws SQLException{
		db.ejecutar("SELECT * FROM anestesia", null);
		return db.getHtmlOptions("IdAnest", "DescAnest", this.IdAnest, null);
	}

	void get() throws SQLException {
		String sql = "SELECT * FROM anestesia WHERE IdAnest=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdAnest);
		db.ejecutar(sql, data);
		this.DescAnest = db.results.get(0).get("DescAnest");
		this.TipoAnest = db.results.get(0).get("TipoAnest");
	}
}
