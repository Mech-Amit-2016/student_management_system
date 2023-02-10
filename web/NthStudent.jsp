

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // in this programm we get the nth student from merit list 
    
    DriverManager.registerDriver(new OracleDriver());
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="system",password="pass";
String position="";
String rollno="";
String name="";
String physics="";
String chemistry="";
String math="",total="",percent="";
Connection connection=DriverManager.getConnection(url, user, password);
PreparedStatement ps;
 boolean ispostback=false;
 if(request.getParameter("check")!=null)
 ispostback=true;
 if(ispostback)
 {
 position=request.getParameter("position");
 int p1=Integer.parseInt(position);
 int p2=p1-1;
 ps=connection.prepareStatement("select rownum,rollno,name,physics,chemistry,math,physics,total,percent from (select rollno,name,physics,chemistry,math,physics+math + chemistry as total,round((physics+chemistry + math)/3,2) as percent from marks order by physics+math + chemistry desc ) where rownum<=? minus select rownum,rollno,name,physics,chemistry,math,physics,total,percent from (select rollno,name,physics,chemistry,math,physics+math + chemistry as total,round((physics+chemistry + math)/3,2) as percent from marks order by physics+math + chemistry desc ) where rownum<=?");
 ps.setString(1, "" + p1);
 ps.setString(2, "" + p2);
 ResultSet rs=ps.executeQuery(); 
  if(rs.next())
  { rollno=""+rs.getObject("rollno");
     name=""+rs.getObject("name");
     physics=""+rs.getObject("physics");
     chemistry=""+rs.getObject("chemistry");
     math=""+rs.getObject("math");
     total=""+rs.getObject("total");
     percent=""+rs.getObject("percent");
  }
 else
      out.println("not found");
 }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <input type="hidden" name="check"/>
            position:<input type="number" value="<%=position%>" name="position"/>
            </br>
            <input type="submit" value="submit"/>
            <h1>:rollno<%=rollno%></h1>
             <h1>:name<%=name%></h1>
              <h1>:physics<%=physics%></h1>
               <h1>:chemistry<%=chemistry%></h1>
                <h1>:math<%=math%></h1>
                <h1>:total<%=total%></h1>
                <h1>:percent<%=percent%></h1>
        </form>
    </body>
</html>
