/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classpack;

import java.sql.*;
import java.util.ArrayList;

public class DBcontext {

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String getdetail = null;

    public void getconnection() {
        if (con == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping", "root", "123456");
            } catch (Exception ex) {
                System.out.println("dbc error = " + ex.getMessage());
            }
        }
    }

    public int executeDML(String q) throws SQLException {
        getconnection();
        st = con.createStatement();
        return st.executeUpdate(q);
    }

    public ResultSet executeQuery(String q) throws SQLException {
        getconnection();
        st = con.createStatement();
        return st.executeQuery(q);
    }

    public void placeorder(String cid, String addid, String paytype) throws SQLException {
        getconnection();
        String Q = "{CALL proc_order(" + cid + "," + addid + ",'" + paytype + "')}";
        CallableStatement cs = con.prepareCall(Q);
        cs.execute();
    }

    public ResultSet getorderdetail(String cid) throws SQLException {
        getconnection();
        String Q = "{CALL getorderdetail(" + cid + ")}";
        CallableStatement cs = con.prepareCall(Q);
        return cs.executeQuery();

    }

//    public void addproduct(String pid,String pname, String pbrand,String psize,String prate,String pquantity,String pcategory,String filename,String contact)throws SQLException {
//        getconnection();
//        String Qu = "{CALL addcategory("+pid+",'"+pname+"','"+pbrand+"','"+psize+"','"
//                +prate+"','"+pquantity+"','"+pcategory+"','"+filename+"',"+contact+")}";
//        CallableStatement cs = con.prepareCall(Qu);
//        cs.execute();
//    }
    public void add2cart(String cid, String prodid, String q) throws SQLException {
        getconnection();
        String Q = "{CALL add2cart(" + cid + "," + prodid + "," + q + ")}";
        CallableStatement cs = con.prepareCall(Q);
        cs.execute();

    }

    public ArrayList<String> getCategory() throws SQLException, ClassNotFoundException {
        ResultSet rs1 = executeQuery("Select distinct category from brand");
        ArrayList<String> cname = new ArrayList<String>();
        while (rs1.next()) {
            cname.add(rs1.getString("category"));
        }
        return cname;
    }

    public ArrayList<String> getBrand() throws SQLException, ClassNotFoundException {
        ResultSet rs1 = executeQuery("Select concat(category,'#',bname) as 'B' from brand order by category asc");
        ArrayList<String> bname = new ArrayList<>();
        while (rs1.next()) {
            bname.add(rs1.getString("B"));
        }
        return bname;
    }
}
