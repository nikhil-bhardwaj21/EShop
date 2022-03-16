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
            String custid = (String) session.getAttribute("contactno");
            if (custid != null) {
                String pid = request.getParameter("pid");
                String quantity = request.getParameter("quantity");
                DBcontext db = new DBcontext();
//                String Query = "insert into cart (Customerid,Productid,Quantity,Status,IsEnable) values('"
//                        + custid + "', '" + pid + "','" + quantity + "','NP','1')";
//                db.executeDML(Query);
                db.add2cart(custid, pid, quantity);
                response.sendRedirect("product-detail.jsp");
            } else {
                response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>
