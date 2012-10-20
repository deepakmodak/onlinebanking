import java.sql.*;
import java.util.*;
import java.io.*;
//import javax.swing.*;


public class Main {


 public static void main(String s[]) throws Exception  {

    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Properties p = new Properties ();
    p.put("user","bank");
    p.put("password","123");
    Connection con= DriverManager.getConnection("jdbc:odbc:bank_dsn",p);
    PreparedStatement ps=con.prepareStatement("insert into test values (?,?)");
    ps.setString(1,"Deepak");
    File f = new File("D:/4thsem/oot/College ID.jpg");
    FileInputStream fis = new FileInputStream(f);
    ps.setBinaryStream(2, fis,(int)f.length());
    int i=ps.executeUpdate();
    con.close();

 }

}
