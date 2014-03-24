/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cirugias;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Alain
 */
public class Ocupacion {
	String IdOcup = null;
	String DescOcup = null;

	public Ocupacion() {
	}
	
	public void get() throws SQLException{
		if(this.IdOcup == null){
			return;
		}
		String sql = "SELECT * FROM ocupacion WHERE IdOcup = ? LIMIT 1";
		List<String> data = Arrays.asList(this.IdOcup);
		db.ejecutar(sql, data);
		this.DescOcup = db.results.get(0).get("DescOcup").toString();
	}
	
	public String getHtmlOptions() throws SQLException{
		db.ejecutar("SELECT * FROM ocupacion", null);
		return db.getHtmlOptions("IdOcup", "DescOcup", this.IdOcup, null);	
	}
}
