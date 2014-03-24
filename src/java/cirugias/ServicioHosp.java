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
class ServicioHosp {
	String IdServHosp = null;
	DepartHosp departHosp = null;
	String DescServHosp = null;

	public ServicioHosp(DepartHosp departHosp) {
		this.departHosp = departHosp;
	}
	
	public String getHtmlOptions() throws SQLException{
		db.ejecutar("SELECT * FROM serviciohosp", null);
		return db.getHtmlOptions("IdServHosp", "DescServHosp", this.IdServHosp, "IdDepartHosp");
	}	

	public void get() throws SQLException {
		if(this.IdServHosp == null){
			return;
		}
		
		String sql = "SELECT * FROM serviciohosp WHERE IdServHosp=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdServHosp);
		db.ejecutar(sql, data);
		this.DescServHosp = db.results.get(0).get("DescServHosp");
		
		DepartHosp depart = new DepartHosp();
		depart.IdDepartH = db.results.get(0).get("IdDepartHosp");
		depart.get();
		this.departHosp = depart;	
	}
}
