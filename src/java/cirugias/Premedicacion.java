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
class Premedicacion {
	String IdPremed;
	String DescPremed;
	
	public String getHtmlOptions() throws SQLException{
		db.ejecutar("SELECT * FROM premedicacion", null);
		return db.getHtmlOptions("IdPremed", "DescPremed", this.IdPremed, null);
	}

	void get() throws SQLException {
		String sql = "SELECT * FROM premedicacion WHERE IdPremed=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdPremed);
		db.ejecutar(sql, data);
		this.DescPremed = db.results.get(0).get("DescPremed");
	}
}
