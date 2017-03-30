<%@ page import="java.io.*, java.net.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         try {    
            ServerSocket socket = new ServerSocket(8765);

            Socket insocket = socket.accept( );

            BufferedReader in = new BufferedReader (new 
                InputStreamReader(insocket.getInputStream()));
            PrintWriter outt = new PrintWriter (insocket.getOutputStream(), 
                true);

            String instring = in.readLine();
            outt.println("The server got this: " + instring);
            insocket.close();
            }
         catch (Exception e) {} 
        %>
    </body>
</html>
