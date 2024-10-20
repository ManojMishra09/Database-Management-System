<%@page import="com.dto.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="component/bostrapCss.jsp" %>

<style type="text/css">
div {
     margin:auto;
	width: 90%;
	height: auto;
}
table {
	width: 100%;
	height: 100%;
	border: 2px solid black;
}
th {
	border: 2px solid black;
	text-align: center;
	background-color: purple;
}
td {
	border: 2px solid black;
	text-align: center;
}
</style>

</head>

<body>
<%
	User UserObj = (User)session.getAttribute("UserObj");
String msg=(String)session.getAttribute("msg");
System.out.println(msg);
	if(UserObj==null){
		response.sendRedirect("login.jsp");
	}
	else{
%>
	<%@ include file="component/userJsp.jsp" %>
<h1 style="text-align: center;">welcome to home page</h1><br>
<h1 style="text-align: center; color: green;"><%=msg %></h1>
<%
  
UserDao ud= new UserDao();
List<User> lu= ud.fetchAllUser();
%>

<div>
 
<table>

<tr>
<th>Name</th>
<th>Email</th>
<th>mobile</th>
<th>Action</th>
</tr>


<%for(User user:lu){
	if(user.getId()==UserObj.getId())
	%>
	<% if(msg==null){ %>
   <tr>
     
<td><%=user.getName() %></td>
<td><%= user.getEmail()%></td>
<td><%= user.getMobile()%></td>
<td><a href="update.jsp?id=<%=user.getId()%>"><button style="backGround-color: green;">Update</button></a>
<a href="delete.jsp?id=<%= user.getId()%>"><button style="backGround-color: red;">Delete</button></a></td>
</tr>
<%} else{%>

   <tr>
<td><%=user.getName() %></td>
<td><%= user.getEmail()%></td>
<td><%= user.getMobile()%></td>
<td><a href="update.jsp?id=<%=user.getId()%>"><button style="backGround-color: green;">Update</button></a>
<a href="delete.jsp?id=<%= user.getId()%>"><button style="backGround-color: red;">Delete</button></a></td>
</tr>


<%} }%>
</table>
</div>
<%} %>
</body>
</html>