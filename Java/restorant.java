import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class restorant {

	private static String tableName;
	private static ArrayList<String> CIDlist = new ArrayList<String>();
	private static ArrayList<Integer> ratingList = new ArrayList<Integer>();
	
	public static ArrayList<Integer> getRatingList()
	{
		return ratingList;
	}
	
	public static ArrayList<String> getCIDlist()
	{
		return CIDlist;
	}
	
	public static String getTableName()
	{
		return tableName;
	}
	
	public static void setTableName (String table)
	{
		tableName = table;
	}
	
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
		Statement statement = con.createStatement();
		
		System.out.println(statement.toString());

		// Querying a table
		try 
		{
			//REVIEW
			setTableName("REVIEW");
		    String querySQL = "SELECT CID, RATINGS FROM " + getTableName();
		    java.sql.ResultSet rs = statement.executeQuery(querySQL);

		    while (rs.next()) {
		    	String CID = rs.getString(1);
		    	int RATINGS = rs.getInt(2);
		    			    	
		    	getCIDlist().add(CID);
		    	getRatingList().add(RATINGS);
		    }
		    
		} catch (SQLException e) {
			
			int sqlCode = e.getErrorCode(); // Get SQLCODE
			String sqlState = e.getSQLState(); // Get SQLSTATE
	                
			// Your code to handle errors comes here;
			// something more meaningful than a print would be good
			System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
		}
		
		//Calculate Reputation
		Map<String,Integer> computation = calculateReputation(getCIDlist(), getRatingList());
		
		//Insert into Critics
		try {
			setTableName("CRITICS");
			ArrayList<String> keys = new ArrayList<String>(computation.keySet());
			for (String c : keys)
			{
				int value = computation.get(c);
//				System.out.println(value);
				if (value >= 5)
				{
					int reputation = value - 5;
				
					String insertSQL = "INSERT INTO " + getTableName() + " VALUES ('" + c + "'," + reputation +")";
//					System.out.println(insertSQL);
					statement.executeUpdate ( insertSQL ) ;
				}
			}
			
		    System.out.println ( "DONE" ) ;
		    
		} catch (SQLException e)
		{
			int sqlCode = e.getErrorCode(); // Get SQLCODE
			String sqlState = e.getSQLState(); // Get SQLSTATE

			// Your code to handle errors comes here;
			// something more meaningful than a print would be good
			System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
		}
	}

	private static Map<String, Integer> calculateReputation(
			ArrayList<String> cidList, ArrayList<Integer> ratingList) {
		Map<String, Integer> comp = new HashMap<String, Integer>();
		
		int i = 0;
		for (String cid : cidList) {
			int rating = ratingList.get(i);
			if (!comp.containsKey(cid)) {
				rating = (int) (rating * 0.25);
				comp.put(cid, 1 + rating);
			} else
			{
				int count = comp.get(cid);
				rating = (int) (count + (rating*0.25));
				comp.put(cid, rating + 1);
			}
			i++;
		}
		
		return comp;
	}
}