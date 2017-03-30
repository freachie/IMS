<%@page import="java.nio.file.Files"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Image"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2S2-Mail</title>
    </head>
    <body style="background-color:gray">
        <%
                int c=0;
                FileInputStream fis=null;
                Connection conn=null;
                PreparedStatement ps=null;
                ResultSet rs=null;
                String ph;
            try
            {
                String userid=session.getAttribute("userId").toString();
                String photo=request.getParameter("photo");
                String temp = new String(photo);
                temp.toLowerCase();
                if(temp.endsWith(".jpg")||temp.endsWith(".png")||temp.endsWith(".jpeg")||temp.endsWith(".gif")||temp.endsWith(".ico")||
                    temp.endsWith(".JPG")||temp.endsWith(".PNG")||temp.endsWith(".JPEG")||temp.endsWith(".GIF")||temp.endsWith(".ICO")    )
                {}
                else
                {
                    c=1;
                    throw new Exception("Selected File Is Not an Image");
                }
                
                File img=new File("C:\\Users\\vishwas chauhan\\Desktop\\Uploaded\\"+photo);
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
                ps=conn.prepareStatement("UPDATE ims SET photo=? WHERE user_id='"+userid+"'");
                fis=new FileInputStream(img);
                ps.setBinaryStream(1, (InputStream)fis,(int)(img.length()));
                int count=ps.executeUpdate();
                if(count>0)
                {
                   %><h1 style="font-family: cursive"><%out.print("successfully Uploaded");
                   response.setHeader("refresh","2;url=userhome.jsp");
                }
                else
                {
                    out.print("error found");
                }
         
            }
            catch(Exception e)
            {
              %><h1 style="color: darkred"><%  if(c==1)
                out.println(e.getMessage());
                else
              {
                  
                out.println("Selected File Is Not Found To Be Appropriate .....");
                out.print("Please Try Again");
                response.setHeader("refresh","3;url=photo.jsp");
              }
            }
        %>
        
    </body>
</html>
