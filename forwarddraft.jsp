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
                String msg="";
                String frm="";
                String to="";
                String sub="";
                String frr="";
                String userid=session.getAttribute("userId").toString();
                String number=request.getParameter("number");
                to=request.getParameter("to");
                sub=request.getParameter("sub");
                String t[]=to.split("@");
                String d="select * from draft where index1='"+number+"'";
                String name[]=userid.split("@");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
                Statement st= conn.createStatement();
                ResultSet rs=st.executeQuery(d);
                while(rs.next())
                {
                    if(sub.length()==0)
                    {  
                        sub=rs.getString(3);
                    }
                     msg=rs.getString(2);
                }
                String dh="select name from ims where user_id='"+userid+"'";
                ResultSet e=st.executeQuery(dh);
                while(e.next())
                {
                     frr=e.getString(1);
                }
                
                String hh="select name from ims where user_id='"+to+"'";
                ResultSet rr=st.executeQuery(hh);
                while(rr.next())
                {
                    frm=rr.getString(1);
                }
                
                java.util.Date dl=new java.util.Date();
                String o=dl.toString();
                String dated[]=o.split("IST");
                String dd[]=dated[1].split(" ");
                dated[0]=dated[0]+dd[1];
                String s="insert into  ";
                s=s+t[0];
                s=s+"(frm,sub,msg,frm_id,date) values('"+frr+"','"+sub+"','"+msg+"','"+userid+"','"+dated[0]+"')";
                if(frm.length()!=0)
                {
                st.executeUpdate(s);
                }
                if(frm.length()==0)
                {
                    frm="(Unknown)";
                } 
                String g="insert into sent(name,frm,sub,msg,to_id,date) values('"+frm+"','"+name[0]+"','"+sub+"','"+msg+"','"+to+"','"+dated[0]+"')";
                st.executeUpdate(g);
                 
                %><h1 style="color:#800042"><%out.println("Successfully Forwarded ");
                response.setHeader("refresh","3;url=inbox.jsp");
            }
            catch(Exception e)
            {
                out.println(e.getMessage());
                %><h1 style="color:#800042"><%out.println("User Doesn't Exist ");
                response.setHeader("refresh","3;url=inbox.jsp");
            }
            
            %>
    </body>
</html>
