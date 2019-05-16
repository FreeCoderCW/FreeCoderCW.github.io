package com.cw.jdbc.conn;

import java.sql.DriverManager;

public class Connection {
    public static void main(String[] args) throws Exception {
        //Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/users";
        String user = "root";
        String pwd = "";
        java.sql.Connection conn = DriverManager.getConnection(url,user,pwd);
        System.out.println(conn);
    }
}
