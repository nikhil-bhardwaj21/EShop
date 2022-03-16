<%@page errorPage="error.jsp" %>
<%@page import="classpack.DBcontext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup JSP</title>
        <style>

            .topnav {
                overflow: hidden;
                background-color: #333;
                font-family: sans-serif;
            }

            /* Style the links inside the navigation bar */
            .topnav a {
                float: right;
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 20px;
            }

            /* Change the color of links on hover */
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }

            /* Style the "active" element to highlight the current page */
            .topnav a.active {
                background-color: #04AA6D;
                color: white;
            }

            /* Style the search box inside the navigation bar */
            .topnav input[type=text] {
                float: right;
                padding: 6px;
                border: none;
                margin-top: 8px;
                margin-right: 16px;
                font-size: 17px;
            }

            /* When the screen is less than 600px wide, stack the links and the search field vertically instead of horizontally */
            @media screen and (max-width: 600px) {
                .topnav a, .topnav input[type=text] {
                    float: right;
                    display: block;
                    text-align: right;
                    width: 100%;
                    margin: 0;
                    padding: 14px;
                }
                .topnav input[type=text] {
                    border: 1px solid #ccc;
                }
            }
            input[type=text], input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }

            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

            hr {
                border: 1px solid #f1f1f1;
                margin-bottom: 25px;
            }

            /* Set a style for all buttons */
            .signupbtn input  {
                background-color: #04AA6D;
                color: green;
                padding: 14px 20px;
                /*                margin: 8px 0;
                                border: none;*/
                cursor: pointer;
                /*width: 100%;*/
                /*opacity: 0.9;*/
            }

            button:hover {
                opacity:1;
            }

            /* Extra styles for the cancel button */
            .cancelbtn {
                padding: 14px 20px;
                background-color: #f44336;
            }

            /* Float cancel and signup buttons and add an equal width */
            .cancelbtn, .signupbtn {
                float: left;
                width: 50%;
            }

            .container {
                padding: 16px;
            }

            /* Clear floats */
            .clearfix::after {
                content: "";
                clear: both;
                display: table;
            }

            /* Change styles for cancel button and signup button on extra small screens */
            @media screen and (max-width: 300px) {
                .cancelbtn, .signupbtn {
                    /*width: 100%;*/
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <nav>
                <div class="topnav">
                    <a href="home.jsp">Home</a>
                    <a class="active"  href="signup.jsp">Sign up</a>
                    <a href="login.jsp">Login</a>
                </div>
            </nav>
            <div >
                <form action="signup.jsp" style="border:1px solid #ccc">
                    <div class="container">
                        <h1>Sign Up</h1>
                        <p>Please fill in this form to create an account.</p>
                        <hr>
                        <input type="radio"  name="type" checked value="customer">
                        <lable for="customer"><b>Customer</b></lable>
                        <input type="radio"  name="type" value="employee">
                        <lable for="employee"><b>Employee</b></lable>
                        <br>
                        <br>
                        <label for="email"><b>Email</b></label>
                        <input type="text" placeholder="Enter Username" name="username" required>

                        <label for="name"><b>Name</b></label>
                        <input type="text" placeholder="Enter Name" name="name" required>

                        <label for="contactno"><b>Contact N0.</b></label>
                        <input type="text" placeholder="Enter Number" name="contactno" required>

                        <label for="psw"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="password" required>

                        <label>
                            <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
                        </label>

                        <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>
                        <div class="clearfix">
                            <input type="submit" class="cancelbtn" value="Cancel" name="Cancle"  />
                            <input type="submit" class="signupbtn" value="Sign Up" name="Signup" />
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <%
            if (request.getParameterNames().hasMoreElements()) {
                int IsEnable = 1;
                String usertype = request.getParameter("type");
                if (usertype.equalsIgnoreCase("employee")) {
                    IsEnable = 0;
                }else if(usertype.equalsIgnoreCase("customer")){
                    IsEnable = 1;
                }

                String username = request.getParameter("username");
                String name = request.getParameter("name");
                String contactno = request.getParameter("contactno");
                String password = request.getParameter("password");
                DBcontext db = new DBcontext();
                try {
                    db.executeDML("insert into userdetail(username,contactno,password,name,usertype,IsEnable) values('" + username + "', '" + contactno + "','" + password + "','" + name + "','" + usertype + "','" + IsEnable + "')");
                    response.sendRedirect("login.jsp");
                } catch (Exception ex) {
                    ex.getMessage();    
        %>
        <a href="signup.jsp"  style="color: red">Contact Number Already Exist</a>
        <%
                }
            }
        %>
    </body>
</html>
