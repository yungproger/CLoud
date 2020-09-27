package assignment;

import models.UserFile;
import models.UserFileDaO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "FileDownload", urlPatterns = "/fileDownload")
public class FileDownload extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            PrintWriter out = resp.getWriter();
            long fileId = Integer.parseInt(req.getParameter("id"));
            UserFileDaO fileDaO = UserFileDaO.getInstance();
            UserFile userFile = fileDaO.getFileById(fileId);
            String path = userFile.getPath();

            resp.setContentType("APPLICATION/OCTET-STREAM");
            resp.setHeader("Content-Disposition","attachment; filename=\"" + userFile.getName() + "\"");

            FileInputStream in = new FileInputStream(path);

            int i;
            while ((i = in.read())!=-1){
                out.write(i);
            }
            in.close();
            out.close();
        }catch (Exception e){

        }
    }
}
