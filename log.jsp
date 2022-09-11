<%@ page import="java.sql.* ;"%>
<% 

	try
	{
		String uname=request.getParameter("uname");
		System.out.println(uname);
		String pwd=request.getParameter("pwd");
		System.out.println(pwd);
		String type=request.getParameter("type");
		System.out.println(type);
		
		session.setAttribute("username",uname);
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","restra","restra");
		System.out.println("hii"+con);
        PreparedStatement ps=con.prepareStatement("select * from login where username=? and password=? and usertype=?");
		ps.setString(1,uname);
		ps.setString(2,pwd);
		ps.setString(3,type);
		ResultSet rs=ps.executeQuery();
		System.out.println("result set"+rs);
		
	 if(rs.next())
  {
	  	if(type.equals("admin"))
	  		response.sendRedirect("adminhome.jsp");
	
  
	else  if(type.equals("Restra Owener"))
	  {
	  	response.sendRedirect("restraowener.jsp");
	  }
	else  if(type.equals("User"))
	  {
	  	response.sendRedirect("userhomepage.jsp");
	  }
  }
	  else
	   response.sendRedirect("error.jsp");
	
}

catch(Exception e){System.out.println(e);}

 %>