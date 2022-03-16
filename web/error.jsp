<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="text-align: center"><u>Error</u></h1>
        <h3 style="text-align: center; color: red "><%=exception.toString() %></h3>
    </body>
</html>
