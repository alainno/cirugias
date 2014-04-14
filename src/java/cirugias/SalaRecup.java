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
public class SalaRecup {
	String idSalaRecup;
	String descSalaRecup;

	String getHtmlOptions() throws SQLException {
		db.ejecutar("SELECT * FROM salarecup", null);
		return db.getHtmlOptions("IdSalaRecup", "DescSalaRecup", this.idSalaRecup, null);	
	}
	
	void get() throws SQLException{
		String sql = "SELECT * FROM salarecup WHERE idSalaRecup = ? LIMIT 1";
		List<String> data = Arrays.asList(this.idSalaRecup);
		db.ejecutar(sql, data);
		this.descSalaRecup = db.results.get(0).get("DescSalaRecup");		
	}	

	///////////////
	public String getIdSalaRecup() {
		return idSalaRecup;
	}

	public void setIdSalaRecup(String idSalaRecup) {
		this.idSalaRecup = idSalaRecup;
	}

	public String getDescSalaRecup() {
		return descSalaRecup;
	}

	public void setDescSalaRecup(String descSalaRecup) {
		this.descSalaRecup = descSalaRecup;
	}
}
