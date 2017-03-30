<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.*" %>
<HTML>
    <HEAD>
        <TITLE>Creating Client/Server Applications</TITLE>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </HEAD>

    <BODY>
        <H1>Creating Client/Server Applications</H1>
        <% 
        try{
            int character;
            Socket socket = new Socket("127.0.0.1", 8765);

            InputStream inSocket = socket.getInputStream();
            OutputStream outSocket = socket.getOutputStream();

            String str = "Hello!\n";
            byte buffer[] = str.getBytes();
            outSocket.write(buffer);

            while ((character = inSocket.read()) != -1) {
                out.print((char) character);
            }

            socket.close();
        }
        catch(java.net.ConnectException e){
       
        }
        %>
    </BODY>
</HTML>