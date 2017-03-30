<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%> 
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2S2-Mail</title>
    </head>
    <body style="background-color:gray">

<%
    try{
        String userid=session.getAttribute("userId").toString();
        MultipartRequest m=new MultipartRequest(request,"C:\\Users\\vishwas chauhan\\Desktop\\Uploaded"); 
        File f=m.getFile("photo" );
        String img=f.getName();
        %><h1 style="font-family: cursive"><%out.print("Uploading");
                   
        for(int i=0;i<5;i++)
        {
            out.print(".");
            Thread.sleep(200);
        }
        response.setHeader("refresh","2;url=upload.jsp?photo="+img+"");
         
   }
   catch(Exception e)
   {
     out.print(e.getMessage());
     response.setHeader("refresh","2;url=photo.jsp");
     
   }

%>
 </body>
</html>