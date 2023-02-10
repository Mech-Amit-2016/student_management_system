<%-- 
    Document   : selectrollno
    Created on : Jan 20, 2023, 11:04:38 AM
    Author     : heerawati
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

   // in this program we enter the rollno of student and after submitting we het his/her record from marks table
    
    DriverManager.registerDriver(new OracleDriver());
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="system",password="pass";
Connection connection=DriverManager.getConnection(url, user, password);
PreparedStatement ps;
 boolean ispostback=false;
 if(request.getParameter("check")!=null)
 ispostback=true;

 String rollno="",name=null,physics="",chemistry="",math="";
 if(ispostback){
 rollno=request.getParameter("rollno");
 ps=connection.prepareStatement("select name,physics,chemistry,math from marks where rollno=?");
ps.setString(1,rollno);
 name="";
 physics="";
 chemistry="";
 math="";
ResultSet rs=ps.executeQuery();
if(rs.next()){
    name=""+rs.getObject("name");
    physics=""+rs.getObject("physics");
    chemistry=""+rs.getObject("chemistry");
     math=""+rs.getObject("math");}
 else{
   name="no data found";
}
 }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table><form>
            <input type="hidden" name="check"/>
            <input required type="number" value="<%=rollno%>" name="rollno"/>
            </br>
             <input  type="text" value="<%=name%>" name="name"/>
            <br/>
            <input  type="text" value="<%=physics%>" name="physics"/>
            <br/>
            <input  type="text" value="<%=chemistry%>" name="chemistry"/>
            <br/>
            <input  type="text" value="<%=math%>" name="math"/>
            <br/>
            <input type="submit" value="submit"/>
            </form>
        </table>
    </body>
</html>
