package assignment;

import models.UserFile;
import models.UserFileDaO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.List;

@WebServlet(name = "Search")
public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        search(request,response);
    }


    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String file = request.getParameter("file");
        UserFileDaO userFileDao = UserFileDaO.getInstance();
        List<UserFile> userFile = userFileDao.searchFileByName(file);
        if(userFile!=null) {
            request.setAttribute("files",userFile);
            request.getRequestDispatcher("/jsp/allFiles.jsp").forward(request,response);
        }else{

        }
    }
}
