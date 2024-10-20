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
</head>
<body>
	<%@ include file="component/index_navbar.jsp" %>
	<div class="contain">
<form action="register" method="post">

		

        <label for="name">Name:</label>
        <input type="text" id="name" name="name">

		<label for="age">Age:</label>
        <input type="text" id="age" name="age">
        
		<label for="email">email:</label>
        <input type="email" id="email" name="email">
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password">
        
         <label for="mobile">Mobile:</label>
        <input type="text" id="Mobile" name="mobile">

        <input type="submit" value="Register">
         <p>Already have an account ? <a href="login.jsp">login</a></p>
         
    </form>
	</div>

</body>
</html>