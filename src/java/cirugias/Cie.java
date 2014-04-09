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
	String IdCie;
	String DescCie;

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
}
