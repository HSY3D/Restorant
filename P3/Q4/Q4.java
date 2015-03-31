import java.sql.*;
import java.lang.System;

public class Q4 {

	private static Statement statement;
	
	public static void main(String[] args) throws SQLException 
	{
		// Register the driver. You must register the driver before you can use it.
		try {
			DriverManager.registerDriver (new com.ibm.db2.jcc.DB2Driver());
		} catch (Exception cnfe){
			System.out.println("Class not found");
		}
		// This is the URL you must use for DB2.
		// Note: This URL may not valid now!
		String url = "jdbc:db2://db2:50000/cs421";
		String username = "cs421g30";
		String password = "jeidjaub";

		Connection con = DriverManager.getConnection (url, username, password);
		statement = con.createStatement();

		System.out.println(statement.toString());
		
		queryTimer();
	}

	private static void queryTimer() throws SQLException 
	{
		try 
		{
			String querySQL = "SELECT C.FIRSTNAME, C.LASTNAME, RE.RESTNAME FROM  CUSTOMERS C, REVIEW R, RESTAURANTS RE WHERE R.RATINGS = 5 AND C.CID = R.CID AND R.RID = RE.RID ORDER BY C.LASTNAME";
			
			 long startTime = System.currentTimeMillis();
			 
			java.sql.ResultSet rs = statement.executeQuery(querySQL);
			
			long endTime = System.currentTimeMillis();

			System.out.println("Time lag: " + (endTime - startTime) + " milliseconds");

		} catch (SQLException e) {
			
			int sqlCode = e.getErrorCode();
			
			String sqlState = e.getSQLState();
			
			System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
		}
	}
}
