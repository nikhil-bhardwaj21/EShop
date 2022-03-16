
<%@page import="java.util.logging.Logger"%>
<%@page import="classpack.DBcontext"%>
<%@page import="java.util.logging.Level"%>
<%--<%@page import="productshow"%>--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Productshow</title>
    </head>
    <body>
        <%
//            String isLogin = session.getAttribute("IsLoggedIn").toString();
            System.out.print("level1");
            String contact = (String) session.getAttribute("contactno");
            System.out.print("pshow = " + contact);
            if (contact == null) {
                response.sendRedirect("login.jsp");
            }
            DBcontext db = new DBcontext();

            String query = "Select * from producttable where contactno = " + contact;
            ResultSet rs = db.executeQuery(query);

        %>
        <div class="container">
            <nav style="float: right">
                <a href="home.jsp"><strong>Home</strong></a>
                <a href="logout.jsp"><strong>Logout</strong></a>
            </nav>
            <h2 style="text-align: center"><u>Product Detail</u></h2>
            <table border=1>
                <tr>
                    <th>Product Id</th>
                    <th>Product Name</th>
                    <th>Brand</th>
                    <th>Rate</th>
                    <th>Size</th>
                    <th>Quantity</th>
                    <th>Category</th>
                    <th><img src='' width='200' >Image</th>
                    <th>Contact No</th>
                </tr>
                <%                String st = "";
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><%= rs.getString(6)%></td>
                    <td><%= rs.getString(7)%></td>
                    <td><img src="images/<%=rs.getString(8)%>"  width='200'  alt='codeimage' /></td>
                    <td><%=rs.getString(9)%></td>
                    <td><a href="">Edit</a></td>
                </tr>

                <%
                    }
                %>
        </div>
    </body>
</html>
