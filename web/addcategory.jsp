

<%@page import="classpack.DBcontext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameterNames().hasMoreElements()) {
                String category = request.getParameter("category");
                DBcontext db = new DBcontext();
                String query = "insert into category(cname) values ('" + category + "') ";
                db.executeDML(query);
            }
        %>

        <h1>Add category</h1>
        <a href="addbrand.jsp"> Back</a>
        <form action="addcategory.jsp" >
            <table border="2" cellpadding="10">
                <th>Enter Category : </th>
                <td><input type="text" name="category" /></td>
                <td><input type="submit" value="Add" /></td>
            </table>
        </form>
    </body>
</html>
