<%-- 
    Document   : details
    Created on : 9 Feb, 2024, 8:00:11 PM
    Author     : mugal
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>King Hotel</title>
    </head>
    <body> 
        <% 
            try{
                String url = "jdbc:mysql://db-kinghotel.cvuumgqqw687.ap-south-1.rds.amazonaws.com:3306/?user=root";
	        String user = "root";
		String pass = "shailu5988";

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, pass);
                 String query = "INSERT INTO customer_details (customer_name, phone_number, email, departure_date, arrival_date, room_type, number_of_guest) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = con.prepareStatement(query);
                
                pstmt.setString(1,request.getParameter("Name")+request.getParameter("Name1"));
                pstmt.setString(2,request.getParameter("Phone no"));
                pstmt.setString(3,request.getParameter("email"));
                pstmt.setString(4,request.getParameter("Text1"));
                 pstmt.setString(5,request.getParameter("Text"));
                pstmt.setString(6,request.getParameter("room_type"));
                pstmt.setString(7,request.getParameter("guest_no"));
                
                pstmt.executeUpdate();
                
             
                out.print("<script>");
                out.print("alert('Details Added Successfully')");
                out.print("locations='Form.html");
                out.print("</script>");

                
                out.print("Success");
                response.sendRedirect("Form.html");  
            }
            catch(Exception e) {
                out.println(e.getMessage());
            }
        %>
    </body>
</html>
