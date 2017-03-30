<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2S2-Mail</title>
        <style>
            div.d1{
                height:25px;
                width: 20%;
                
                margin-left: 5%;
                margin-top: 5%;
            }
            a.a2{
	width:10%;
	height:20px;
	
        color: black;
        background-color: #D69E31;
        text-decoration: none;
}
a.a2:hover{
	width:10%;
	height:20px;
        color:white;
        background-color: #252525;
        text-decoration: none;
}
        </style>
    </head>
    <body style="background-color:grey ">
        <form action="check.jsp" method="post" >
            <pre>  <h2> Enter Your UserName: <input type="email" name="userId" required><br>
                                 <input type="submit" value="submit" ></h2></pre>
        </form>
        <div class="d1">
            Go To :<a class="a2" href="userhome.jsp">Home</a>
        </div>
            </body>
</html>
