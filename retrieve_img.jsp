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
            tr,td
            {
               height: 10px;
               width: 10px; 
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
               String userid=session.getAttribute("userId").toString();
               Class.forName("com.mysql.jdbc.Driver");
               conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
               Statement st=conn.createStatement();
               PreparedStatement ps=conn.prepareStatement("select photo from ims where user_id='"+userid+"'");
               ResultSet rs=ps.executeQuery();
               while(rs.next())
               {
                   byte []bytearray=new byte[4096];
                   int size=0;
                   InputStream image1;
                   image1 = rs.getBinaryStream(1);
                   response.reset();
                   response.setContentType("image/jpeg");
                   response.addHeader("Content-Disposition","fileName=collage.jpg");
                   while((size=image1.read(bytearray))!=-1)
                   {
                       response.getOutputStream().write(bytearray,0,size);
                       
                   }
                   response.flushBuffer();
                   image1.close();
                   rs.close();
                   
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
