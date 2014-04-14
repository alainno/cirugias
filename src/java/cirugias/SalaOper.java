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
public class SalaOper {
	String idSalaOper;
	String descSalaOper;

	String getHtmlOptions() throws SQLException {
		db.ejecutar("SELECT * FROM salaoper", null);
		return db.getHtmlOptions("IdSalaOper", "DescSalaOper", this.idSalaOper, null);	
	}

	void get() throws SQLException{
		String sql = "SELECT * FROM salaoper WHERE IdSalaOper = ? LIMIT 1";
		List<String> data = Arrays.asList(this.idSalaOper);
		db.ejecutar(sql, data);
		this.descSalaOper = db.results.get(0).get("DescSalaOper");		
	}
	////////////
	public String getIdSalaOper() {
		return idSalaOper;
	}

	public void setIdSalaOper(String idSalaOper) {
		this.idSalaOper = idSalaOper;
	}

	public String getDescSalaOper() {
		return descSalaOper;
	}

	public void setDescSalaOper(String descSalaOper) {
		this.descSalaOper = descSalaOper;
	}
}
