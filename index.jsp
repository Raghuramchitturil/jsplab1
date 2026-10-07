 <%@ page import="java.sql.Connection" %>
 <%@ page import="java.sql.Statement" %>
 <%@ page import="java.sql.ResultSet" %>
 <%@ page import="java.sql.DriverManager" %>

 <!DOCTYPE html>
 <html>
 <head><title>JSPLAB2</title></head>
 <body>
 <table border="1">
 <tr>
 <th>ID</th>
 <th>NAME</th>
 <th>MARKS</th>
 </tr>
 <%
 Connection con = null;
 Statement st = null;
 ResultSet rs = null;
 try {
     Class.forName("com.mysql.cj.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","svist@123");
     st = con.createStatement();
     rs = st.executeQuery("SELECT * FROM csef");
     while(rs.next()){
 %>
 <tr>
 <td><%= rs.getInt("id") %></td>
 <td><%= rs.getString("name") %></td>
 <td><%= rs.getInt("marks") %></td>
 </tr>
 <%
     }
 } catch(Exception e){
     out.println("Error: " + e.getMessage());
 } finally {
     if(rs != null) rs.close();
     if(st != null) st.close();
     if(con != null) con.close();
 }
 %>
 </table>
 </body>
 </html>
