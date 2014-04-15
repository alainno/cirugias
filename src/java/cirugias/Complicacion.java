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
public class Complicacion {
	String idComp;
	String descComp;

	String getHtmlOptions() throws SQLException {
		db.ejecutar("SELECT * FROM complicacion", null);
		return db.getHtmlOptions("IdComp", "DescComp", this.idComp, null);	
	}
	
	void get() throws SQLException{
		String sql = "SELECT * FROM complicacion WHERE IdComp = ? LIMIT 1";
		List<String> data = Arrays.asList(this.idComp);
		db.ejecutar(sql, data);
		this.descComp = db.results.get(0).get("DescComp");				
	}

	public String getIdComp() {
		return idComp;
	}

	public void setIdComp(String idComp) {
		this.idComp = idComp;
	}

	public String getDescComp() {
		return descComp;
	}

	public void setDescComp(String descComp) {
		this.descComp = descComp;
	}
}
