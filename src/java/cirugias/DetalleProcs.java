/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cirugias;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Nino
 */
class DetalleProcs {
	String idDetalleProcs;
	String idDetalleOper;
	String idProced;

	List getDetalleProcs() throws SQLException {
		String sql = "SELECT * FROM detalle_procedimientos WHERE IdDetalleOper = ?";
		List<String> data =  Arrays.asList(this.idDetalleOper);
		db.ejecutar(sql, data);
		return db.results;
	}
}
