<%-- 
    Document   : Selectname
    Created on : Jan 20, 2023, 12:53:02 PM
    Author     : heerawati
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%DriverManager.registerDriver(new OracleDriver());
  String url="jdbc:oracle:thin:@localhost:1521:xe";
  String user="system",password="pass";
  Connection connection=DriverManager.getConnection(url, user, password);
  boolean ispostback=false;
  String name="enter name";
  if(request.getParameter("check")!=null)
  ispostback=true;
  String rollno="",physics="",chemistry="",math="";
  if(ispostback){
      name=request.getParameter("name");
  PreparedStatement ps=connection.prepareStatement("select rollno,physics,chemistry,math from marks where chemistry>=40 and math>=40 and physics>=40 and name=?");
  ps.setString(1,name);
  ResultSet rs=ps.executeQuery();
  if(rs.next()){
      rollno=""+rs.getObject("rollno");
      physics=""+rs.getObject("physics");
      chemistry=""+rs.getObject("chemistry");
      math=""+rs.getObject("math");
  }
  else{
      out.println("no data fund");
  }
  }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>name_wise_querry</title>
    </head>
    <body>
        <form>
            <table>
                <input type="hidden" name="check"/>
                name:<input required type="text" value="<%=name%>" name="name"/>
                <br/>
                rollno:<input  type="text" value="<%=rollno%>" name="rollno"/>
                <br/>
                physics:<input  type="text" value="<%=physics%>" name="physics"/>
                <br/>
                chemistry:<input  type="text" value="<%=chemistry%>" name="chemistry"/>
                <br/>
                math:<input  type="text" value="<%=math%>" name="math"/>
                <br/>
                <input type="submit" value="submit"/>
            </table>
        </form>
    </body>
</html>
