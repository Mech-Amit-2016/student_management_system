
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.driver.OracleDriver"%> 
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //in this programm we add a student record in the marks table in databas system
    
    
    DriverManager.registerDriver(new OracleDriver());
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="system",password="pass";
Connection connection=DriverManager.getConnection(url, user, password);
PreparedStatement ps;
boolean ispostback=false;
if(request.getParameter("check")!=null)
  ispostback=true;
 String rollno="",name="",physics="",chemistry="",math="";
if(ispostback){
    ps=connection.prepareStatement("insert into marks values(?,?,?,?,?)");
    ps.setString(1,request.getParameter("rollno"));
    ps.setString(2,request.getParameter("name"));
    ps.setString(3,request.getParameter("physics"));
    ps.setString(4,request.getParameter("chemistry"));
    ps.setString(5,request.getParameter("math"));
    int  result=ps.executeUpdate();
    System.out.println(result+"record added");
}
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>get marks details</title>
    </head>
    
    
        <input type="hidden" name="check"/>
        rollno<input required type="number"  name="rollno"/>
        <br/>
        name<input  required type="text" name="name"/>
        <br/>
        physics<input required type="number"  name="physics"/>
        <br/>
        chemistry<input required type="number"  name="chemistry"/>
        <br/>
        maths<input required type="number"  name="math"/>
        <br/>
        <input type="submit" value="addDetails"/>
    
    
</html>
