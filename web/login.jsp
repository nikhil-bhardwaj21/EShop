
<%@page import="java.sql.ResultSet"%>
<%@page import="classpack.DBcontext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 2 | Log in</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Google Font -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
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
        </style>
    </head>
    <body class="hold-transition login-page">
        <div class="container">
            <nav>
                <div class="topnav">
                    <a   href="home.jsp">Home</a>
                    <a href="signup.jsp">Sign up</a>
                    <a class="active" href="login.jsp">Login</a>
                    <input type="text" placeholder="Search..">
                </div>
            </nav>
            <div class="login-box">
                <div class="login-logo">
                    <a href="../../index2.html"><u><strong>Login</strong></u></a>
                </div>
                <!-- /.login-logo -->
                <div class="login-box-body">
                    <p class="login-box-msg">Sign in to start your session</p>

                    <form action="login.jsp">
                        <div class="form-group has-feedback">
                            <input type="text" class="form-control" placeholder="Enter Number" name="contactno">
                            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input type="password" class="form-control" placeholder="Password" name="password">
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>
                        <div class="row">
                            <div class="col-xs-8">
                                <div class="checkbox icheck">
                                    <label>
                                        <input type="checkbox"> Remember Me
                                    </label>
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-xs-4">
                                <input type="submit" class="btn btn-primary btn-block btn-flat" name="Sign In" />
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>

                    <div class="social-auth-links text-center">
                        <p>- OR -</p>
                        <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
                            Facebook</a>
                        <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
                            Google+</a>
                    </div>
                    <!-- /.social-auth-links -->

                    <a href="#">I forgot my password</a><br>
                    <a href="signup.jsp" class="text-center">Register a new membership</a>

                </div>
                <!-- /.login-box-body -->
            </div>
            <!-- /.login-box -->

            <!-- jQuery 3 -->
            <script src="bower_components/jquery/dist/jquery.min.js"></script>
            <!-- Bootstrap 3.3.7 -->
            <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
            <!-- iCheck -->
            <script src="plugins/iCheck/icheck.min.js"></script>
            <script>
                $(function () {
                    $('input').iCheck({
                        checkboxClass: 'icheckbox_square-blue',
                        radioClass: 'iradio_square-blue',
                        increaseArea: '20%' // optional
                    });
                });
            </script>
            <%
                if (request.getParameterNames().hasMoreElements()) {
                    String contactno = request.getParameter("contactno");
                    String password = request.getParameter("password");
                    DBcontext db = new DBcontext();
                    String query = "select*from userdetail where contactno = '" + contactno + "'  and password = '" + password + "' and isenable=1";
                        System.out.println(query);
                    System.out.print("login : " + contactno);
                    try {
                        ResultSet rs = db.executeQuery(query);
                        System.out.print("rs"+rs);
                        if (rs.next()) {
                            session = request.getSession();
                            session.setAttribute("contactno", contactno);
                            session.setAttribute("name", rs.getString("name"));
                            if (rs.getString("usertype").equalsIgnoreCase("admin")) {
                                response.sendRedirect("admin.jsp");
                            } else if (rs.getString("usertype").equalsIgnoreCase("Employee")) {

                                //                        RequestDispatcher rt = request.getRequestDispatcher("productadd.jsp");
                                response.sendRedirect("productadd.jsp");
//                                session.setMaxInactiveInterval(10);
                                //                        rt.include(request, response);
                                // response.sendRedirect("productadd.html?id=999");

                            } else if (rs.getString("usertype").equalsIgnoreCase("customer")) {
                                response.sendRedirect("home.jsp");

                            }
                        } else {
            %>
            <p style="color: red">Invalid username or password</p>
            <%
                            response.sendRedirect("login.jsp");
                            out.println("error");
                        }
                    } catch (Exception ex) {
                        System.out.println(ex.getMessage());
                    }
                }%>
        </div>
    </body>
</html>

