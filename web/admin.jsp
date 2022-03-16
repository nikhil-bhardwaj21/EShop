<%@page errorPage="error.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="classpack.DBcontext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% DBcontext db = new DBcontext();
            String query = "select * from userdetail where usertype='employee' and isenable is not null";
        %>
        <nav style=float: right>
            <a href="logout.jsp"><strong>Logout</strong></a>
        </nav>
        <h1>Admin</h1>
        <h2>User Detail</h2>
        <table border=1>
            <tr>
                <th>ContactNO.</th>
                <th>UserName</th>
                <th>Password</th>
                <th>Name</th>
                <th>Logindate</th>
                <th>UserType</th>
                <th>IsEnable</th>
            </tr>
            <%
                try {
                    ResultSet rs = db.executeQuery(query);

                    while (rs.next()) {
            %>

            <tr>
                <td><%= rs.getString(1)%> </td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%> </td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(11)%></td>
                <td><%=rs.getString(12)%></td>
                <%
                    int isen = Integer.parseInt(rs.getString("isenable"));
                %>
                <td> <a href='admin.jsp?cont=<%=rs.getString("contactno")%>&status=<%=rs.getString("isenable")%>'><%=(isen == 1 ? "Enable" : "Disable")%></a> </td>
            </tr>
            <%
                    }
                } catch (Exception ex) {
                    System.out.println("Error : " + ex.getMessage());
                    }%>
            <%
        if(request.getParameterNames().hasMoreElements()){
              try
{
    String contact = request.getParameter("cont");
    int status =Integer.parseInt(request.getParameter("status"));
    DBcontext dbc = new DBcontext();
            
    String q = "update userdetail set isenable=" + (status==0?"1":"0") + " where contactno = " + contact;
    dbc.executeDML(q);
    response.sendRedirect("admin.jsp");
}
catch(Exception ex)
{
    System.out.println("Error : " + ex.getMessage());
}
        
        }
            %>
    </body>
</html>
