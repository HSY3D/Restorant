import java.sql.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;


public class Q3 {

	private static Statement statement;
	private static Scanner scanIn = new Scanner(System.in);

	public static void main(String[] args) throws SQLException
	{
		/* Register the driver */
		try {
			DriverManager.registerDriver (new com.ibm.db2.jcc.DB2Driver());
		} catch (Exception cnfe){
			System.out.println("Class not found");
		}

		String url = "jdbc:db2://db2:50000/cs421";
		String username = "cs421g30";
		String password = "jeidjaub";

		Connection con = DriverManager.getConnection (url, username, password);
		statement = con.createStatement();

		System.out.println(statement.toString());

		start();
	}

	public static void homepage() {
		System.out.println("Welcome to RestoRant");
		System.out.println("================================================");
		int choice = printOptions(new String[] { "Enter", "Quit" });
		if (choice == 1) { // Enter
			mainMenu();
		} else if (choice == 2) { // Quit
			System.out.println("Thank you for using RestoRant");
			scanIn.close();
			System.exit(0);
		}
		mainMenu();
	}

	public static void mainMenu() {
		System.out.println("\n\n");
		System.out.println("================================================");
		System.out.println("Main Menu");
		
		while(true) {
			System.out.println("================================================");
			
			int choice = printOptions(new String[] { "Restaurant Reviews",
					"Filter by Price","Search by cuisine and service", "Add a new review","Update restoraunt pricebracket","Quit" });
			if (choice == 1) { // Look up whether a reviewer has reviewed a certain restaurant by reviewer ID.
				Cquery1();
			} else if (choice == 2) { // Filter by price bracket
				Cquery2();
			} else if (choice == 3) { // Search by cuisine, rating, and service
				Cquery3();
			} else if (choice == 4) { // Add a new customer/reviewer
				Cquery4();
			} else if (choice == 5) { // Increase the reputation of critics who have more than 3 reviews
				Cquery5();
			}
			else if (choice == 6) { // Quit
				System.out.println("Bon appetite!");
				scanIn.close();
				System.exit(0);
			}
		}
	}

/*

- Look up whether a reviewer has reviewed a certain restaurant by reviewer ID.
- Given a price bracket P return a list of all the restaurants of that price bracket or lower (filterByPrice)
- Given a cuisine, rating and a service return a list of all restaurants that meet the specifications
- Add a new customer/reviewer 
- Increase the reputation of critics who have more than 3 reviews
- Quit

*/

	public static void Cquery1() {

		System.out.println("================================================================================");
		System.out.println("\t Look up whether a reviewer has reviewed a certain restaurant by reviewer ID.");
		System.out.println("=================================================================================");
		System.out.println("Please enter the Customer ID (CID)");
		String CID = scanIn.next();
		scanIn.nextLine();
		System.out.println("Please enter the restaurant name");
		String restoName = scanIn.nextLine();
		// scanIn.nextLine();
		
		
		query1(CID, restoName);

	}
	public static void Cquery2() {

		System.out.println("================================================================================================");
		System.out.println("\t Given a price bracket return a list of all the restaurants of that price bracket or lower.");
		System.out.println("=================================================================================================");
		System.out.println("Choose a price bracket: $, $$, $$$");
		String price = scanIn.next();
		Map<String, String> results = query2(price);

	}

	public static void Cquery3() {

		System.out.println("==============================================================================================");
		System.out.println("\t Given a cuisine and a service return a list of all restaurants that meet the specifications");
		System.out.println("==============================================================================================");
		
		System.out.println("Enter the cuisine of preference");
		String cuisine = scanIn.next();
		System.out.println("Enter the services desired: Dine In, Takeout, BYOD, Delivery");
		System.out.println("(e.g. S1010 for Dine In and BYOD restaurants)");
		String service = scanIn.next();

		ArrayList<String> results = query3(service, cuisine);

	}

	public static void Cquery4() {

		System.out.println("==============================================================================================");
		System.out.println("\t Add a new customer/reviewer");
		System.out.println("==============================================================================================");
		System.out.println("Enter the customer ID (CID)");
		String CID = scanIn.next();
		scanIn.nextLine();
		System.out.println("Enter the restaurant name");
		String restName = scanIn.nextLine();
		String RID = query4b(restName);
		// scanIn.nextLine();
		System.out.println("Please rate the restaurant from 1-5");	
		int rating = scanIn.nextInt();
		scanIn.nextLine();
		System.out.println("Write your review of the restaurant");	
		String review = scanIn.nextLine();
		query4(CID, RID, review, rating);
		
	}

	public static void Cquery5() {

		System.out.println("==============================================================================================");
		System.out.println("\t Update the price bracket of a restaurant");
		System.out.println("==============================================================================================");
		scanIn.nextLine();
		System.out.println("Enter the name of the restaurant you would like to update");
		String restoName = scanIn.nextLine();
		System.out.println("Enter the new price bracket of " + restoName);
		String newPrice = scanIn.next();
		query5(newPrice, restoName);

	}

	
	
