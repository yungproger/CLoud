package assignment;

import models.User;
import models.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SignIn")
public class SignIn extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        login(request,response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        PrintWriter writer = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDao userDao = UserDao.getInstance();
        User user = userDao.getUserByEmail(email);
        PrintWriter writer = response.getWriter();
        if(user!=null){
            if(user.getPassword().equals(password)){
                HttpSession session = request.getSession(true);
                session.setAttribute("user",user);
                response.sendRedirect(request.getContextPath() + "/jsp/main.jsp");
            }else{

                writer.append("Incorrect username or password!");
            }
        }else{
                writer.append("Incorrect username");
        }

    }


}
