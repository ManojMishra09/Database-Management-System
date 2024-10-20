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


@WebServlet("/login")
public class LoginServlet extends HttpServlet{
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 
		String Email = req.getParameter("email");
		String Password = req.getParameter("password");
		
	
	UserDao usd= new UserDao();
	User user = usd.fetchUserByEmailAndPassword(Email, Password);
		
		
		HttpSession session = req.getSession();

         if(user!=null)
         {
         	session.setAttribute("UserObj", user);
             resp.sendRedirect("home.jsp");
         }
         else {
     		session.setAttribute("faild", "invalid data");
     		resp.sendRedirect("login.jsp");;
		}		
		
}
}
