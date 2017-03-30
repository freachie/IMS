<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>V2S2-Mail</title>
        <script type="text/javascript">
            function alerto()
            {
              alert("Are you confirm !");
            }
            function alertoo()
            {
                var x = document.getElementById('email').innerHTML;
                if(x.length===0)
                   alert("Please Enter valid user");
                else
                   alert("Are you confirm !");  
            }
        </script>
        <style>
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
            textarea.t1{
                height:250px;
                width: 62%;
                margin-left: 4%;
                resize: none;
            }
            button.i2{
                height: 30px;
                width:5%;
                margin-left: 56.2%;
                background-color: red;
                display:block;
                padding: 10px 10px 19px;
                border: 0px solid black; 
            }
            table,td,tr,td{
                color:greenyellow;
                border-collapse: collapse;
                margin-left: 57%;
                padding-right: 4px;
            }
            .file-upload
            {
                position: relative;
                overflow: hidden;
                background:transparent;
                border: none;
                margin-bottom: -3%;
            }
    .file-upload input.file-input
            {
                position: absolute;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                font-size: 20px;
                cursor: pointer;
                opacity: 0;
                filter: alpha(opacity=0);
            }
            div.d2
            {
                width:370px;
                position: relative;
                margin-left: 6%;
                margin-top:-40px;
            }
        </style>
    </head>
    <body>
        <% 
            String userid="";
            try
            {
                userid=session.getAttribute("userId").toString();
              
   
      %>
        <form name="fn" method="post"  >
            <%
                session.setAttribute("userId", userid);
            %>
        <input class="i1" id="email" type="email" placeholder="To : " name="tosend"><br>
        <input class="i1" type="text" placeholder="Sub : " name="sub" ><br>
        <textarea class="t1" style="wrap:off; overflow:auto; outline:none" placeholder="&Downarrow;" name="msg"  required></textarea><br>
        <div class="d2" >
            <button class="file-upload">            
                <input type="file" class="file-input" name="photo"><img src="2.png" height="20px" width="20px" title="add image">
            </button>
            <button class="file-upload">            
                <input type="file" class="file-input" name="attach" multiple><img src="1.jpeg" height="20px" width="20px" title="attach file">
            </button>
           </div><br><br>
        <table>
            <tr><th><td>
                    <button  formaction="draft.jsp" type="submit" style="background-color: darkkhaki" onClick="alerto()">Draft</button></td><td>
                    <button  type="submit" formaction="sendmail.jsp" style="background-color: darkkhaki " onClick="alertoo()" >Send</button>
                </td> </th></tr>
        </table>
        </form>
        <%
            }
            catch(Exception e)
            {
                %><h1 Style="color:green"><%out.println("Please Login First");
            }
        %>
    </body>
</html>
