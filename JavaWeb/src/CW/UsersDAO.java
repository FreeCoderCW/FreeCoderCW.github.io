package CW;

import org.apache.commons.dbcp.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsersDAO {
    public static void update(String username, String password) throws Exception {
        String url = "jdbc:mysql://localhost/users";
        String user = "root";
        String pwd = "";
        String driverName = "com.mysql.jdbc.Driver";

        //创建连接池
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName(driverName);
        ds.setUsername(user);
        ds.setPassword(pwd);
        ds.setUrl(url);

        //获取连接
        Connection conn = ds.getConnection();

        String sql = "INSERT  INTO users(username,password) VALUES (?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.executeUpdate();
        JDBC_Util.close(conn, ps, null);
    }

    public static boolean check(String username) throws Exception{
        String url = "jdbc:mysql://localhost/users";
        String user = "root";
        String pwd = "";
        String driverName = "com.mysql.jdbc.Driver";

        //创建连接池
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName(driverName);
        ds.setUsername(user);
        ds.setPassword(pwd);
        ds.setUrl(url);

        //获取连接
        Connection conn = ds.getConnection();

        String sql = "select username from users where username = '"+username+"'";

        PreparedStatement ps = conn.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();
        if(rs.next())return false;
        else return true;
    }
}