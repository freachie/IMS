<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2S2-Mail</title>
        <link rel="stylesheet" href="css/com.css" type="text/css">
       
        <style>
            table
            {
                
                border-collapse: collapse;
                border: 0px solid black;
                width: 110%;
                background-color: gray;
                height: 2%;
                margin-left:-0.98%;
                
            }
            td{
                display:inline-block;
                color:black;
                border-up: 0px solid black;
                width:18%;
                background-color: gray;
                height: 22px;
             }
             td.td1
             {
                width:104%;
                height:0px;
                background-color:black;
                border-collapse: collapse;
                border: 0px dotted gold;
                border-left: 0px dotted black;
                border-up: 0px dotted black;
                border-right: 0px dotted black;
             }
            a{
                text-decoration: none;
                color:azure;
                display:block;
                overflow: :auto;
                
            }
            
            
            </style>
    </head>
    <body style="background-color:gray">
        
        <%
        int count=0;
        try
        {
         String userid=session.getAttribute("userId").toString();
         String name[]=userid.split("@");
         String nam=request.getParameter("name");
         String nn=name[0];
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
         Statement st =conn.createStatement();
         String ex="select *  FROM ";
         ex=ex+nn;
         ex=ex+" WHERE `frm`='";
         ex=ex+nam;
         ex=ex+"' order by index1 desc";
         %><table><%
            ResultSet rr=st.executeQuery(ex);
            while(rr.next())
            {   
                count=1;
                %>
                <tr><td>
                        <% String number=rr.getString(6);
                        out.println(rr.getString(1));%></td>
                        <form action="showmsg.jsp" method="post">
                         </form>
                            
                <td>  <a href="showmsg.jsp?number=<%=number %>"><%out.println(rr.getString(2));%></a></td><td class="td1"></td></tr>
                
               <%
            }
            if(count==0) 
            {
              %><h1 style="color: maroon"><%   out.println("No Mail From This User...!!! "); 
              response.setHeader("refresh","3;url=inbox.jsp");
            }
            %></table><%
        }    
        catch(Exception e)
                                     {
                                         %><h1 style="color:maroon"><%   out.println("Please Login First");
                                         
                                     }         
     %>            
    </body>
</html>
