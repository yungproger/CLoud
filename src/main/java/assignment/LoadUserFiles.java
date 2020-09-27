package assignment;

import models.Folder;
import models.FolderDao;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoadUserFiles")
public class LoadUserFiles extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if(session!=null){
            User user = (User) session.getAttribute("user");
            FolderDao folderDao = FolderDao.getInstance();
            List<Folder> folders = folderDao.getUserFolders(user);
            req.setAttribute("folders",folders);
            req.getRequestDispatcher("/jsp/allFiles.jsp").forward(req,resp);

        }else{
            PrintWriter writer = resp.getWriter();
            writer.print("Please login");
            req.getRequestDispatcher("/jsp/login.jsp").include(req,resp);

        }

    }
}