	public static int printOptions(String[] options) {
		System.out.println("\nWhat do you want to do?");
		for (int i = 0; i < options.length; i++) {
			System.out.println((i + 1) + ".\t" + options[i]);
		}

		int result = 0;
		while (!(result > 0 && result <= options.length)) {
			System.out.print("Choice: ");
			result = scanIn.nextInt();
		}
		return result;
	}
	
	public static void start() {
		homepage();
	}

	public static void query1 (String CID, String restorauntName)
	{
		try 
		{
			String querySQL = "SELECT R1.RESTNAME FROM REVIEW R2, RESTAURANTS R1 WHERE R2.CID = '" + CID + "' AND R1.RESTNAME = '" + restorauntName + "' AND R1.RID = R2.RID";
			
			System.out.println(querySQL);
			
			java.sql.ResultSet rs = statement.executeQuery(querySQL);

			// while (rs.next())
			// {
			// 	String r = rs.getString(1);
			// 	System.out.println(r);
			// }

			if (!rs.next())
			{
				System.out.println("No.");
			} else {
				System.out.println("Yes.");
			}

		} catch (SQLException e) {

			int sqlCode = e.getErrorCode();

			String sqlState = e.getSQLState();

			System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
		}
	}
	
	public static Map<String, String> query2 (String priceBracket)
	{
		Map<String, String> restoPrice = new HashMap<String, String>();
		
		try 
		{
			String querySQL = "SELECT R.RESTNAME, PRICEBRACKET FROM RESTAURANTS R WHERE R.PRICEBRACKET <= '" + priceBracket + "' ORDER BY PRICEBRACKET";

			java.sql.ResultSet rs = statement.executeQuery(querySQL);

			while (rs.next()) {
				String restName = rs.getString(1);
				priceBracket = rs.getString(2);
				
				restoPrice.put(restName, priceBracket);
			}

			Iterator iterator = restoPrice.keySet().iterator();
			  
			while (iterator.hasNext()) {
			   String key = iterator.next().toString();
			   String value = restoPrice.get(key).toString();
			  
			   System.out.println(key + ", " + value);
			}

		} catch (SQLException e) {

			int sqlCode = e.getErrorCode();

			String sqlState = e.getSQLState();

			System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
		}
		
		return restoPrice;
	}
	
	@SuppressWarnings("null")
	public static ArrayList<String> query3 (String service, String cuisine)
	{
		ArrayList<String> restName = new ArrayList<String>();
		
		try 
		{
			String querySQL = "SELECT R.RESTNAME FROM RESTAURANTS R, SERVICES S, MENU M WHERE S."+service+" = 1 AND S.SID = R.SID AND M.CUISINE = '"+cuisine+"' AND M.RID = R.RID";
			System.out.println(querySQL);
			java.sql.ResultSet rs = statement.executeQuery(querySQL);
			
			while (rs.next()) {
				restName.add(rs.getString(1));
			}

			for (String s : restName) {
				System.out.println(s);
			}

		} catch (SQLException e) {

			int sqlCode = e.getErrorCode();

			String sqlState = e.getSQLState();

			System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
		}
		
		return restName;
	}
	
	public static void query4 (String CID, String RID, String review, int rating)
	{
		int reviewCount = 1;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		try 
		{
			String querySQL = "SELECT REVIEWID FROM REVIEW";

			java.sql.ResultSet rs = statement.executeQuery(querySQL);

			while (rs.next()) {
				reviewCount ++;
			}

		} catch (SQLException e) {

			int sqlCode = e.getErrorCode();

			String sqlState = e.getSQLState();

			System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
		}
		
		try {
				
			String insertSQL = "INSERT INTO REVIEW VALUES ('RV"+reviewCount+"'	,'"+CID+"'	,'"+RID+"'	,'"+review+"'	,"+rating+",'"+dateFormat.format(date)+"'	)";
			System.out.println(insertSQL);
			statement.executeUpdate ( insertSQL ) ;
		    System.out.println ( "DONE" ) ;
		    
		} catch (SQLException e) {

			int sqlCode = e.getErrorCode();

			String sqlState = e.getSQLState();

			System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
		}
	}
	
	public static String query4b (String restName)
	{
		String RID = null;
		
		try {
			String querySQL = "SELECT RID FROM RESTAURANTS WHERE RESTNAME = '" + restName + "'";

			java.sql.ResultSet rs = statement.executeQuery(querySQL);

			while (rs.next()) {
				RID = rs.getString(1);
			}
		    
		} catch (SQLException e) {

			int sqlCode = e.getErrorCode();

			String sqlState = e.getSQLState();

			System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
		}
		
		return RID;
	}
	
	public static void query5 (String priceBracket, String restName)
	{
		try {
			String updateSQL = "UPDATE RESTAURANTS SET PRICEBRACKET = '"+priceBracket+"' WHERE RID IN (SELECT R.RID FROM RESTAURANTS R WHERE R.RESTNAME= '"+restName+"')";
			System.out.println(updateSQL);
			statement.executeUpdate(updateSQL);
			System.out.println("DONE");

		} catch (SQLException e) {

			int sqlCode = e.getErrorCode();

			String sqlState = e.getSQLState();

			System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
		}
	}

	
}