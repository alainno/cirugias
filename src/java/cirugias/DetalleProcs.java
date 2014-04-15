/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cirugias;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Nino
 */
class DetalleProcs {
	String idDetalleProcs;
	String idDetalleOper;
	String idProced;

	List getDetalleProcs() throws SQLException {
//		String sql = "SELECT IdProced, DescProced"
//				+ " FROM detalle_procedimientos dp"
//				+ " JOIN procedimientos pr ON dp.IdProced = pr.IdProced"
//				+ " WHERE IdDetalleOper = ?";
//		String sql = "SELECT * FROM detalle_procedimientos WHERE IdDetalleOper = ?";
		String sql = "SELECT dp.IdProced AS IdProced, DescProced"
				+ " FROM detalle_procedimientos dp, procedimientos pr"
				+ " WHERE IdDetalleOper = ? AND dp.IdProced = pr.IdProced";
		List<String> data =  Arrays.asList(this.idDetalleOper);
		db.ejecutar(sql, data);
		List resultados = new ArrayList(db.results);
		return resultados;
	}
}
