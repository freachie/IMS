<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2S2-Mail</title>
        <style>
            div.d2
            {
                height: 50px;
                width: 50px;
            }
            td
            {
               height: 100px;
               width: 100px; 
            }
        </style>
    </head>
    <body>
        <div class="d2">
        <table>
            <tr><td>
        <% 
            Connection conn=null;
            try
            {
               Class.forName("com.mysql.jdbc.Driver");
               conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
               Statement st=conn.createStatement();
               PreparedStatement ps=conn.prepareStatement("select * from photo");
               ResultSet rs=ps.executeQuery();
               while (rs.next())
               {
                   out.print(rs.getString(1)+" : ");out.print(rs.getString(2)+" : ");
               }
               out.println("Succesfully retrieved");
               conn.close();
               
            }
            catch(Exception e)
            {
                out.println(e);
            }
            %>
                </td></tr></table></div>
    </body>
</html>
