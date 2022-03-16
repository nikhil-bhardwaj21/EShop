<%@page errorPage="error.jsp" %>

<%@page import="classpack.DBcontext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
               String contact=(String) session.getAttribute("contactno");
            if (contact == null) {
                response.sendRedirect("login.jsp");
            }

            DBcontext db = new DBcontext();
            try {
//                String a = request.getParameter("contact");
                String query = "select * from userdetail where contactno='" + contact + "'";
                ResultSet rs = db.executeQuery(query);
        %>

        <nav style="float: right">
            <a href="home.jsp"><strong>Home</strong></a>
            <a href="logout.jsp"><strong>Logout</strong></a>
        </nav>
        <%
            rs.next();
        %>
        <h1>Employee</h1>
        <form action="employeeupdate.jsp">
            <table>
                <tr>
                    <th>Enter Contact :</th>
                    <td><input type='text' name='contact'  size='23' value=<%=rs.getString(1)%> /></td>
                </tr>
                <tr>
                    <th>Enter Username :</th>
                    <td><input type='text' name='username'  size='23' value=<%=rs.getString(2)%>  /></td>
                </tr>
                <tr>
                    <th>Enter Passowrd :</th>
                    <td><input type='text' name='password'  size='23' value=<%= rs.getString(3)%> /></td>
                </tr>
                <tr>
                    <th>Enter Name :</th>
                    <td><input type='text' name='name'  size='23' value=<%=rs.getString(4)%>  /></td>
                </tr>
                <tr>
                    <th>Enter Address:</th>
                    <td><input type='text' name='address'  size='23' value=<%=rs.getString(5)%>  /></td>
                </tr>
                <tr>
                    <th>Enter Emailid :</th>
                    <td><input type='text' name='emailid'   size='23' value=<%=rs.getString(6)%> /></td>
                </tr>
                <tr>
                    <th>Enter Gender :</th>
                    <td><input type='text' name='gender'  size='23' value=<%=rs.getString(7)%>  /></td>
                </tr>
                <tr>
                    <th>Enter Bankdetail :</th>
                    <td><input type='text' name='bankdetail'   size='23' value=<%=rs.getString(8)%>  /></td>
                </tr>
                <tr>
                    <th>Enter Age :</th>
                    <td><input type='text' name='age'   size='23' value=<%=rs.getString(9)%>  /></td>
                    <!--                </tr>
                                    <th>Enter Logindate :</th>
                                    <td><input type='text' name='logindate'  size='23' value=<%=rs.getString(11)%>  /></td>
                                    </tr>-->
                <tr>
                    <th>Enter UserType :</th>
                    <td><input type='text' name='usertype'  size='23' value=<%=rs.getString(12) %>  /></td>
                </tr>
            </table>
            <input type='submit' name='btn' value='Update' size='23' />
            <form>
                <%
                    } catch (Exception ex) {
                        System.out.println("Error : " + ex.getMessage());
                    }
                %>
                </body>
                </html>
