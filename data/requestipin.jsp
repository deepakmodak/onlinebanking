<html>
<head><title>Digital Gradient</title>
<link href="../data/cssfile.css" rel="stylesheet" type="text/css" />

</head>
<body >
<center>
    <img src="../images/banner.png">
    <br>
    <hr>
    <br>
 </center>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
   <a href="../index.jsp" >Go Back to Main Page</a>

<center>       
 
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <font color="#FFCC00">Current Time & Date :<%  java.util.Date tym2 =new java.util.Date();
 		out.println(tym2.toString());
	%>
    </font>
   
    <p class="style5" ><b>Just Register Here and Get iPIN </b></p>
    <form method="post" name="p1">
    <label>Enter Account Number&nbsp;&nbsp;&nbsp;&nbsp;</label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="accno" type="text" /><br>
    <label>Account Type</label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <select name="acctype" >
    <option value="saving">saving</option>
    <option value="current">current</option>
    </select><br><br>
    <input name="register" type="submit" value="Register" />
    <input type="reset" name="Reset" value="reset" />
     </form>
    
    
</center>
</body>
</html>
<%@ page import="java.sql.*" %>
<% 	
		String accno=request.getParameter("accno");
		String acctype=request.getParameter("acctype");
		String sub=request.getParameter("register");
	
		ServletContext ctx=getServletContext();
    	String l1=ctx.getInitParameter("l1");
    	String l2=ctx.getInitParameter("l2");
		String l3=ctx.getInitParameter("l3");
    	String l4=ctx.getInitParameter("l4");
		
		out.println("<center>");
		if(sub!=null)
		{
			if(accno.isEmpty() || accno.equals("null"))
			{
				out.println("<p class='style4'>Please Enter some valid Number</p>");
				return;
			}
			int check=0;
			Class.forName(l1);
        	Connection con= DriverManager.getConnection(l2,l3,l4);
        	Statement st =con.createStatement();
        	ResultSet res=st.executeQuery("select * from ipinrequest");
			while(res.next()){
				String v1=res.getString(1);
				String v2=res.getString(2);
				String v3=res.getString(3);
               	if(accno.equals(v1) && v3.equals("not alloted"))
				{
					out.println("<b>Yours details</b><br>");
					out.println("<table width='400' border='1'>");
					out.println("<tr><td>Account Number</td><td>"+v1+"</td></tr>");
					out.println("<tr><td>Account Type</td><td>"+v2+"</td></tr>");
					out.println("<tr><td>Status</td><td>"+v3+"</td></tr>");
					out.println("</table>");
					out.println("<p class='style4'>Sorry You have already registered You will get iPin very soon</p>");
					check++;
				}
				if(accno.equals(v1) && v3.equals("alloted"))
				{
					out.println("<b>Yours details</b><br>");
					out.println("<table width='400' border='1'>");
					out.println("<tr><td>Account Number</td><td>"+v1+"</td></tr>");
					out.println("<tr><td>Account Type</td><td>"+v2+"</td></tr>");
					out.println("<tr><td>Status</td><td>"+v3+"</td></tr>");
					out.println("</table>");
					out.println("<p class='style4'>You have already alloted iPin, to get new iPin contact your branch</p>");
					check++;
				}
			}
			//con.close();
			if(check==0)
			{
				//Class.forName(l1);
        		//Connection con1= DriverManager.getConnection(l2);
        		Statement st1 =con.createStatement();
				String g="not alloted";
        		String q="insert into ipinrequest values ('"+accno+"','"+acctype+"','not alloted')";
				st1.executeUpdate(q);
				out.println("<p class='style5'>You have registered successfully u will get iPin very soon</p>");
			}
		}
			out.println("</center>");	
         		
%>