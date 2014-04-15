/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cirugias;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Nino
 */
public class Cie {
	String idCie;
	String descCie;

	public Cie() {
	}

	Map buscar(String q) throws SQLException {
		String sql = "SELECT * FROM cie WHERE IdCie LIKE ? OR DescCie LIKE ?";
		List<String> data =  Arrays.asList(q + "%", q + "%");
		db.ejecutar(sql, data);
		
		List results = new ArrayList();
		for(Map<String,String> row : db.results){
			Map result = new HashMap();
			result.put("id", row.get("IdCie"));
			result.put("text", row.get("IdCie") + " - " + row.get("DescCie"));
			results.add(result);
		}
		
		Map json = new HashMap();
		json.put("more", false);
		json.put("results", results);
		return json;		
	}

	public void get() throws SQLException{
		String sql = "SELECT * FROM cie WHERE IdCie = ? LIMIT 1";
		List<String> data = Arrays.asList(this.idCie);
		db.ejecutar(sql, data);
		this.descCie = db.results.get(0).get("DescCie");		
	}
	
	////////////////
	public String getIdCie() {
		return idCie;
	}

	public void setIdCie(String idCie) {
		this.idCie = idCie;
	}

	public String getDescCie() {
		return descCie;
	}

	public void setDescCie(String descCie) {
		this.descCie = descCie;
	}
}
