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
public class Distrito {
	String IdDistrito;
	String DescDistrito;
	Provincia provincia;

	public Distrito(Provincia provincia) {
		this.IdDistrito = "";
		this.DescDistrito = "";
		this.provincia = provincia;
	}
	
	public void get() throws SQLException{
		String sql = "SELECT * FROM distritos WHERE IdDistrito=? LIMIT 1";
		List<String> data = Arrays.asList(this.IdDistrito);
		db.ejecutar(sql, data);
		db.rs.next();
		this.DescDistrito = db.rs.getString("DescDistrito");
		
		Provincia province = new Provincia(null);
		province.IdProvin = db.rs.getString("IdProvincia");
		province.get();
		this.provincia = province;
	}	
}
