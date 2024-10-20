<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            background-color: #f5f5f5;
            overflow: hidden;
        }

        form {
            width:400px;
            height:360px;
            background-color: white;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: slide-in 0.5s ease-out;
            animation-fill-mode: forwards;
            margin-bottom: 150px;
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
        input[type="email"]{
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
</head>
<body>
	<%@ include file="component/index_navbar.jsp" %>
	<h1>Login Page</h1>
	<div class="contain">
		<form action="login" method="post">
		
			<%String msg = (String) session.getAttribute("msg");
      if(msg != null){
      %>
      <p style="text-align: center; color: green;">Register Successfully</p>
     <%
      }
     else
    	 {
     %>
     <p style="text-align: center; color: red;">Login Please</p>
     <p><%session.removeAttribute("msg");%></p>
     <%}%>
     
	       <% String msg1=(String)session.getAttribute("faild");  
	       if(msg1!=null){
	    	%>
	    	<p>invalid credential</p>
	    	<%
	        }
	       %>
	       <p></p>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email">

        <label for="password">Password:</label>
        <input type="password" id="password" name="password">

        <input type="submit" value="Log In"><br>
         <p>don't have an account ? <a href="register.jsp">create account</a></p>
    </form>
	</div>
	
</body>
</html>