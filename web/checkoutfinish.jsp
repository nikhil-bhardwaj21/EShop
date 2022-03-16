
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
            String custid = (String)session.getAttribute("contactno");
            String serialno = request.getParameter("serialno");
            String addid = request.getParameter("addid");
            String paytype = request.getParameter("paytype");
            System.out.print("addid - "+addid);
            System.out.print("Serial - "+serialno);
            System.out.print("paytype - "+paytype);
            DBcontext db = new DBcontext();
//            String date = CURDATE();
//            String query = "update cart set status='P' where serialno in(" + serialno + ")";
//            db.executeDML(query);
//            if(request.getParameterNames().hasMoreElements()){
//            String q ="insert into ordertable(Custid,Orderdate,Addid)values('"+custid+"',CURDATE(),'"+addid+"')";
//            System.out.print(q);
//            db.executeDML(q);}
            db.placeorder(custid, addid,paytype);
            response.sendRedirect("orderdetail.jsp");
        %>
    </body>
</html>
