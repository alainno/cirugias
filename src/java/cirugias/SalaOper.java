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
public class SalaOper {
	String IdSalaOper;
	String DescSalaOper;

	String getHtmlOptions() throws SQLException {
		db.ejecutar("SELECT * FROM salaoper", null);
		return db.getHtmlOptions("IdSalaOper", "DescSalaOper", this.IdSalaOper, null);	
	}
}
