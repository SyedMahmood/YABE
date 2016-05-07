<%-- 
    Document   : Signup
    Created on : Apr 8, 2016, 9:58:18 PM
    Author     : syedmahmood, Murtala Aliyu
--%>

<!DOCTYPE html>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>

<html>
    <head>
        <title>Signup Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
    
         <!-- jsp code start -->
         <%
         Connection connection = null;
  //       try {
        	 Class.forName("com.mysql.jdbc.Driver").newInstance();
        	 connection = DriverManager.getConnection("JDBC:mysql://127.0.0.1/proj2016","root","WeHearKK290");
         /*}
         catch(Exception e){
        	 System.out.print("<p>Could not connect to SQL server.</p>");
        	 e.printStackTrace(System.out);
        	 }*/

         String fullname = request.getParameter("Fullname");
         String username = request.getParameter("Username");
         String password = request.getParameter("Password");
         String email = request.getParameter("Email");
         String gender = request.getParameter("Gender");
         
         	String temp_age = request.getParameter("Age");
 			int age = 0;
 			if (request.getParameter("Age") != null) {
	 			try {
	 				age = Integer.parseInt(request.getParameter("Age"));
	 			} catch (Exception e) {
	 				out.println("Start price is invalid. Please try again.");
	 			}
 			}
 			int account_id = 0;
 			if (request.getParameter("Username") != null) {
 				try {
 					account_id = request.getParameter("Username").hashCode();
 				} catch (Exception e) {
 				
 				}
 			}
         if (fullname != null && username != null && password != null && email != null && gender != null) {
        	 Statement st = connection.createStatement();
        	 String query = "INSERT INTO users (account_id, fullname, username, password, email, gender, age) VALUES (\'" + account_id + "\', \'" + fullname + "\', \'" + username + "\', \'" + password + "\', \'" + email + "\', \'" + gender + "\', \'" + age + "\')";
        	 int sum = st.executeUpdate(query);
        	 Statement stmt = connection.createStatement();
        	 stmt.executeUpdate("INSERT INTO customer_rep VALUES (" + account_id + ") ");
        	 st.close();
         }
         
            connection.close();
            %>
   		<!-- jsp code stop -->
    
    
    
    
    <!-- HTML code start -->
    	<form action="signup.jsp" method = "post">
        	<p>Full name
            <input type="text" name="Fullname" value="" />
            </p>
            <p>Username
            <input type="text" name="Username" value="" />
            </p>
            <p>Password
            <input type="text" name="Password" value="" />
            </p>
            <p>Email
            <input type="text" name="Email" value="" />
            </p>
            <p>Gender
            <input type="text" name="Gender" value="" />
            </p>
            <p>Age
            <input type="text" name="Age" value="" />
            </p>
            <input type ="submit" value ="Signup">
     </form>
    <!-- HTML code stop -->
    </body>
</html>
