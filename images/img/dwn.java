import java.sql.*;
import java.util.*;
import java.io.*;
//import javax.swing.*;


public class dwn {


 public static void main(String s[]) throws Exception  {

    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Properties p = new Properties ();
    p.put("user","bank");
    p.put("password","123");
    Connection con= DriverManager.getConnection("jdbc:odbc:bank_dsn",p);
    Statement st =con.createStatement();
        	ResultSet res=st.executeQuery("select * from test");
			while(res.next()){
				String v1=res.getString(1);
				InputStream is=res.getBinaryStream(2);
				
				FileOutputStream fos =new FileOutputStream("m.bmp");
				
				int i=is.read();
				while(i!=-1)
				{
						fos.write(i);
						i=is.read();
				}
			}
			con.close();

 }

}
