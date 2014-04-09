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
public class Procedimiento {
	String IdProced;
	String DescProced;

	public Procedimiento() {
	}
	
	public Map demo() throws SQLException{
		String sql = "SELECT * FROM procedimientos LIMIT 20";
		db.ejecutar(sql, null);
		
		//String text = "";
		
//		Map results = new HashMap();
		List results = new ArrayList();
		for(Map<String,String> row : db.results){
			//text += "\n" + row.get("DescProced") + "|" + row.get("IdProced");
			Map result = new HashMap();
			result.put("id", row.get("IdProced"));
			result.put("text", row.get("DescProced"));
			results.add(result);
		}
		
		Map json = new HashMap();
		json.put("more", false);
		json.put("results", results);
		
//		return text.trim();
//		return "Alain|1 Alan|2 Alberto|3";
		return json;
	}

	Map buscar(String q) throws SQLException {
		String sql = "SELECT * FROM procedimientos WHERE IdProced LIKE ? OR DescProced LIKE ?";
		List<String> data =  Arrays.asList(q + "%", q + "%");
		db.ejecutar(sql, data);
		
		List results = new ArrayList();
		for(Map<String,String> row : db.results){
			Map result = new HashMap();
			result.put("id", row.get("IdProced"));
			result.put("text", row.get("IdProced") + " - " + row.get("DescProced"));
			results.add(result);
		}
		
		Map json = new HashMap();
		json.put("more", false);
		json.put("results", results);
		return json;		
	}
}
