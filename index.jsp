<%@ page import="java.util.*" %>
<%!
	int r=0;
	int r1=0;
	public String ran ()
	{
		
		Random randomGenerator = new Random();
        r = randomGenerator.nextInt(10);
		r1++;
		if(r1>10)
			r1=0;
		return "images/img/"+r1+".jpg";
	}
	
	public String decode(int a)
	{
		String arr[]={"copotstri","combscreck","bledsmuto","trabilly","ebannint","dorph",
						"vismicalyp","rescu","chroidend","hicerati","hookey"};
		return arr[a];
	}


%>
<html>
<head><title>Digital Gradient</title>
<link href="data/cssfile.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#FFFFFF" ><!--background="images/line_bg.jpg">-->
<center>
   <img src="images/banner.png">
    <br>
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
   <font color="#FFCC00">Current Time & Date :<%  java.util.Date d2 =new java.util.Date();
 		out.println(d2.toString());
	%>
    </font>
   <div id="wrapper">
   	<div id="left">
   		<table width="250" height="400" border="1" background="images/latest_news.png" >
              <tr >
                <td>
                   <marquee direction="up"  scrolldelay="250" OnMouseOver="this.stop()" 
                      OnMouseOut="this.start()">
                  <center>
                  <p class="style5"> e-TDR/e-STDR</p><br>
                  			e-TDR/e-STDROpen Term deposit accounts 
                            online and get e-TDR/e-STDR receipts instantly.<br>
                               <br><br>
                    <p class="style5">Loyalty Rewards</p><br>
								Loyalty Rewards Aapnar Bondhu Bank going to introduce loyalty 
                                rewards program for online transactions very soon            
                       	<br><br><br>
                        
                  </center>
                  </marquee>
                  </td>
                  </tr>
            </table>
    	</div>
    <div id="mid">
    <br><br><br><br><br><br>
    <form method="POST">
    <label>Account No.</label>
    <input type="text" name="accno" ><br>
    <label>iPin</label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;
    <input type="password" name="ipin" ><BR>
    <label>Image</label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="img" > <br><br>
    <img src='<%=ran()%>' /><br><br>
    
    
    <input type="submit" value="Go" name="go">
    <input name="r" type="reset" value="Reset">
    <br>
    <br>
    </form>
<%@ page import="java.sql.*" %>
<% 	
		String accno=request.getParameter("accno");
		String ipin=request.getParameter("ipin");
		String img=request.getParameter("img");
		String sub=request.getParameter("go");
	
		ServletContext ctx=getServletContext();
    	String l1=ctx.getInitParameter("l1");
    	String l2=ctx.getInitParameter("l2");
		String l3=ctx.getInitParameter("l3");
    	String l4=ctx.getInitParameter("l4");
		//	int pict=0;
		if(sub!=null)
		{
			int div=0;
			if(ipin.isEmpty() || accno.isEmpty() || ipin.equals("null") || img.isEmpty() || accno.equals("null"))
			{
				out.println(" <p class='style5'>please fill up all fields</p>");
				div++;
			}
			else
				div=0;
			
		if(div ==0 )
		{
		  if((img.equals(decode(r1-1))))
			{	
			int check=0;
			Class.forName(l1);
        	Connection con= DriverManager.getConnection(l2,l3,l4);
        	Statement st =con.createStatement();
        	ResultSet res=st.executeQuery("select accno,ipin,name from accountdetails");
			while(res.next())
			{
				
               	if(accno.equals(res.getString(1)) && ipin.equals(res.getString(2)))
				{
					 check++;
					HttpSession ses=request.getSession();
			         ses.setAttribute("accno",accno);
					 ses.setAttribute("name",res.getString(3));
					 // RequestDispatcher r=request.getRequestDispatcher("data/welcome.jsp");
			         // r.forward(request,response);
					
					 response.sendRedirect("data/welcome.jsp");
					
				}
			}
			if(check==0)
				out.println("<p class='style5'>Wrong Account No. or ipin </p>");
			
			
			con.close();
			}
		  else
		  		out.println(" <p class='style5'>Wrong Image Verification code</p>");
		
		}
		}
%>

<%!
	int count=0;
	public int Counter()
	{
			count++;
		return count;
	}
%>	
<%
//	out.println("u have hitted "+Counter());
	%>

    </div>
    <div id="right">
   		<table width="250" height="400" border="1"  >
              <tr >
                <td>
                  <p class="style5">
                  <center>
                   <a href="data/requestipin.jsp" target="_parent">Ask for iPin</a>
                  </center>
                  </p>
                 </td>
                 </tr>
                 <tr>
                 <td>
                 		<center>
                    	<a href="data/registeraccount.jsp" >Register for new account</a>
    					</center>
                 </td>
                <tr>
                 <td>
                 	<center>
                 	<img src="images/call.png"  />
                    </center>
                    </td>
                     </tr>
            </table>
    </div>

<div id="footer" >
<hr>
  &#169; copyright,20XX  |All rights reserved. | Designed by Digital Gradient 

</div>
</div>

</center>
</body>
</html>