
<%@page import="classpack.DBcontext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP remove</title>
    </head>
    <body>
        <%
            String serialno = request.getParameter("serialno");
            String checkout = request.getParameter("checkout");
            String cart = request.getParameter("cart");
            System.out.print("checkout =" + checkout);
            System.out.print("cart =" + cart);
            DBcontext db = new DBcontext();
            String query = "update cart set status='R' where serialno='" + serialno + "'";
            db.executeDML(query);
            if (checkout != null) {
                if (checkout.equalsIgnoreCase("checkout")) {
                    response.sendRedirect("checkout.jsp");
                    return;
                }
            } else {
                response.sendRedirect("cart.jsp");
                return;
            }
        %>
    </body>
</html>
