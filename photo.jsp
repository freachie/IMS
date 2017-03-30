<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>photo Page</title>
        <style>
            input.i1
            {
                margin-top: 5%;
                height: 3%;
                width:18%;
                color:greenyellow;
                font-family: cursive;
                background-color: #220112;
            }
        </style>
    </head>
    <body style="background-color:gray">
        <%
            try
            {
            String userid=session.getAttribute("userId").toString();
            %>
        <pre><h2>Please Select A File From Your Desktop<h3 style="color:yellow"> (Size <= 1 mb)</h3></h2></pre>
        <form action="test.jsp" method="post" enctype="multipart/form-data" >
            <input class="i1" type="file" name="photo" required><br>
            <input class="i1" type="submit" value="upload">
        </form>
        <%
            }
            catch(Exception e)
            {
                %><h1 Style="color:yellow"><%out.println("Please Login First");
            }
        %>
        
    </body>
</html>
