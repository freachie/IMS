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
                String frm="";
                String userid=session.getAttribute("userId").toString();
                String sub=request.getParameter("sub");
                String file=request.getParameter("file");
                String msg=request.getParameter("msg");
                String name[]= userid.split("@");
                java.util.Date d=new java.util.Date();
                String o=d.toString();
                String dated[]=o.split("IST");
                String dd[]=dated[1].split(" ");
                dated[0]=dated[0]+dd[1];
                if(sub.length()==0)
                {
                    sub="(No Subject)";
                }
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
                Statement st= conn.createStatement();
                String ss="insert into draft(userid,msg,sub,date) values('"+userid+"','"+msg+"','"+sub+"','"+dated[0]+"')"; 
                st.executeUpdate(ss);
                
                %><h1 style="color:#800042"><%out.println(" Successfully saved in draft ");
                response.setHeader("refresh","3;url=inbox.jsp");
            }
            catch(Exception e)
            {
                  out.println(e);
                %><h1 style="color:#800042"><%out.println("User Doesn't Exist ");
                response.setHeader("refresh","30;url=compose.jsp");
            }
            
            %>
    </body>
</html>
