/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cirugias;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

/**
 *
 * @author Nino
 */
public class mysql {
	protected static Connection con = null;
	protected static Statement stmt = null;
	public static ResultSet rs = null;
	protected static String sql = null;
	
	protected static void conectar(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			mysql.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cirugia4","root","1234");
			//stmt = con.createStatement();
			
		}catch(SQLException e){
			
		}catch(ClassNotFoundException e){
			
		}		
	}
	
	public static void ejecutar(String sql) throws SQLException{
		mysql.sql = sql;
		mysql.conectar();
//		mysql.con.
		mysql.stmt = mysql.con.createStatement();
		mysql.rs = mysql.stmt.executeQuery(sql);
//		mysql.stmt.close();
//		mysql.con.close();
	}
	
	public static void finalizar() throws SQLException{
		mysql.rs.close();
		mysql.stmt.close();
		mysql.con.close();
	}
}
