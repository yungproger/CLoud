package controllers;

import models.Folder;
import models.FolderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateFolder",urlPatterns = "/createFolder")
public class CreateFolder extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("folder_name");
            long parent_id = 0;
            if(req.getSession().getAttribute("id")!=null) {
                parent_id = (Long) req.getSession().getAttribute("id");
            }else{
                // parent_id = root folder ID
            }
            FolderDao folderDao = FolderDao.getInstance();
            Folder folder = new Folder(name, parent_id);
            folderDao.addFolder(folder);

            resp.sendRedirect(req.getContextPath() + "/LoadSub?id=" + parent_id);

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
