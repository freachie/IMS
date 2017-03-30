<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
                String toname="";
                String userid=session.getAttribute("userId").toString();
                String sub=request.getParameter("sub");
                MultipartRequest m=new MultipartRequest(request,"C:\\Users\\vishwas chauhan\\Desktop\\Uploaded");
                File f=m.getFile("photo" );
                String img=f.getName();
                File im=new File("C:\\Users\\vishwas chauhan\\Desktop\\Uploaded\\"+img);
                out.print(f);
                
                if(sub.length()==0)
                {
                    sub="(No-Subject)";
                }
                File file=m.getFile("attach");
                String msg=request.getParameter("msg");
                String to=request.getParameter("tosend");
                String name[]= to.split("@");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
                Statement st= conn.createStatement();
                String ss="select name from ims where user_id='"+userid+"'";
                String sss="select name from ims where user_id='"+to+"'"; 
                ResultSet rs=st.executeQuery(ss);
                while(rs.next())
                {
                    frm=rs.getString(1);
                }
                ResultSet rr=st.executeQuery(sss);
                while(rr.next())
                {
                    toname=rr.getString(1);
                }
                java.util.Date d=new java.util.Date();
                String o=d.toString();
                String dated[]=o.split("IST");
                String dd[]=dated[1].split(" ");
                dated[0]=dated[0]+dd[1];
                String ff[]=userid.split("@");
                String s="insert into  ";
                s=s+name[0];
                 s=s+"(frm,sub,msg,frm_id,date) values('"+frm+"','"+sub+"','"+msg+"','"+userid+"','"+dated[0]+"')";
                st.executeUpdate(s);
                 String g="insert into sent(name,frm,sub,msg,to_id,date) values('"+toname+"','"+ff[0]+"','"+sub+"','"+msg+"','"+to+"','"+dated[0]+"')";
                 st.executeUpdate(g);
                %><h1 style="color:#800042"><%out.println("Message Successfully sent ");
                response.setHeader("refresh","3;url=inbox.jsp");
            }
            catch(Exception e)
            {
                %><h1 style="color:#800042"><%out.println("Something went wrong Please try again");
                response.setHeader("refresh","3;url=compose.jsp");
            }
            
            %>
    </body>
</html>
