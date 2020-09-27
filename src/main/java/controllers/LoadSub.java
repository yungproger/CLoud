package controllers;

import models.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadSub")
public class LoadSub extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        session.setAttribute("id",id);

        FolderDao folderDao = FolderDao.getInstance();
        UserFileDaO userFileDao = UserFileDaO.getInstance();
        List<Folder> folders = folderDao.getSubfolders(id);
        List<UserFile> files = userFileDao.getFilesByFolderId(id);
        req.setAttribute("folders",folders);
        req.setAttribute("files",files);
        req.getRequestDispatcher("/jsp/allFiles.jsp").forward(req,resp);
    }

}
