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
public class SalaRecup {
	String IdSalaRecup;
	String DescSalaRecup;

	String getHtmlOptions() throws SQLException {
		db.ejecutar("SELECT * FROM salarecup", null);
		return db.getHtmlOptions("IdSalaRecup", "DescSalaRecup", this.IdSalaRecup, null);	
	}
}
