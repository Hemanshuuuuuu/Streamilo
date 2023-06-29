<%-- 
    Document   : mapping
    Created on : Mar 18, 2023, 10:56:25 PM
    Author     : asus
--%>

<%@page import="com.streamilo.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.streamilo.entity.submitWeb"%>
<%@page import="com.streamilo.dao.webDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            * {
                margin: 0;
                padding: 0;
            }

            body {
                box-sizing: border-box;
                background-color: #e8e4fc;
            }

            .mar {
                background-color: black;
                color: white;
                padding: 10px 0px;

            }

            h1 {
                font-size: 150px;
                margin-left: 80px;
            }

            .hchild1 {
                font-size: 25px;
                display: flex;
                font-weight: bold;
                font-family: Georgia, 'Times New Roman', Times, serif;
            }

            .head2 {
                margin-left: 50px;
            }

            span,
            .bold {
                font-size: 25px;
                font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            }

            .p {
                font-size: 30px;
                font-weight: bold;
                font-family: Arial, Helvetica, sans-serif;
            }
            #h2{
                margin-top: -280px;
            }
            .box1 {
                position: relative;
                left: 650px;
                bottom: 350px;
                height: 60vh;
                width: 45vw;
                transition: 0.5s;
            }
            .box1:hover{
                cursor: pointer;
                box-shadow: 2px 2px 10px black;
                width: 46vw;
                height: 61vh;
                border-radius: 10px;
            }
        </style>
    </head>

    <body>
        <div class="head1">

            <marquee behavior="" direction="" class="mar">
                <div class="hchild1">
                    <p class="cn1"> Creator Submit Your Submit Here </p>
                    <p class="cn2" style="margin-left:20px"> Is Time To Show the World what are you</p>
                    <p class="cn1" style="margin-left:20px"> Creator Submit Your Submit Here </p>
                    <p class="cn2" style="margin-left:20px">Is Time To Show the World what are you</p>
                </div>
            </marquee>

<a href="LogoutServlet" style="text-decoration: none;display: block;float: right;padding: 10px 20px;border: 2px solid black">LogOut</a>            
        </div>
        <h1 style="margin-bottom: 100px">JUST STREAMILO</h1>
        <%
            webDao wd = new webDao();
            ArrayList<submitWeb> list = wd.getAllWebInfo();
            for (submitWeb s : list) {
        %>
        <div class="head2" >
            <span>01.</span> <br> &nbsp;
            <div class="p"><%= s.getW_name() %></div>
            <div class="w_name"></div>
            <span>02.</span> <br> &nbsp;
            <div class="p"><%= s.getW_purp() %></div>
            <div class="w_name"></div>
            <span>03.</span> <br> &nbsp;
            <div class="p"><%= s.getW_goal() %></div>
            <div class="w_name"></div>
           

            <img src="webImg/<%= s.getW_pto() %>" class="box1"/>
        </div>
        <%
            }
        %>

    </body>

</html>
