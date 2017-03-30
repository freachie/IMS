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
            
                int c=0;
            try
            {
                String frm="";
                String to="";
                String sub="";
                String toname="";
                String f;
                String from="V2S2Mail";
                String userid=session.getAttribute("userId").toString();
                sub=request.getParameter("sub");
                int l=sub.length();
                if(l==0)
                {
                    sub="no subject";
                }
                
                String number=request.getParameter("number");
                String file=request.getParameter("file");
                String msg=request.getParameter("msg");
                String name[]=userid.split("@");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
                Statement st= conn.createStatement();
                String s="select * from ";
                s=s+name[0];
                s=s+" where index1='"+number+"'";
                String ss="select name from ims where user_id='"+userid+"'";
                ResultSet rs=st.executeQuery(s);
                while(rs.next())
                {
                     toname=rs.getString(1);
                     to=rs.getString(4);
                }
                ResultSet rr=st.executeQuery(ss);
                while(rr.next())
                {
                      frm = rr.getString(1);
                }
                java.util.Date dl=new java.util.Date();
                String o=dl.toString();
                String dated[]=o.split("IST");
                String dd[]=dated[1].split(" ");
                dated[0]=dated[0]+dd[1];
                String nam[]=to.split("@");
                String s1="insert into ";
                
                if(toname.equals(from))
                        {
                            c=2;
                            throw new Exception("You cant reply to this user !");
                        }
                s1=s1+nam[0];
                s1=s1+"(frm,sub,msg,frm_id,date) values('"+frm+"','"+sub+"','"+msg+"','"+userid+"','"+dated[0]+"')";
                st.executeUpdate(s1);
                String g="insert into sent(name,frm,sub,msg,to_id,date) values('"+toname+"','"+name[0]+"','"+sub+"','"+msg+"','"+to+"','"+dated[0]+"')";
                st.executeUpdate(g);
                %><h1 style="color:#800042"><%out.println("Your Message Has Been Successfully Replied ");
                response.setHeader("refresh","3;url=inbox.jsp");
            }
            catch(Exception e)
            {
                if(c==2)
                {
                    %><h1 style="color:#800042"><%out.print(e.getMessage());
                    response.setHeader("refresh","3;url=inbox.jsp");
                }
                else
                {
                %><h1 style="color:#800042"><%out.println("User Doesn't Exist ");
                }
                response.setHeader("refresh","3;url=inbox.jsp");
            }
            
            %>
    </body>
</html>
