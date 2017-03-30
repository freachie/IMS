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
    <body>
        <%
            try
            {
                FileInputStream fis=null;
                String frm=request.getParameter("name");
                String userid=session.getAttribute("userId").toString();
                String file=request.getParameter("file");
                File img=new File("c:/users/vishwas chauhan/Desktop/"+file+"");
                String setlimit = "SET GLOBAL max_allowed_packet=104857600;";
                String name[]=frm.split("@");
                frm=name[0];
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
                Statement st= conn.createStatement();
                st.executeQuery(setlimit);
                out.println(frm);
                PreparedStatement ps=conn.prepareStatement("insert into photo values(?,?)");
                fis=new FileInputStream(img);
                ps.setBinaryStream(1, (InputStream)fis,(int)(img.length()));
                ps.setString(2,frm);
                int count=ps.executeUpdate();
                if(count>0)
                {
                   %><h1 style="font-family: cursive"><%out.print("successfully Sent");
                   response.setHeader("refresh","1;url=show.jsp");
                }
                else
                {
                    out.print("error found");
                }
            }
            catch(Exception e)
            {
                %><h1 style="color:#800042"><%out.println("User Doesn't Exist ");
                response.setHeader("refresh","3;url=compose.jsp");
            }
            
            %>
    </body>
</html>
