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
public class CondEgreso {
	String idCondEgr;
	String descCondEgr;

	String getHtmlOptions() throws SQLException {
		db.ejecutar("SELECT * FROM condegreso", null);
		return db.getHtmlOptions("IdCondEgr", "DescCondEgr", this.idCondEgr, null);	
	}
	
	void get() throws SQLException{
		String sql = "SELECT * FROM condegreso WHERE IdCondEgr = ? LIMIT 1";
		List<String> data = Arrays.asList(this.idCondEgr);
		db.ejecutar(sql, data);
		this.descCondEgr = db.results.get(0).get("DescCondEgr");				
	}

	public String getIdCondEgr() {
		return idCondEgr;
	}

	public void setIdCondEgr(String idCondEgr) {
		this.idCondEgr = idCondEgr;
	}

	public String getDescCondEgr() {
		return descCondEgr;
	}

	public void setDescCondEgr(String descCondEgr) {
		this.descCondEgr = descCondEgr;
	}
}
