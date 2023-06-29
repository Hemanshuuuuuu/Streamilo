<%-- 
    Document   : login
    Created on : Mar 7, 2023, 6:36:19 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  errorPage="index.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    body {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
     
    }

    .userbox {
        display: block;
        height: 20px;
        width: 380px;
        padding: 6px 10px;
        border: 2px solid black;
        border-radius: 3px;
        margin-top: 5px;
    }

    .userbox:hover {
        cursor: auto;
    }

    .box-body {
        /* border: 2px solid black; */
        padding: 40px 30px;
        border-radius: 15px;
        box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.5);
    }
    button{
        display: block;
        margin: 10px auto;
        padding: 10px 163px;
       background-color: rgb(0, 0, 0);
       color: white;
       font-family: Verdana, Geneva, Tahoma, sans-serif;
       border-radius: 4px;
       font-weight: bold;
    }
    button:hover{
        background-color: white;
        color: black;
        cursor: pointer;
        border: 2px solid black;
    }
    h1{
        text-align: center;
    }
    #acc{
        font-weight: bolder;
        color: black;
        font-size: 18px;
        text-decoration: none;
    }
</style>
<body>
    <form action="loginServlet" method="post" autocomplete="off">
        <div class="box-body">
            <h1>Login in Streamilo</h1>
            <p>One account for everything's that including uplaoding <br> Your website and learning from other and etc.</p>
            <div class="username"> UserName
                <input type="text" name="user_name" class="userbox" placeholder="Enter your Email-id">
            </div>
            <div class="Email"> Password
                <input type="password" name="user_pass" placeholder="Enter your Password" class="userbox">
            </div>
            <button type="submit">Log In</button>
        <p>By Selecting Create account,you will agree with terms and <br>
            have read our acknowledge our <b> global privacy
                statement</b>
        </p>
        <p style="text-align: center">Don't have an account?<a id="acc" href="signup.jsp">Sign Up</a></p>
    </div>
        </form>
</body>
</html>
