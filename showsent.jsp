<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2S2-Mail</title>
        <style>
            .dv1
            {
                border: 0px solid black;
                height: 640px;
                width:100.5%;
                background:lightcyan;
                font-family: cursive;
                text-align: center;
                font-size: larger;
            }
            .indiv
            {
               
                border: 0px solid black;
                height: 40px;
                text-align:left;
                font-size:xx-large;
                background-color:gainsboro;
                font-family:inherit;
                color:chocolate;
                
            }
            .inside
            {
                display: inline-block;
                float:left;
                width:65%;
                color:darkgreen;
                font-size: x-large;
            }
            input.i1{
                
                width: 100%;
                border-bottom-color: gray;
                border-top-width:0px;
                border-left-width: 0px;
                border-right-width: 0px;
                margin-left: 4%;
                padding:1%;
                outline: none;
            }
            textarea.t1{
                height:185px;
                width: 100%;
                margin-left: 4%;
                resize: none;
            }
            .reply
            {
                float:center;
                height: 8%;
                width: 95%;
            }
            .new
            {
                border: 1px solid black;
                height: 45%;
                margin-top: 10%;
                float: right;
                width: 30%;
                margin-right: 5%;
            }
            .n1
            {
                width:100%;
                height: 10%;
                float: bottom;
                border: 1px solid black;
                
            }
            .intext
            {
                display:run-in;
                width:101%;
                height: 5%;
                float:top;
                margin-left: 4%;
                border: 1px solid black;
            }
            .image1
            {
                width: 10%;
                height: 22px;
                border: 1px solid black;
            }
            .image2
            {
                width: 10%;
                height: 22px;
                border: 1px solid black;
                margin-left: 12%;
                float:top;
                margin-top: -7%;
            }
            
            </style>
            <script src="js/jquery.min.js" type="text/javascript"></script>
            <script>
function myFunction() {
    var x = document.getElementById('myDIV');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } else {
        x.style.display = 'none';
    }
}
</script>
    </head>
    <body>
        <%
            try
            {
        String userid=session.getAttribute("userId").toString();
        String number=request.getParameter("number");
        String id[]=userid.split("@");
        String ex="select * from sent where index1='"+number+"'";
        Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
         Statement st =conn.createStatement();
         ResultSet rs=st.executeQuery(ex);
        while(rs.next())
        {
            %><div class="dv1"><div class="indiv"><div class="inside"><% out.println("Sub    :    "+rs.getString(3));%></div><div style="text-align: center;font-size:large;font-family: sans-serif;color: midnightblue"><%out.println("To :  "+rs.getString(5)+" ");out.println("   :  "+rs.getString(6));%></div></div><%out.println(rs.getString(4));
        }
        %>
               <div><br><br>
                </div>
               
               
               
               <div class="new">
                   <div class="n1">
                     <div class="reply">
          <button onclick="myFunction()">Forward</button>

        <div id="myDIV" style="display: none">
            <form action="forward.jsp?number=<%=number%>" method="post">
                <%
                session.setAttribute("userId", userid);
                %>
            <input class="i1" type="text" placeholder="To : " name="to" ><br>
        
           <input type="submit"  value="Send">
            </form>
        </div>
          </div>  
            </div>
               </div>
         
           </div><%
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
    </body>
</html>
