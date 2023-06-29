<%-- 
    Document   : signup
    Created on : Mar 7, 2023, 6:35:15 PM
    Author     : asus
--%>

<%@page import="com.streamilo.entity.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  errorPage="index.jsp"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <script src="https://kit.fontawesome.com/1492f22ad6.js"></script>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">

    </head>
    <style>
        body {
            /*height: 70vh;*/
            display: flex;
            justify-content: center;
            align-items: center;

        }
        #form{

        }
        .userbox1 {
            display: block;
            /* height: 19px; */
            width: 90%;
            padding: 6px 12px;
            border: 2px solid black;
            border-radius: 3px;
            outline: none;
            margin-top: 5px;

        }

        .userbox1:hover {
            /* border: 2px solid blue; */
            cursor: auto;
        }

        .box-body1 {
            /* border: 2px solid black; */
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.5);
        }
        button{
            display: block;
            margin: 10px auto;
            padding: 10px 140px;
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
        #acc{
            font-weight: bolder;
            color: black;
            font-size: 18px;
            text-decoration: none;
        }
        #form{
            margin-top: 10px
        }
        .error{
            color: red
        }
    </style>

    <body>
        <form id="form" action="SignUpServlet" class="box-body1" method="post" autocomplete="off">
            

            <h1>Create an Streamilo Account </h1>
            <p>One account for everything's that including uplaoding <br> Your website and learning from other and etc.</p>
            <div class="username1"> 
                <label for="username">Username</label>
                <input id="txtNumeric" type="text" name="uname" class="userbox1" placeholder="Enter your UserName" id="username">
            </div>
            <div class="Email1"> 
                <label for="email">Email</label>
                <input type="email" name="email" placeholder="Enter your username" class="userbox1">
            </div>
            <div class="phonenumber1">
                <label for="phone">Phone NO.</label>
                <input type="number" name="phone" placeholder="Enter your phone-number" class="userbox1" id="phone">
            </div>
            <div class="password1">
                <label for="pass">Password</label>
                <input type="password" name="pass" placeholder="Enter your password" class="userbox1" id="pass">
            </div>
            <button id="btn" type="submit">Create Account<i class="fa fa-lock" style="display: none;"
                                                            id="i"></i></button>
            <p>By Selecting Create account,you will agree with terms and <br>
                have read our acknowledge our <b> global privacy
                    statement</b>
            </p>
            <p style="text-align: center">Already have an account?<a id="acc" href="login.jsp">Log In</a></p>
        </form>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js"
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"
                integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>


        <script>
                $(document).ready(function () {
                    jQuery.validator.addMethod("noSpace", function (value, element) {
                        return value.indexOf(" ") < 0 && value !== "";
                    }, "No space please and don't leave it empty");
                    jQuery.validator.addMethod("lettersonly", function (value, element) {
                        return this.optional(element) || /^[a-zA-Z\\=]+$/i.test(value);
                    }, "Letters only allowed");
                    jQuery.validator.addMethod("numberNotStartWithZero", function (value, element) {
                        return this.optional(element) || /^[1-9][0-9]+$/i.test(value);
                    }, "Please enter a valid number. (Do not start with zero)");
                    jQuery("#form").validate({

                        rules: {
                            uname: {
                                minlength: 2,
                                maxlength: 12,
                                noSpace: true,
                                lettersonly: true
                            },
                            email: {
                                minlength: 2,
                                maxlength: 30,
                                noSpace: true
                            },
                            phone: {
                                numberNotStartWithZero:true,
                                minlength: 10,
                                maxlength: 10,
                                noSpace: true
                            },
                            pass: {
                                minlength: 8,
                                maxlength: 16,
                                noSpace: true
                            }
                        }

                    });

                    $('#form').on('keyup', function () { // fires on every keyup & blur
                        if ($('#form').valid()) {                   // checks form for validity
                            $('#btn').prop('disabled', false);
                            $('#btn').css({
                                "border": "none",
                                "color": "white",
                                "background": "black"
                            });
                            $('#i').css({
                                "display": "none"
                            });
                            // enables button
                        } else {
                            $('#btn').prop('disabled', 'disabled');
                            $('#btn').css({
                                "border": "2px solid black",
                                "color": "black",
                                "background": "white",
                                "font-weight": "bold"
                            });
                            $('#i').css({
                                "display": "inline",
                                "color": "black",
                                "margin-left": "10px"
                            });
                            // disables button
                        }
                    });
                });


        </script>
        <script>
            function hide() {
                var a = document.getElementById("alt");
                a.style.display = "none";
            }
        </script>
    </body>

</html>
