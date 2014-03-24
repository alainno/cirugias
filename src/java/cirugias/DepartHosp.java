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
class DepartHosp {
	String IdDepartH = null;
	String DescDepartH = null;
	String Piso = null;
	
	public String getHtmlOptions() throws SQLException{
		db.ejecutar("SELECT * FROM departhosp", null);
		return db.getHtmlOptions("IdDepartH", "DescDepartH", this.IdDepartH, null);
	}

	void get() throws SQLException {
		String sql = "SELECT * FROM departhosp WHERE IdDepartH=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdDepartH);
		db.ejecutar(sql, data);
		this.DescDepartH = db.results.get(0).get("DescDepartH");
		this.Piso = db.results.get(0).get("IdPiso");
	}
}
