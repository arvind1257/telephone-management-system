<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"> 
        <link rel="icon" href="VITLogoEmblem.png">
        <title>E-BILL</title>
        <style>
            * {box-sizing: border-box; margin:0; }
        .center { margin-left: auto; margin-right: auto;}
        .header{ width:100%; background-color:#1836ba; padding:10px 10px;
                     font-family: timesnewroman; color:white; }
        body { font-family: Arial; background-color:#e8e8e8; }
        .maincontent{ width:35%; border-top: 7px solid #0f5adb; color:#1b6bf5;
                        box-shadow: 0px 0px 10px 5px grey; 
                        background-color: white;}
        .form_header{ text-align:center;font-size:40px; font-family:timesnewroman; }
        .login__field { position: relative; float:left;}
        .login__icon { position: absolute; padding:0px 5px; top: 20px; color: #7875B5; width:50px; height:50px; }  
            .login__input { padding: 10px; padding-left: 50px; width: 90%; font-size:18pt; height: 50px; }  
        .button{ padding:10px 20px; background-color:#0f5adb; color:white; width:175px; font-size:15px; }
        .button:hover { background-color:rgba(15, 90, 219,0.8); }
        </style>
    </head>
    <body>
        <%
        try{
            session.getAttribute("uid");
            
        }
        catch(Exception e)
        {
            session.setAttribute("msg","Please Login in First");
            session.setAttribute("status","failed");
            response.sendRedirect("index.jsp");
        }
        %>
        <div class="header">
            <table style="width:100%;">
                <tr>
                    <td style="width:5%;"; align="center"><img src="VITLogoEmblem.png" width="40px" height="40px"/></td>
                    <td style="width:40%; font-size:25px;"> VIT (VELLORE CAMPUS) </td>
                    <td style="width:55%; font-size:40px;"><b> TELEPHONE E-BILL </b></td>
                </tr>
            </table>
        </div>
        <br><br><br><br>
        <div class="maincontent center">
            <br><br>
            <h1 class="form_header">RESET PASSWORD</h1>
            <form action="newpassword" method="POST">  
                <table class="center" cellspacing="20">
                    <tr>
                        <td align="center">
                            <div class="login__field">
                                <i class = "login__icon fas fa-lock"> </i>
                                <input class="login__input" type="password" name="password" 
                                   placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  
                                   title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <div class="login__field">
                                <i class = "login__icon fas fa-lock"> </i>
                                <input class="login__input" type="password" name="cpassword" 
                                    placeholder="Confirm Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  
                                    title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                        <%
                        if(session.getAttribute("status")!=null && session.getAttribute("msg")!=null)
                        {
                            if(session.getAttribute("status").toString().equals("success"))
                            {
                            %>
                            <p style="color:green;"><%=session.getAttribute("msg").toString()%></p>
                            <%
                            }
                            else
                            {
                            %>
                            <p style="color:red;"><%=session.getAttribute("msg").toString()%></p>
                            <%
                            }
                            session.setAttribute("msg","");
                        }
                        %>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 70px;text-align:center;vertical-align:top;">
                            <input class="button" type="submit" value="Reset Password" name="recover-submit"/>
                        </td>
                    </tr>
                </table>
                <input type="hidden" name="token" id="token" value="">
            </form> 
        </div>
    </body>
</html>
