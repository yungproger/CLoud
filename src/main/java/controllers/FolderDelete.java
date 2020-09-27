package controllers;

import models.FolderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "FolderDelete", urlPatterns = "/folderDelete")
public class FolderDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            long fileId = Integer.parseInt(req.getParameter("id"));
            FolderDao folderDao = FolderDao.getInstance();
            folderDao.deleteFolder(fileId);
            resp.sendRedirect(req.getContextPath() + "/LoadSub?id=" + (Long) req.getSession().getAttribute("id"));
        }catch (Exception e){
            PrintWriter writer = resp.getWriter();
            writer.print("Couldn't delete folder");
        }

    }
}
