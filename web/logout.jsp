<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP logout</title>
    </head>
    <body>
        <%  request.getSession();
        session.invalidate();
        response.sendRedirect("home.jsp");
        %>
    </body>
</html>
