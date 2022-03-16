<%@page errorPage="error.jsp" %>

<%@page import="classpack.DBcontext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String emailid = request.getParameter("emailid");
            String gender = request.getParameter("gender");
            String bankdetail = request.getParameter("bankdetail");
            String age = request.getParameter("age");
            String logindate = request.getParameter("logindate");
            String usertype = request.getParameter("usertype");
            String contactno = session.getAttribute("contactno").toString();
            DBcontext db = new DBcontext();

            String query = "update userdetail set username='" + username + "', password='" + password + "', name='" + name + "', address='" + address + "', emailid='" + emailid + "', gender='" + gender + "', bankdetail='" + bankdetail + "', age='" + age + "', usertype='" + usertype + "' where contactno='" + contactno + "'";
            db.executeDML(query);
            response.sendRedirect("employee.jsp");
        %>

    </body>
</html>
