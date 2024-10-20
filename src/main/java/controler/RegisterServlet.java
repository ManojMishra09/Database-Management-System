package controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.dto.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet
{
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  
	String Name = req.getParameter("name");
	int Age = Integer.parseInt( req.getParameter("age"));
	String Email = req.getParameter("email");
	String Password = req.getParameter("password");
	long Mobile = Long.parseLong( req.getParameter("mobile"));
	
	User user=new User();
	
	UserDao ud= new UserDao();
	
    user.setName(Name);
	user.setAge(Age);
	user.setEmail(Email);
	user.setPasword(Password);
	user.setMobile(Mobile);
	
	ud.saveUser(user);
	
	
	String msg1="RegisterSuccesfully";
	
	HttpSession session = req.getSession();
	session.setAttribute("msg",msg1 );

	resp.sendRedirect("login.jsp");
	
	
	
}
}
