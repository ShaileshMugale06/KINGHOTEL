


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
                 String query = "DELETE FROM customer_details WHERE id = ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                
                pstmt.setString(1,request.getParameter("cid"));        
                pstmt.executeUpdate();
                
             
                out.print("<script>");
                out.print("alert('Details Added Successfully')");
                out.print("locations=customer_handle.jsp");
                out.print("</script>");

                
                out.print("Success");
                response.sendRedirect("customer_handle.jsp");  
            }
            catch(Exception e) {
                out.println(e.getMessage());
            }
        %>
    </body>
</html>
