<%@page import = "Project.ConnectionProvider"%>
<%@page import = "java.sql.*"%>
<%@include file="header.html"%>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<br>
<% 
  String msg=request.getParameter("msg");
  if("valid".equals(msg))
  {
	  %>
<center><font color="red" size="5">Successfully Update</font></center>
	  <%
  }
  %>
  
   <% 
  if("invalid".equals(msg))
  {
	  %>
<center><font color="red" size="5"> Something went wrong!Try Again</font></center>
	  <%
  }
  %>
  <% 
 
  if("deleted".equals(msg))
  {
	  %>
<center><font color="red" size="5">Successfully Deleted</font></center>
	  <%
  }
  %>
  
<center>
<table id="customers">
<tr>
<th>ID</th> 
<th>Name</th> 
<th>Father Name</th> 
<th>Mother Name</th> 
<th>Mobile Number</th> 
<th>Gender</th> 
<th>Email</th> 
<th>Blood Group</th> 
<th>Address</th> 
<th>Edit</th> 
<th>Delete</th> 
</tr>
<tr>
<%
try{
	Connection con = ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from doner");
	while(rs.next()){
		%>
		<td><%=rs.getInt(1) %></td>
		<td><%=rs.getInt(2) %></td>
		<td><%=rs.getInt(3) %></td>
		<td><%=rs.getInt(4) %></td>
		<td><%=rs.getInt(5) %></td>
		<td><%=rs.getInt(6) %></td>
		<td><%=rs.getInt(7) %></td>
		<td><%=rs.getInt(8) %></td>
		<td><%=rs.getInt(9) %></td>
		<td><a href="updateDonor.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
		<td><a href="deleteDonor.jsp?id=<%=rs.getString(1)%>">Delete</a></td>
		</tr>
		<%
	}
}
catch(Exception e){
	System.out.println(e);
}
%>


</table>
</center>
<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @ Pankaj :: 2023  </center></h3>
</body>
</html>