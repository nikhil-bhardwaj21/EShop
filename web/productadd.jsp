<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="classpack.DBcontext"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP productadd</title>
    </head>
    <body>
        <div>
            <%
//                           HttpSession session = request.getSession(true);
                System.out.print("add1");
                String contact = (String) session.getAttribute("contactno");
                System.out.print("padd =" + contact);
                if (contact == null) {
                    response.sendRedirect("login.jsp");
                } else {
                    String name = session.getAttribute("name").toString();
            %>
            <nav style="float: right">
                <div class="topnav">
                    <a href="home.jsp" <%=contact%>><strong>Home</strong></a>
                    <a href="employee.jsp"><strong>Name : <%= name%></strong></a>
                    <a href="employee.jsp" <%=contact%>><strong>Edit</strong></a>
                    <a href="logout.jsp" <%=contact%>><strong>Logout</strong></a>
                </div>
            </nav>
            <form action="Productinsert" enctype="multipart/form-data" method="post">
                <h1 style="text-align: center"><u>Add Product</u></h1>
                <table border="2" cellpadding="10">
                    <tr>
                        <th>Product Id :</th> 
                        <td><input type="text" name="pid" /></td>
                    </tr>
                    <tr>
                        <th>Product Name :</th> 
                        <td><input type="text" name="pname" /></td>
                    </tr>
                    <tr>
                        <%
                            DBcontext db = new DBcontext();
                            String q = "Select*from brand";
                            ResultSet rs = db.executeQuery(q);

                        %>

                        <th><lable for="category">Category :</lable></th>
                    <td> <select name="category" >
                            <%while (rs.next()) {
                                    String bname = rs.getString("bname");
                                    String cname = rs.getString("category");
                            %>
                            <option  value="<%=bname +","+  cname%>"><%=cname + "," + bname%></option>
                            <%}%>
                        </select>
                    </td>
                    </tr>
                    <tr>
                        <th>Product Size :</th>
                        <td><input type="text" name="psize" /></td>
                    </tr>
                    <tr>
                        <th>Product rate :</th>
                        <td><input type="text" name="prate" /></td>
                    <tr>
                        <th>Product Quantity :</th>
                        <td><input type="text" name="pquantity" /></td>
                    </tr>
                    <tr>
                        <!--                        <th><lable for="pbrand">Brand :</lable></th>
                                            <td> <select name="pbrand" >
                                                    <option value="nike">Nike</option>
                                                    <option value="rayben">Rayben</option>
                                                    <option value="Cannon">Cannon</option>
                                                </select>
                                            </td>-->
                        <td><a href="addbrand.jsp">Add New Category & brand &rArr;</a></td>
                    </tr>

                    <tr>
                        <th>Image Link: </th>
                        <td>
                            <input type="file" name="file">
                        </td></tr>
                    <td><input type="submit" name="sumbit" value="Submit" /></td>
                </table>
                <a href="productshow.jsp">Show Product Table &rarr;</a>
            </form>
        </div>        
        <%}%>
    </body>
</html>
