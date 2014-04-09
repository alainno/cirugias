/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cirugias;

import java.sql.SQLException;

/**
 *
 * @author Nino
 */
public class Complicacion {
	String IdComp;
	String DescComp;

	String getHtmlOptions() throws SQLException {
		db.ejecutar("SELECT * FROM complicacion", null);
		return db.getHtmlOptions("IdComp", "DescComp", this.IdComp, null);	
	}
}
