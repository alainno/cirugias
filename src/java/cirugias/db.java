package cirugias;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Alain
 */
public class db {

	protected static Connection conn = null;
	protected static PreparedStatement stmt = null;
	protected static String sql;
	public static ResultSet rs;
	protected static List<String> data;
	public static String insertId = "0";
	//public static List results = new ArrayList();
	public static List<Map<String, String>> results = new ArrayList<Map<String, String>>();

	protected static void conectar() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {

			db.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cirugia4", "root", "");
//			db.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alainpe_cirugias","alainpe_cirugias","cirujano2404");
		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
	}

	protected static void preparar() throws SQLException {
		db.stmt = db.conn.prepareStatement(db.sql, Statement.RETURN_GENERATED_KEYS);
	}

	public static void ejecutar(String sql, List<String> data) throws SQLException {
		db.sql = sql;
		db.data = data;
		db.conectar();
		db.preparar();
		db.setParams();
		boolean rpta = db.stmt.execute();

		if (sql.toLowerCase().contains("INSERT".toLowerCase())) {
			ResultSet keys = db.stmt.getGeneratedKeys();
			keys.next();
			db.insertId = keys.getString(1);
		} else if (rpta) {
			//db.rs = db.stmt.getResultSet();
			db.getData();
		}

		db.finalizar();

	}

	private static void setParams() throws SQLException {
		if (db.data != null) {
			int dataSize = db.data.size();
			for (int i = 0; i < dataSize; i++) {
				db.stmt.setString(i + 1, db.data.get(i));
			}
		}
	}

	public static void finalizar() throws SQLException {
		//db.rs.close();
		db.stmt.close();
		db.conn.close();
	}

//	public static String lastInsertId() throws SQLException{
//		db.ejecutar("SELECT LAST_INSERT_ID() AS id", null);
//		db.rs.next();
//		return db.rs.getString("id");
//	}
	private static void getData() throws SQLException {
		db.results.clear();
		db.rs = db.stmt.getResultSet();
		ResultSetMetaData metaData = rs.getMetaData();
		int columnCount = metaData.getColumnCount();
		while (db.rs.next()) {
			Map<String, String> columns = new LinkedHashMap<String, String>();
			for (int i = 1; i <= columnCount; i++) {
//				columns.put(metaData.getColumnLabel(i), db.rs.getObject(i));
				columns.put(metaData.getColumnLabel(i), db.rs.getString(i));
			}
			db.results.add(columns);
		}
		db.rs.close();
	}

	static String changeFormatDate(String date, String from, String to) throws ParseException {
		if (date != null) {
			SimpleDateFormat sdf = new SimpleDateFormat(from);
			Date d = sdf.parse(date);
			sdf.applyPattern(to);
			return sdf.format(d);
		}
		return null;
	}

	public static String getHtmlOptions(String value, String label, String selected, String padre) {
		String html = "";
		for (Map<String, String> row : db.results) {
			String valor = row.get(value);
			String etiqueta = row.get(label);
			html += "<option value='" + valor + "'";
			if (padre != null) {
				html += " class=\"conditional " + row.get(padre) + "\"";
			}
			if (selected != null) {
				html += valor.equals(selected) ? " selected" : "";
			}
			html += ">" + etiqueta + "</option>";
		}
		return html;
	}

	static void insertarEnLote(String tabla, List<Map> lote) throws SQLException {

		//db.stmt = db.conn.pre
		//String sql = "insert into employee (name, city, phone) values (?, ?, ?)";
		//Connection connection = new getConnection();
		//PreparedStatement ps = db.prepareStatement(sql);
		//for (Employee employee : employees) {
		String campos = "", valores = "";
		Map<String, String> fila0 = lote.get(0);
		int k = 0;
		for (Map.Entry<String, String> dato : fila0.entrySet()) {
			campos += (k > 0 ? "," : "") + dato.getKey();
			valores += (k > 0 ? "," : "") + "?";
			k++;
		}

		db.sql = "INSERT INTO " + tabla + "(" + campos + ") VALUES(" + valores + ")";
		db.conectar();
		db.preparar();
		//int i = 0;
		for (Map<String, String> fila : lote) {
			int j = 0;
			for (Map.Entry<String, String> dato : fila.entrySet()) {
				/*if(i==0){
				 campos += (j>0 ? "," : "") + dato.getKey();
				 valores += (j>0 ? "," : "") + "?";					
				 }*/
				db.stmt.setString(j + 1, dato.getValue());
				j++;
			}

//			ps.setString(1, employee.getName());
//			ps.setString(2, employee.getCity());
//			ps.setString(3, employee.getPhone());
			db.stmt.addBatch();
		}

//		ps.executeBatch();
//		ps.close();
//		connection.close();
		db.stmt.executeBatch();
		db.finalizar();
	}
}
