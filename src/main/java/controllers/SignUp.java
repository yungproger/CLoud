package controllers;

import models.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "SignUp")
public class SignUp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        register(request,response);
    }


    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password);
        UserDao userDao = UserDao.getInstance();
        userDao.addUser(user);
//        FolderDao folderDao = FolderDao.getInstance();
//        StorageDaO storageDaO = StorageDaO.getInstance();
//        user = userDao.getUserByEmail(email);
//        Folder folder = new Folder("root",0);
//        folderDao.addFolder(folder);
//        storageDaO.addStorage(folder);



        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");



    }
}
