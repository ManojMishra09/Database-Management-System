<%@page import="com.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dto.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	        body {
            height: 100vh;
            background-color: #f5f5f5;
            overflow: hidden;
        }
        .contain{
            display: flex;
            height: 100%;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        form {
        margin-bottom:80px;
             width:400px;
             height:550px;
            background-color: white;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: slide-in 0.5s ease-out;
            animation-fill-mode: forwards;
        }

        @keyframes slide-in {
            0% {
                transform: translateY(50px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 0.5rem;
            margin-bottom: 1rem;
            border-radius: 0.25rem;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 0.25rem;
            cursor: pointer;
            transition: background-color 0.2s ease-out;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
</style>
<%@ include file="component/bostrapCss.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	User UserObj = (User)session.getAttribute("UserObj");
	if(UserObj==null){
		response.sendRedirect("login.jsp");
	}
	else{
%>
<%@ include file="component/index_navbar.jsp" %>
	<div class="contain">
	<%int id = Integer.parseInt(request.getParameter("id"));
		UserDao ud = new UserDao();
		User user = ud.fetchUserById(id);
	%>
	
	<form action="update" method="post">
   <p style="text-align: center; color:green;"><%=user.getName()%>_Profile</p>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%=user.getName()%>">

		<label for="age">Age:</label>
        <input type="text" id="age" name="age" value="<%=user.getAge()%>">
        
		<label for="email">email:</label>
        <input type="email" id="email" name="email" value="<%=user.getEmail()%>">
        
        
         <label for="mobile">Mobile:</label>
        <input type="text" id="Mobile" name="mobile" value="<%=user.getMobile()%>">
        
           
        <input type="hidden"  name="id" value="<%=id%>">

        <input type="submit" value="update">
         
    </form>
	</div>
	<%} %>
</body>
</html>