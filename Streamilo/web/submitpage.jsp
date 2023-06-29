<%-- 
    Document   : submitpage
    Created on : Mar 7, 2023, 6:43:26 PM
    Author     : asus
--%>

<%@page import="com.streamilo.entity.User"%>
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

            .hchild1 {
                font-size: 25px;
                display: flex;
                font-weight: bold;
                font-family: Georgia, 'Times New Roman', Times, serif;
            }

            h1 {
                font-size: 150px;
                margin-left: 80px;
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
                font-size: 35px;
                font-weight: bold;
                font-family: Arial, Helvetica, sans-serif;
            }

            .info {
                font-size: 15px;
                font-family: Georgia, 'Times New Roman', Times, serif;
            }

            .mainfamily2 {
                margin-left: 480px;
                position: absolute;
                bottom: 80px;
            }

            input {
                display: block;
                margin-left: 420px;
                padding: 10px 100px;
                outline: none;
            }

            input:hover {
                cursor: auto;
            }

            .btn {

                margin-top: 20px;
                padding: 15px 240px;
                color: white;
                background-color: black;
                border-radius: 10px;
                font-family: Verdana, Geneva, Tahoma, sans-serif;
                font-size: 25px;
            }

            .btn:hover {
                cursor: pointer;
                background-color: whitesmoke;
                color: black;
            }

            .websitename,
            .websitepurpose,
            .goal,
            .info {
                font-size: 20px;
                font-family: Verdana, Geneva, Tahoma, sans-serif;
                margin-bottom: -25px;
            }
            .part1,.part2,.part3,.part4{
                margin-bottom: 25px;
            }
            .error{
                color: red;
                margin-right: 100px
            }
        </style>
    </head>

    <body>
        <div class="mainfamily">
            <div class="head1">

                <marquee behavior="" direction="" class="mar">
                    <div class="hchild1">
                        <p class="cn1"> Creator Submit Your Submit Here </p>
                        <p class="cn2" style="margin-left:20px"> Is Time To Show the World what are you</p>
                        <p class="cn1" style="margin-left:20px"> Creator Submit Your Submit Here </p>
                        <p class="cn2" style="margin-left:20px">Is Time To Show the World what are you</p>
                    </div>
                </marquee>
                <div style="display: flex;justify-content: space-between">
                    <a href="mapping.jsp" style="text-decoration: none;display: block;padding: 10px 20px;border: 2px solid black;font-weight: bold">Stream here</a>
                    <a href="LogoutServlet" style="text-decoration: none;display: block;padding: 10px 20px;border: 2px solid black;font-weight: bold">LogOut</a>

                </div>

                <h1>JUST STREAMILO</h1>
            </div>
            <div class="head2">
                <span>01.</span> <br> <br> <br>
                <div class="p">Submission <br> information</div> <br> <br>
                <div class="bold">URL</div> <br> <br>
            </div>
            <div class="mainfamily2">
                <form id="form" action="webServlet" method="post" enctype="multipart/form-data" autocomplete="off">
                    <div class="part1">
                        <div class="websitename">Enter your website name</div>
                        <input type="text" required name="website_name" placeholder="Enter your website name">
                    </div>

                    <div class="part2">
                        <div class="websitepurpose">what is your purpose</div>
                        <input type="text" required name="website_purpose" placeholder="website purpose">
                    </div>

                    <div class="part3">
                        <div class="goal">Please specify your future goal in details</div>
                        <input type="text" required name="website_goal" placeholder="website goal">
                    </div>

                    <!--                    <div class="part4">
                                            <div class="info">Add the Url of the website you want to <br> submit, Including http:// or https://  </div>
                                            <input type="url" name="url" placeholder="Enter your url here" required>
                                        </div>-->

                    <div class="part5">
                        <div class="info">Choose Your website photo</div>
                        <input type="file" name="web_file" name='imageLoader' accept="image/*" data-type='image'>
                    </div>
                    <button type="submit" class="btn" id="btn" onclick="next">SUBMIT UI</button>
                </form>
            </div>

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
                                return this.optional(element) || /^[a-zA-Z\s]+$/i.test(value);
                            }, "letters only");
                            jQuery.validator.addMethod(
                                    "onlyimages",
                                    function (value, element) {
                                        if (this.optional(element) || !element.files || !element.files[0]) {
                                            return true;
                                        } else {
                                            var fileType = element.files[0].type;
                                            var isImage = /^(image)\//i.test(fileType);
                                            return isImage;
                                        }
                                    },
                                    'Sorry, we can only accept image files.'
                                    );
                            jQuery("#form").validate({

                                rules: {
                                    website_name: {
                                        minlength: 2,
                                        noSpace: true,
                                        lettersonly: true
                                    },
                                    website_purpose: {
                                        minlength: 2,
                                        lettersonly: true
                                    },
                                    website_goal: {
                                        minlength: 2,
                                        lettersonly: true
                                    },
                                    web_file:{
                                        onlyimages:true
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

                                    // enables button
                                } else {
                                    $('#btn').prop('disabled', 'disabled');
                                    $('#btn').css({
                                        "border": "2px solid black",
                                        "color": "black",
                                        "background": "white",
                                        "font-weight": "bold"
                                    });

                                    // disables button
                                }
                            });
                        });


            </script>
            <!--            <script>
                            App.Dispatcher.on("uploadpic", function() {         
                    $(":file").change(function() {
                        if (this.files && this.files[0] && this.files[0].name.match(/\.(jpg|jpeg|png|gif)$/) ) {
                            if(this.files[0].size>1048576) {
                                alert('File size is larger than 1MB!');
                            }
                            else {
                                var reader = new FileReader();
                                reader.onload = imageIsLoaded;
                                reader.readAsDataURL(this.files[0]);
                            }
                        } else alert('This is not an image file!');
                    });
                    function imageIsLoaded(e) {
                        result = e.target.result;
                        $('#image').attr('src', result);
                    };
                });
                        </script>-->
    </body>

</html>
