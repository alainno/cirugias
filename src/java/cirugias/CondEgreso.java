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
public class CondEgreso {
	String IdCondEgr;
	String DescCondEgr;

	String getHtmlOptions() throws SQLException {
		db.ejecutar("SELECT * FROM condegreso", null);
		return db.getHtmlOptions("IdCondEgr", "DescCondEgr", this.IdCondEgr, null);	
	}
}
