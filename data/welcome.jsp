<%
		 HttpSession ses=request.getSession();
         String accno=(String)ses.getAttribute("accno");
		 String name=(String)ses.getAttribute("name");
		 
%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<html>
<head><title>Digital Gradient Bank</title>
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
<center>
	<form method="POST">
    <br>
    <br>
     <input type="submit" value="Account Details" name="accdetail">
     <input type="submit" value="Personal Details" name="perdetail">
     <input type="submit" value="Transaction Details" name="trandetail">
     <input type="submit" value="Transfer Money" name="money">
     <input type="submit" value="Logout" name="logout">
    </form>
</center>
</body>
</html>
<%
	String accdetail=request.getParameter("accdetail");
	String perdetail=request.getParameter("perdetail");
	String trandetail=request.getParameter("trandetail");
	String money=request.getParameter("money");
	String logout=request.getParameter("logout");
	
	String i1=request.getParameter("i1");
	String i2=request.getParameter("i2");
	String i3=request.getParameter("i3");
	String transfer_sub=request.getParameter("transfer_sub");
	
	ServletContext ctx=getServletContext();
    String l1=ctx.getInitParameter("l1");
    String l2=ctx.getInitParameter("l2");
	String l3=ctx.getInitParameter("l3");
    String l4=ctx.getInitParameter("l4");
	
	if(accdetail!=null)
	{
		
		Class.forName(l1);
        Connection con= DriverManager.getConnection(l2,l3,l4);
        Statement st =con.createStatement();
		String q="select * from accountdetails where accno ='"+accno+"'";
        ResultSet res=st.executeQuery(q);
		out.println("<br><center><b>");
		out.println("<table width='700' border='1'>");
		out.println("<tr>ACCOUNT DETAILS:</tr>");
		while(res.next()){
             	out.println("<tr><td>");
				out.println("Account No.");
				out.println("</td><td>");
				out.println(res.getString(1));
				out.println("</td><tr>");
				out.println("<tr><td>");
				out.println("Account Holder Name");
				out.println("</td><td>");
				out.println(res.getString(2));
				out.println("</td><tr>");
				out.println("<tr><td>");
				out.println("Account Type");
				out.println("</td><td>");
				out.println(res.getString(3));
				out.println("</td><tr>");
				out.println("<tr><td>");
				out.println("Balance Amount");
				out.println("</td><td>");
				out.println(res.getString(4));
				out.println("</td><tr>");
		}
               	out.println("</table>");
				out.println("</b><center>");
		con.close();
	}
	else if(perdetail!=null)
	{
		
		Class.forName(l1);
        Connection con= DriverManager.getConnection(l2,l3,l4);
        Statement st =con.createStatement();
		String q="select * from personaldetails where accno ='"+accno+"'";
        ResultSet res=st.executeQuery(q);
		out.println("<br><center><b>");
		out.println("<table width='700' border='1'>");
		out.println("<tr>PERSONAL DETAILS:</tr>");
		while(res.next())
		{
             	out.println("<tr><td>");
				out.println("Name");
				out.println("</td><td>");
				out.println(res.getString(2));
				out.println("</td><tr>");
				
				out.println("<tr><td>");
				out.println("Profile Pic");
				out.println("</td><td>");
				out.println("<center><img src='../images/cust/"+accno+".jpg' height='100' width='80'></center>");
				out.println("</td><tr>");
				
				
				out.println("<tr><td>");
				out.println("Date Of Birth(yyyy-mm-dd)");
				out.println("</td><td>");
				out.println(res.getDate(3));
				out.println("</td><tr>");
				out.println("<tr><td>");
				out.println("Gender");
				out.println("</td><td>");
				out.println(res.getString(4));
				out.println("</td><tr>");
				out.println("<tr><td>");
				out.println("Email id");
				out.println("</td><td>");
				out.println(res.getString(5));
				out.println("</td><tr>");
				out.println("<tr><td>");
				out.println("Profession");
				out.println("</td><td>");
				out.println(res.getString(6));
				out.println("</td><tr>");
				out.println("<tr><td>");
				out.println("Address");
				out.println("</td><td>");
				out.println(res.getString(7));
				out.println("</td><tr>");
				out.println("<tr><td>");
		}
               	out.println("</table>");
				out.println("</br></center>");
		con.close();
	}
	else if(trandetail!=null)
	{
		 response.sendRedirect("transaction.jsp");
	}
	else if(money!=null || transfer_sub!=null)
	{
		out.println("<center>");
		out.println("<br><br>");
		out.println("<b>Money Transfer</b><br><br>");
    	out.println("<form method='post'>");
		out.println("<label>To Account no.</label>&nbsp;&nbsp;&nbsp;");
    	out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='i1' ><br>");
    	out.println("<label>Account Name</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
    	out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='i2' ><br>");
    	out.println("<label>Amount (in Rs)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
    	out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='i3' ><br>");
    	out.println("<br><input type='submit' value='Transfer' name='transfer_sub'>");
		out.println("<input name='r' type='reset' value='Reset'><br>");
		out.println("<center>");
		
		if(transfer_sub!=null)
		{
			Class.forName(l1);
        	Connection con= DriverManager.getConnection(l2,l3,l4);
        	
			if(i1.isEmpty() || i2.isEmpty() || i3.isEmpty() || i1.equals("null") || i2.equals("null") || i3.equals("null") )
			{
				out.println(" <p class='style4'>Please fill up all fields</p>");
				return;
			}
			if(i1.equals(accno))
			{
				out.println(" <p class='style4'>It cant be transfered as given account no. belong to u</p>");
				return;
			}
			
			int i3_int=Integer.parseInt(i3);
			if(!(i3_int >0))
			{
					out.println(" <p class='style4'>Please give some positive figure</p>");
					return ;
			}
			if(i3_int >0)
			{
				Statement st1 =con.createStatement();
				String c1="select amt from accountdetails where accno ='"+accno+"'";
        		ResultSet r1=st1.executeQuery(c1);
				while(r1.next())
				{
					int chk_amt=r1.getInt(1);
					if(chk_amt < i3_int)
					{
							out.println(" <p class='style4'>Sorry U have insufficient money</p>");
							return;
					}
				}
			}
			
			int g=0;
			int tran=0;
        	Random randomGenerator = new Random();
        	tran = randomGenerator.nextInt(1000);
        
			java.util.Date d2 =new java.util.Date();
 			java.sql.Date dot =new java.sql.Date(d2.getTime());
			String t1="insert into transaction values(?,?,?,?,?)";
			PreparedStatement ps1 = con.prepareStatement(t1);
			ps1.setString(1,accno);
			ps1.setDate(2,dot);
			ps1.setInt(3,tran);
			ps1.setString(4,"withdraw");
			ps1.setInt(5,i3_int);
			ps1.execute();
			
			Statement st =con.createStatement();
			String q1="UPDATE accountdetails SET amt=amt-"+i3_int+" WHERE accno='"+accno+"'";
			st.execute(q1);
			String q2="select * from accountdetails where accno ='"+i1+"'";
        	ResultSet res=st.executeQuery(q2);
			if(res.next())
			{
				String q3="UPDATE accountdetails SET amt=amt+"+i3_int+" WHERE accno='"+i1+"'";
				st.execute(q3);
				out.println("Transfered Successfully.");
				out.println("You have transfered money to participating bank customer");
				
				ps1.setString(1,i1);
				ps1.setDate(2,dot);
				ps1.setInt(3,tran+1);
				ps1.setString(4,"deposit");
				ps1.setInt(5,i3_int);
				ps1.execute();
						
			}
			else{
				out.println("Transfered Successfully.");
				out.println("You have transfered money to non-participating bank customer");
				
			}
			con.close();
			
		}
		
	}
	else if(logout!=null)
	{
        HttpSession ses1=request.getSession();
        ses1.removeAttribute("name");
		ses1.removeAttribute("accno");
        response.sendRedirect("logout.jsp");
		
	}
					
%>  