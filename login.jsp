<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2S2-Mail</title>
    </head>
    <body>
       <%
           try
           {%>
           <form action="userhome.jsp" method="post">   
               <%
         String username=request.getParameter("Username");
         %></form>
         <%
         String pass=""+request.getParameter("pass");
         session.setAttribute("userId", username);
         Class.forName("com.mysql.jdbc.Driver");
              Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
              PreparedStatement ps=conn.prepareStatement("select user_id,pass from ims where user_id='"+username+"'");
              ResultSet rs=ps.executeQuery();
              if(rs.next())
              {
                  
                  String passw=""+rs.getString(2);
                   if(passw.equals(pass))
                    response.setHeader("refresh","0;url=userhome.jsp");
                   else
                     throw new Exception("I P");
              }
              else
              {
                 response.setHeader("refresh","2;url=st1.html");
              }
           }
           catch(Exception e)
           {
               response.setHeader("refresh","3;url=st1.html");
           }
       %> 
    </body>
</html>
