<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2S2-Mail</title>
        <link rel="stylesheet" href="css/com.css" type="text/css">
        <script>
function myFunction()
{
document.getElementById("myDropdown").classList.toggle("show");
}
function filterFunction()
{
var input,filter,ul,li,a,i;
input=document.getElementById("myinput");
filter=input.value.toUpperCase();
div=document.getElementById("myDropdown");
a=div.getElementsByTagName("a");
for(i=0;i<a.length;i++)
 {
 if(a[i].innerHTML.toUpperCase().indexOf(filter)>-1)
	{
	a[i].style.display="";
	}
	else
	{
	a[i].style.display="none";
	}
  }
}
</script>
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
                width:49%;
                background-color: gray;
                height: 22px;
             }
             td.td1
             {
                width:104%;
                height:0px;
                background-color:#85592e;
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
    <body style="background-color:gray;color: indigo">
        <h2>Saved Mails</h2>
        <%
        
        try
        {
         String userid=session.getAttribute("userId").toString();
         String name[]=userid.split("@");
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
         Statement st =conn.createStatement();
         String ex="select * from draft where userid='";
         ex=ex+userid;
         ex=ex+"' order by index1 desc";
         
            %>
            
</div>
</div> <table><%
            ResultSet rr=st.executeQuery(ex);
            while(rr.next())
            {   
                %>
                <tr><td>
                        <%String number=rr.getString(4); 
                        %><a href="showdraft.jsp?number=<%=number %>"><% out.println("Sub : "+rr.getString(3));%></a></td>
                        <form action="showmsg.jsp" method="post">
                         </form>
                            
                <td class="td1"></td></tr>
                
               <%
            }%></table><%
        }    
        catch(Exception e)
                                     {
                                         
                                         %><h1 style="color:goldenrod"><% out.println("Please Login ");
                                     }         
     %>            
    </body>
</html>
