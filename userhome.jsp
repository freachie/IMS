<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>V2S2-Mail</title>
<style>
    
    body {
	position: relative;
	width: 100%;
	height:150%;
}
div.d1
{
	
	float:left;
	color:red;
	font-size:29;
	text-align:center;
	margin-top:0%;
	margin-left:5%;
	width:75%;
}
div.dm1
{
	
	float:right;
	color:red;
	font-size:21;
	text-align:left;
	margin-top:3%;
	margin-right:13%;
	width:7%;
}
div.d3
{
	float:right;
	float:top;
	margin-right:8%;
	margin-top:-5%;
	width:4%;
	height:4%;
}
div.d2
{
	float:left;
	font-size:21;
	height:90%;
	width:90%;
	margin-left:5%;
	
}
a.a1{
	width:4%;
	height:4%;
	border:0px;
}
a.a1:hover{
	width:4%;
	height:4%;
	border:0px;
}
a.a2{
	width:183px;
	height:3.5%;
	border:2px solid black;
        color: black;
        background-color: #7E7E7E;
        border-collapse: collapse;
}
a.a2:hover{
        border-collapse: collapse;
	width:183px;
	height:3.5%;
	border:2px solid black;
        color:white;
        background-color: #252525;
}
a{
	background-color:#122a00;
	display:inline-block;
	width:193.5px;
	height:45px;
	text-align:center;
	border:2px solid black;
	text-decoration:none;
	color:white;
	
}
a:hover{
	background-color:darkgreen;
	display:inline-block;
	width:193.5px;
	height:45px;
	text-align:center;
	border:2px solid gray;
	text-decoration:none;
	color: #D69E31;
	
}
a:active{
	background-color:chartreuse;
	display:inline-block;
	width:193.5px;
	height:45px;
	text-align:center;
	border:2px solid gray;
	text-decoration:none;
	color:black;
	
}
</style>
</head>
<body name="bbs">
    <%
        String s="";
        String c="";
        try
        {
               %>
                   <form action="compose.jsp" method="post">
                    <%
                   String userid = session.getAttribute("userId").toString();
                    %> </form>
              <%
            session.setAttribute("userId", userid);
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
            String name[]=userid.split("@");
            String nn=name[0];
            Statement st =conn.createStatement();
            String ex="select count(sub) from ";
            ex=ex+nn;
            ResultSet rr=st.executeQuery(ex);
            while(rr.next())
            {
              c=c+rr.getString(1); 
            }
             PreparedStatement ps=conn.prepareStatement("select name from ims where user_id='"+userid+"'");
             ResultSet rs=ps.executeQuery();
                             if(rs.next())
                                {
                                   s=""+rs.getString(1); 
                                }
                         
                    }
                             catch(Exception e)
                                     {
                                         out.print("Please Login");
                                     }         
     %>                        
<div class="d1"><h1>Welcome To V2S2-Mail</h1></div>
<div class="dm1">Hii<br><%=s%> </div>
<div class="d3"><a class="a1" href="logout.html"><image src="Logout.jpg"></a>     </div>
<div class="d2">
<a href="compose.jsp" target="if_a">COMPOSE</a><a href="inbox.jsp" target="if_a">INBOX(<%=c%>)</a><a href="sent.jsp" target="if_a">SENT-BOX</a><a href="senddraft.jsp" target="if_a">DRAFT</a><a href="test.html" target="if_a">TRASH</a><a href="test.html" target="blank">CONTACT-US</a>
<img src="retrieve_img.jsp" height="20%" width="16%" float="left" ><br><br>
<a class="a2" href="photo.jsp">Upload Profile Pic</a><br><a class="a2" href="getuserlogin.jsp">Change Password</a><br><a class="a2" href="manageaccount.jsp">Manage Account</a>
<iframe src="inbox.jsp"  style="background-color:gray; border: 2px dotted green; float:right;margin-top:-19%;margin-right:2%;position:relative" height="70%" width="75%"  name="if_a"></iframe>

</div>
</body>
</html>