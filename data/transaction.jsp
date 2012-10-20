<%
		 HttpSession ses=request.getSession();
         String accno=(String)ses.getAttribute("accno");
		 String name=(String)ses.getAttribute("name");
%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<html>
<head>
<title>Digital Gradient </title>
<link href="../data/cssfile.css" rel="stylesheet" type="text/css" />

</head>
<body >
<center>
    <img src="../images/banner.png">
    <hr>
 
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
   
<%
 	if(accno==null || name==null)
	{
		out.println("<h3>Please Login First to get service of net banking</h3>");
		return;
	}
	
%>
</center>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    <b>Welcome,</b>
<%
			out.println("<b>"+name+"</b>");
%>
<center><form method="POST">
    
    <p class="style5"><b>Know Your Transaction Details:</b></p>
     <input type="submit" value="Back" name="back">
    <input type="submit" value="Duration-Wise" name="dur">
    <input type="submit" value="Date-Wise" name="dat">
    <input type="submit" value="Logout" name="logout">
</form>
</center>
</body>
</html>
<%
		String back=request.getParameter("back");
		String logout=request.getParameter("logout");
		String dur=request.getParameter("dur");
		String dur_select=request.getParameter("dur_select");
		String dur_sub=request.getParameter("dur_sub");
		String dat=request.getParameter("dat");
		
		String i1=request.getParameter("i1");
		String i2=request.getParameter("i2");
		String dat_sub=request.getParameter("dat_sub");
		
		ServletContext ctx=getServletContext();
   		String l1=ctx.getInitParameter("l1");
    	String l2=ctx.getInitParameter("l2");
		String l3=ctx.getInitParameter("l3");
    	String l4=ctx.getInitParameter("l4");
		
	if(back!=null)
	{
		 response.sendRedirect("welcome.jsp");
	}
	else if(logout!=null)
	{
        HttpSession ses1=request.getSession();
        ses1.removeAttribute("name");
		ses1.removeAttribute("accno");
        response.sendRedirect("logout.jsp");
	}
	else if(dur!=null || dur_sub!=null)
	{
		out.println("<center>");
		out.println("<br><br>");
    	out.println("<form method='post'>");
		out.println("<label>Select Your Required Duration &nbsp;</label>");
		out.println("<select name='dur_select' >");
		out.println("<option value='7'>Last 7 days</option>");
		out.println("<option value='15'>Last 15 days</option>");
		out.println("<option value='30'>Last Month</option>");
		out.println("<input type='submit' value='Go' name='dur_sub'/>");
		out.println("</select>");
		out.println("</form>");
		if(dur_sub!=null)
		{
			int ch=Integer.parseInt(dur_select);
			java.util.Date p =new java.util.Date();
 			java.sql.Date d2 =new java.sql.Date(p.getTime());
			
			
			String DATE_FORMAT = "yyyy-MM-dd";
			SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
			Calendar c1 = Calendar.getInstance();
			c1.add(Calendar.DATE, -ch);
			String b= sdf.format(c1.getTime());

		/*	int v=Integer.parseInt(dur_select);
			java.util.Date d1 =new java.util.Date();
 			java.sql.Date to_date =new java.sql.Date(d1.getTime());
			
			Calendar c1 = Calendar.getInstance();
			c1.add(Calendar.DATE, -2);
			
			java.util.Date d2 =new java.util.Date();
 			java.sql.Date from_date =new java.sql.Date(d2.getTime());
			*/
			
			java.sql.Date d1 =java.sql.Date.valueOf(b);
	  		//java.sql.Date d2 =java.sql.Date.valueOf(i2);
			
			
			Class.forName(l1);
       		Connection con= DriverManager.getConnection(l2,l3,l4);
			
			String q="SELECT * FROM transaction WHERE transactiondate BETWEEN ? and ?";						            PreparedStatement ps = con.prepareStatement(q);
			
			ps.setDate(1,d1);
			ps.setDate(2,d2);
			ResultSet res=ps.executeQuery();
			
			out.println("<br><table width='700' border='1'>");
			out.println("<tr><b>TRANSACTION DETAILS:</b></tr>");
			out.println("<tr><td>");
			out.println("S.No.");
			out.println("</td><td>");
			out.println("Date");
			out.println("</td><td>");
			out.println("ID");
			out.println("</td><td>");
			out.println("Particulars");
			out.println("</td><td>");
			out.println("Amount (in Rs)");
			out.println("</td><tr>");
			int i=0;
			while(res.next())
			{
				if(accno.equals(res.getString(1)))
				{
					i++;
					out.println("<tr><td>");
					out.println(i);
					out.println("</td><td>");
					out.println(res.getDate(2));
					out.println("</td><td>");
					out.println(res.getInt(3));
					out.println("</td><td>");
					out.println(res.getString(4));
					out.println("</td><td>");
					out.println(res.getInt(5));
					out.println("</td><tr>");
				}
			}
			out.println("</table>");

		}
		
	}
	else if(dat!=null || dat_sub!=null)
	{
		out.println("<center>");
		out.println("<form method='post'>");
		out.println("<label><br>Please Enter Your Required Time-Period</b></label><br><br>");
		out.println("Start Date (yyyy-mm-dd)"); 
		out.println("<input type='text' name='i1' ><br>");
		out.println("End Date (yyyy-mm-dd)&nbsp;&nbsp;"); 
		out.println("<input type='text' name='i2' ><br>");
		out.println("<input type='submit' value='Go' name='dat_sub'/>");
		out.println("<input type='reset' value='Reset' name='dat_res'/>");
		out.println("</form>");
		
		if(dat_sub!=null)
		{
			if(i1.isEmpty() || i2.isEmpty() || i1.equals("null") || i2.equals("null"))
			{
				out.println(" <p class='style4'>Please fill up all fields</p>");
				return;
			}
			
			java.sql.Date d1 =java.sql.Date.valueOf(i1);
	  		java.sql.Date d2 =java.sql.Date.valueOf(i2);
			
			Class.forName(l1);
       		Connection con= DriverManager.getConnection(l2,l3,l4);
			
			String q="SELECT * FROM transaction WHERE transactiondate BETWEEN ? and ?";						            PreparedStatement ps = con.prepareStatement(q);
			
			ps.setDate(1,d1);
			ps.setDate(2,d2);
			ResultSet res=ps.executeQuery();
			
			out.println("<table width='700' border='1'>");
			out.println("<tr><b>TRANSACTION DETAILS:</b></tr>");
			out.println("<tr><td>");
			out.println("S.No.");
			out.println("</td><td>");
			out.println("Date");
			out.println("</td><td>");
			out.println("ID");
			out.println("</td><td>");
			out.println("Particulars");
			out.println("</td><td>");
			out.println("Amount (in Rs)");
			out.println("</td><tr>");
			int i=0;
			while(res.next())
			{
				if(accno.equals(res.getString(1)))
				{
					i++;
					out.println("<tr><td>");
					out.println(i);
					out.println("</td><td>");
					out.println(res.getDate(2));
					out.println("</td><td>");
					out.println(res.getInt(3));
					out.println("</td><td>");
					out.println(res.getString(4));
					out.println("</td><td>");
					out.println(res.getInt(5));
					out.println("</td><tr>");
				}
			}
			out.println("</table>");
		}
	}
	
	
%>