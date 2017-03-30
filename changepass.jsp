<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>V2S2-Mail</title>
    
     <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      @import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-color:grey;
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(35% - 35px);
	left: calc(50% - 255px);
	z-index: 2;
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header div span{
	color: #5379fa !important;
}

.login{
	position: absolute;
	top: calc(35% - 75px);
	left: calc(50% - 50px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=submit]{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=submit]:hover{
	opacity: 0.8;
}

.login input[type=submit]:active{
	opacity: 0.6;
}

.login input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=submit]:focus{
	outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
    </style>

    
        <script src="js/prefixfree.min.js"></script>

    
  </head>

  <body bgcolor="grey">

    <div class="body"></div>
		<div class="grad"></div>
		
		<br>
		<div class="login" >
                    
                    <%
                        int c=0;
                        try
                        {
                            String userid=session.getAttribute("userId").toString();
                            session.setAttribute("userId", userid);
                            String security=request.getParameter("security");
                            String bday=request.getParameter("bday");
                            String npass=request.getParameter("npassword");
                            String cnpass=request.getParameter("cnpassword");
                            if(npass.equals(cnpass))
                            {
                                
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
                            PreparedStatement ps=conn.prepareStatement("select bday,answer from ims where user_id='"+userid+"'");
                            ResultSet rs=ps.executeQuery();
                            
                             if(rs.next())
                                {
                                    String sec=""+rs.getString(2);
                                    String bdayy=""+rs.getString(1);
                                    if(sec.equals(security) && bdayy.equals(bday))
                                    {
                                       PreparedStatement p=conn.prepareStatement("UPDATE ims SET pass='"+npass+"',cpass='"+cnpass+"'WHERE user_id='"+userid+"'");              
                                       p.executeUpdate();
                                       %><h2><%
                                       session.setAttribute("Pass", npass);
                                       out.println("PASSWORD SUCCESSFULLY CHANGED");
                                       response.setHeader("refresh","2;url=passchangedcompose.jsp");
                                    }
                                     
                                    else
                                    {   c=1;
                                        throw new Exception("Invalid Security Answer or Date Of Birth");
                                    }
                                   
                                }
                                 else
                                {
                                 c=1;
                                 throw new Exception("cannot connect to server");
                                }
                            }
                           else
                           {   
                             c=1;
                             throw new Exception("Password Not Found To Be Confirmed"); 
                           }
                         }
                        catch(Exception e)
                        {   %><h2><%out.println(e.getMessage());
                            if(c ==1)
                            response.setHeader("refresh","3;url=getuser.jsp");
                            else
                            response.setHeader("refresh","3;url=getuser1.jsp");
                        }
                                        %>
		</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    
    
    
    
  </body>
</html>

        
    </body>
</html>