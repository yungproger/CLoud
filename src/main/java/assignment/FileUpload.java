package assignment;

import models.FolderDao;
import models.User;
import models.UserFile;
import models.UserFileDaO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
@WebServlet(name = "FileUpload")
public class FileUpload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Part part = request.getPart("file");
        String fileName = part.getSubmittedFileName();
        long folderId =(Long) request.getSession().getAttribute("id");
        String path = "C:\\Users\\Acer\\Desktop\\универ\\Джава\\CLoud\\src\\main\\java\\files";
        UserFileDaO userFileDaO = UserFileDaO.getInstance();
        userFileDaO.addUserFile(new UserFile(fileName,folderId,path+"\\" + fileName,String.valueOf(part.getSize())));
        for(Part part1 : request.getParts()){
            part1.write(path + "\\" + fileName);
        }

    }


    private boolean uploadFile(InputStream is, String path) {
        boolean isUploaded = false;
        try{
            byte [] bytes = new byte[is.available()];
            is.read();
            FileOutputStream fileOutputStream = new FileOutputStream(new File(path));
            fileOutputStream.write(bytes);
            fileOutputStream.flush();
            fileOutputStream.close();
            isUploaded = true;

        }catch (Exception e){
            e.printStackTrace();
        }
        return isUploaded;
    }
}
