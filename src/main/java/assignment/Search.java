package assignment;

import models.User;
import models.UserDao;
import models.UserFile;
import models.UserFileDaO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "Search")
public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        search(request,response);
    }


    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String file = request.getParameter("file");
        UserFileDaO userFileDao = UserFileDaO.getInstance();
        UserFile userFile = userFileDao.searchFileByName(file);
        if(userFile!=null) {
        }
    }
}
