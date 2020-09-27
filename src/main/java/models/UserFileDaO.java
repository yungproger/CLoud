package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserFileDaO {

    Connection conn;
    private static UserFileDaO instance = null;

    public static UserFileDaO getInstance(){
        if(instance == null){
            instance = new UserFileDaO();
        }
        return instance;
    }


    private UserFileDaO(){

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","2092002B");
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    public UserFile getFileById(long id){
        try {
            String sql = "select * from user_files where id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return new UserFile(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("path"),
                        rs.getString("size"),
                        rs.getLong("folder_id")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }


    public void addUserFile(UserFile userFile){
        try {
            String sql = "INSERT INTO user_files(name,folder_id,path,size) " +
                    "VALUES(?, ?, ?,?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, userFile.getName());
            stmt.setLong(2, userFile.getFolder_id());
            stmt.setString(3, userFile.getPath());
            stmt.setString(4,userFile.getSize());
            stmt.execute();
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

    public List<UserFile> searchFileByName(String file) {
        try {
            String sql = "select * from user_files where name = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, file);
            ResultSet rs = stmt.executeQuery();
            List<UserFile> files = new ArrayList<UserFile>();
            while (rs.next()) {
               files.add(new UserFile(
                        rs.getString("name"),
                        rs.getString("path"),
                        rs.getString("size")
                ));
            }
            return files;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<UserFile> getFilesByFolderId(Long id) {
        try {
            String sql = "select * from user_files where folder_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            List<UserFile> files = new ArrayList<UserFile>();
            while (rs.next()) {
                 files.add(new UserFile(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("path"),
                        rs.getString("size"),
                        rs.getLong("folder_id")
                ));
            }
            return files;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
