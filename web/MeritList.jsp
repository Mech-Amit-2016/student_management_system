<%-- 
    Document   : MeritList
    Created on : Jan 19, 2023, 12:59:30 PM
    Author     : heerawati
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //in this programm we get the merit list of student from marks table
    
    
    DriverManager.registerDriver(new OracleDriver());
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="system",password="pass";
Connection connection=DriverManager.getConnection(url, user, password);
 PreparedStatement ps=connection.prepareStatement("select rollno,name,physics+chemistry+math as total from marks where physics >=40 and chemistry>=40 and math>=40 order by physics+chemistry+math desc");
 ResultSet rs=ps.executeQuery();
 String rollno="";
 String name="";
 String total="";
 %>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tr><td>rollno</td><td>name</td><td>total</td></tr>
           <%     while(rs.next()){
               rollno=""+rs.getObject("rollno");
               name=""+rs.getObject("name");
               total=""+rs.getObject("total");%>
            <tr><td><%=rollno%></td><td><%=name%></td><td><%=total%></td>
          <%     
           }          
           %>            
        </table>
    </body>
</html>
