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
            String fname = request.getParameter("firstname");
            String lname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String mobile = request.getParameter("mobile");
            String pincode = request.getParameter("pincode");
            String country = request.getParameter("country");
            String state = request.getParameter("state");
            System.out.print("state- "+state);

            String customerid = (String) session.getAttribute("contactno");
            System.out.print("cust id "+customerid);
            DBcontext db = new DBcontext();
            String query = "insert into address(Firstname,Lastname,Email,Address,Country,State,Pincode,Mobile,Fkcustid)values('"+fname+"','"+lname+"','"+email+"','"+address+"','"+country+"','"+state+"','"+pincode+"','"+mobile+"','"+customerid+"')";
            db.executeDML(query);
            System.out.print(query);
            response.sendRedirect("checkout.jsp");
        %>
    </body>
</html>
