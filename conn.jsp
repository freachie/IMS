<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2S2 Mail</title>
    </head>
    <body style="background-color:grey">
       <% 
             int c=0;
             try
            {
                 FileInputStream fis=null;
                 PreparedStatement ps;
                 String name=request.getParameter("name"); 
                 String userid=request.getParameter("user_id"); 
                 String pass=request.getParameter("password"); 
                 String cpass=request.getParameter("cpassword"); 
                 String ref_id=request.getParameter("ref_id"); 
                 String  answer=request.getParameter("answer"); 
                 String  bday=request.getParameter("bday"); 
                 String uu[]=userid.split("@");
                 String gmail="v2s2mail.com";
                 int l=uu.length;
                if(uu[l-1].equals(gmail))
                 {
                 }
                 else
                 {
                     c=1;
                     throw new Exception("UserID is wrong....... Please enter ..... example@v2s2mail.com");
                 }
                if(pass.equals(cpass))
                 {
                 }
                 else
                 {
                     c=1;
                     throw new Exception("Password is not found to be confirmed");
                 }
                session.setAttribute("userId", userid);
                session.setAttribute("Pass", pass);
                File img=new File("c:/users/vishwas chauhan/Documents/NetBeansProjects/IMS/build/web/pic.jpg");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
                Statement st=conn.createStatement();
                ps=conn.prepareStatement("insert into ims(name,user_id,pass,cpass,ref_id,answer,bday,photo) values('"+name+"','"+userid+"','"+pass+"','"+cpass+"','"+ref_id+"','"+answer+"','"+bday+"',?)");
                fis=new FileInputStream(img);
                ps.setBinaryStream(1, (InputStream)fis,(int)(img.length()));
                ps.executeUpdate();
                String s="CREATE  TABLE ";
                s=s+uu[0];
                s=s+"(frm varchar(30),sub varchar(60),msg varchar(1600),frm_id varchar(30),date varchar(30),index1 INT  AUTO_INCREMENT ,PRIMARY KEY (`index1`))";
                st.executeUpdate(s);
                %>
                <h1>Successfully Registered</h1>
                <%
                response.setHeader("refresh","2;url=newcompose.jsp");
                 
              }
            catch(Exception e)
               {
                %><h1 style="color:green">   <%
                   if(c==1)
                out.println(e.getMessage());
                   else      
                %><h1 style="color:green"> User Already Exist....<br>Please Try Again With  Another UserID <% 
                response.setHeader("refresh","3;url=register.html");
               }
    %>    
    
    </body> 
</html>
