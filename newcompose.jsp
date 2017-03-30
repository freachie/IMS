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
                String id="Vishwas@v2s2mail.com";
                String frm="V2S2Mail";
                String pass="";
                String userid=session.getAttribute("userId").toString();
                pass=session.getAttribute("Pass").toString();
                String sub="Welcome";
                java.util.Date d=new java.util.Date();
                String o=d.toString();
                String date[]=o.split("IST");
                String dd[]=date[1].split(" ");
                date[0]=date[0]+dd[1]; 
                String name[]= userid.split("@");
                int l=name.length;
                
                String msg="Welcome to v2s2mail service.";
                msg=msg+"   You have successfully registered with v2s2mail with userid : ";
                msg=msg+ userid+" and password : "+pass ;
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
                Statement st= conn.createStatement();
                String s="insert into  ";
                s=s+name[0];
                s=s+"(frm,sub,msg,frm_id,date) values('"+frm+"','"+sub+"','"+msg+"','"+id+"','"+date[0]+"')";
                st.executeUpdate(s);
                response.setHeader("refresh","0;url=userhome.jsp");
            }
            catch(Exception e)
            {
                
                %><h1 style="color:#800042"><%out.println("Invalid Entry ");
                response.setHeader("refresh","3;url=register.html");
            }
            
            %>
    </body>
</html>
