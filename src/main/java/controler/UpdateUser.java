package controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.dto.User;

@WebServlet("/update")
public class UpdateUser extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     String name=req.getParameter("name");
     int age=Integer.parseInt(  req.getParameter("age"));
     String email=req.getParameter("email");
     Long mobile= Long.parseLong( req.getParameter("mobile"));
     
     int id=Integer.parseInt(req.getParameter("id"));
     
     User user= new User();
     
     user.setName(name);;
     user.setAge(age);
     user.setEmail(email);
     user.setMobile(mobile);
     user.setId(id);
    
     
     
     UserDao ud=new UserDao();
     int mr = ud.updateUserById(id, user);
     
     if(mr!=0)
     {
    	 
     
     
     HttpSession session = req.getSession();
     session.setAttribute("msg", "Updated Successfully");
     resp.sendRedirect("home.jsp");
     
     }
     else {
		System.out.println("kkkkk");
	}
}
}
