package CW;

import org.apache.commons.dbcp.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.*;

public class UsersDAO {

    public static void update(String username, String password) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConn();

        String sql = "INSERT  INTO users(username,password) VALUES (?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.executeUpdate();
        JDBC_Util.close(conn, ps, null);
    }

    public static boolean check(String username) throws Exception{

        //获取连接
        Connection conn = JDBC_Util.getConn();

        String sql = "select username from users where username = '"+username+"'";

        PreparedStatement ps = conn.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();
        if(rs.next())return false;
        else return true;
    }


    public static boolean check(String username,String password) throws Exception{
        boolean flag=false;

        //获取连接
        Connection conn = JDBC_Util.getConn();

        String sql = "select * from users where username = '"+username+"'";

        PreparedStatement ps = conn.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            String name = rs.getString("username");
            String pawd = rs.getString("password");
            if(name.equals(username)&&pawd.equals(password))flag = true;
        }
        JDBC_Util.close(conn, ps, rs);
        return flag;
    }

    public static void stateSave(String username,String li_id,int st) throws SQLException {
        
        //获取连接
        Connection conn = JDBC_Util.getConn();

        String sql = "update "+username+" set state = "+st+" where li_id ='"+li_id+"'";
        PreparedStatement ps = conn.prepareStatement(sql);
//        ps.setString(1, li_id);
        ps.executeUpdate();
        JDBC_Util.close(conn, ps, null);
    }

    public static void createSTable(String username) throws SQLException {

        //获取连接
        Connection conn = JDBC_Util.getConn();

        String sql = "create table "+username+"(flag int(100) primary key ,li_id varchar(255),state int(20))";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        JDBC_Util.close(conn, ps, null);
    }


    public static void Insert(String username,String li_id,int state,int flag) throws SQLException {

        //获取连接
        Connection conn = JDBC_Util.getConn();

        String sql = "insert into "+username+" values (?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setInt(1,flag);
        ps.setString(2,li_id);
        ps.setInt(3,state);
        ps.executeUpdate();
        JDBC_Util.close(conn, ps, null);
    }

    public static List<Integer> getState(String username,List<Integer> stateList) throws SQLException {

        //获取连接
        Connection conn = JDBC_Util.getConn();

        String sql = "select state from "+username+"";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        int state=0;
        while(rs.next()) {
            state = rs.getInt("state");
            stateList.add(state);
        }
        JDBC_Util.close(conn, ps, rs);
        return stateList;
    }

    public static void SaveAll() throws SQLException{

        //获取连接
//        Connection conn = JDBC_Util.getConn();
//        Connection conn = JDBC_Util.getConn();


    }
}