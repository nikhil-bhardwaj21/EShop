
<%@page import="java.sql.ResultSet"%>
<%@page import="classpack.DBcontext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Checkout | E-Shopper</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->
    <body>
        <div class='container'>
            <h1 style="color: orange; text-align: center; margin: 40px">Add Address</h1>
            <div class="shopper-informations" >
                <%
                    String contact = (String) session.getAttribute("contactno");
                    DBcontext db = new DBcontext();
                    String Query = "Select*from address where Fkcustid='" + contact + "'";
                    ResultSet rs = db.executeQuery(Query);
                    while (rs.next()) {
                        String address = rs.getString("Address");

                %>

                <%}%>
                <div class="col-sm-5 clearfix">
                    <div class="bill-to">
                        <p>Bill To</p>
                        <div class="form-one">
                            <form action="address.jsp">
                                <input type="text" name="firstname" placeholder="First Name *">
                                <input type="text" name="lastname" placeholder="Last Name *">
                                <input type="text" name="email" placeholder="Email*">
                                <input type="text" name="address" placeholder="Address  *">
                                <input type="text" name="mobile" placeholder="Mobile Phone">
                                <input type="text" name="pincode" placeholder="Zip / Postal Code *">
                                <select style="margin: 10px 0" name="country">
                                    <option>-- Country --</option>
                                    <option>United States</option>
                                    <option>Bangladesh</option>
                                    <option>UK</option>
                                    <option>India</option>
                                    <option>Pakistan</option>
                                    <option>Ucrane</option>
                                    <option>Canada</option>
                                    <option>Dubai</option>
                                </select >
                                <select style="margin: 10px 0" name="state">
                                    <option>-- State / Province / Region --</option>
                                    <option>Haryana</option>
                                    <option>Delhi</option>
                                    <option>Uttar Pardesh</option>
                                    <option>Punjab</option>
                                    <option>Rajasthan</option>
                                    <option>Himachal</option>
                                    <option>Madhya Pardesh </option>
                                    <option>Uttrakhand</option>
                                </select>
                                <table>
                                    <td>
                                        <input type="submit" value="Continue"/>
                                    </td>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>					
        </div>
    </body>
</html>
