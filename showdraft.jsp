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
                background: slategray;
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
                background-color: gainsboro;
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
                background-color: gainsboro;
            }
            textarea.t1{
                height:185px;
                width: 100%;
                margin-left: 4%;
                resize: none;
            }
            .reply
            {
                
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
            input.i1{
                
                width: 60%;
                border-bottom-color: gray;
                border-top-width:0px;
                border-left-width: 0px;
                border-right-width: 0px;
                margin-left: 4%;
                padding:1%;
                outline: none;
            }
            a
            {
                text-decoration: none;
                color: #FC416F;
                display: block;
                border: 1px solid #666600;
                width: 80px;
                margin-left: 40%;
                background-color: #34495e;
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
        String ex="select * from draft where index1='"+number+"'";
        Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
         Statement st =conn.createStatement();
         ResultSet rs=st.executeQuery(ex);
        while(rs.next())
        {
            %><div class="dv1"><div class="indiv" text-align="center" ><div class="inside"><form  method="post"><% out.println("Sub    :"); %><input type="text" class="i1" name="sub" placeholder="<%=rs.getString(3)%>" ></div><div style="text-align: center;font-size:large;font-family: sans-serif;color: midnightblue"><%out.println("   :  "+rs.getString(5));%></div></div><%out.println(rs.getString(2));
        }
        %>
               <div><br><br>
                </div>
               
               
               
               <div class="new">
                   <div class="n1">
                     <div class="reply">
          <a href="#" onclick="myFunction()">Forward</a>
            
        <div id="myDIV" style="display: none">
            
                <%
                session.setAttribute("userId", userid);
                %>
            <input class="i1" type="text" placeholder="To : " name="to" ><br>
        
            <button formaction="forwarddraft.jsp?number=<%=number%>" >Send</button>
            </form>
        </div>
          </div>  
            </div>
               </div>
         
           </div><%
            }
            catch(Exception e)
            {
                %><h1 style="color:green"><%out.println("Please login again");
            }
        %>
    </body>
</html>
