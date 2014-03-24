package cirugias;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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
	
	protected static void conectar(){
		try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } 
		try {
			
			db.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cirugia4","root","1234");
		} catch (SQLException ex) {
			// handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
	}
	
	protected static void preparar() throws SQLException{
		db.stmt = db.conn.prepareStatement(db.sql, Statement.RETURN_GENERATED_KEYS);
	}
	
	public static void ejecutar(String sql, List<String> data) throws SQLException{
		db.sql = sql;
		db.data = data;
		db.conectar();
		db.preparar();
		db.setParams();
		db.stmt.execute();
		
		if(sql.toLowerCase().contains("INSERT".toLowerCase())){
			ResultSet keys = db.stmt.getGeneratedKeys();
			keys.next();
			db.insertId = keys.getString(1);		
		} else{
			db.rs = db.stmt.getResultSet();
		}
		
	}

	private static void setParams() throws SQLException {
		if(db.data != null){
			int dataSize = db.data.size();
			for(int i=0;i<dataSize;i++){
				db.stmt.setString(i+1, db.data.get(i));
			}
		}
	}
	
	public static void finalizar() throws SQLException{
		db.rs.close();
		db.stmt.close();
		db.conn.close();
	}
	
//	public static String lastInsertId() throws SQLException{
//		db.ejecutar("SELECT LAST_INSERT_ID() AS id", null);
//		db.rs.next();
//		return db.rs.getString("id");
//	}
}
