package assignment;

import models.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadSub")
public class LoadSub extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Integer.parseInt(req.getParameter("id"));
        FolderDao folderDao = FolderDao.getInstance();
        UserFileDaO userFileDao = UserFileDaO.getInstance();
        List<Folder> folders = folderDao.getSubfolders(id);
        List<UserFile> files = userFileDao.getFilesbyFolderId(id);
        req.setAttribute("folders",folders);
        req.setAttribute("files",files);
        req.getRequestDispatcher("/jsp/allFiles.jsp").forward(req,resp);
    }

}
