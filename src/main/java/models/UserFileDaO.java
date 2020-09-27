package models;

import java.sql.*;

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

    public UserFile searchFileByName(String file) {
        try {
            String sql = "select name, path, size from file where name = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, file);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return new UserFile(
                        rs.getString("name"),
                        rs.getString("path"),
                        rs.getString("size")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public UserFile getFilesbyFolderId(Long id) {
        try {
            String sql = "select name, path, size from file where id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return new UserFile(
                        rs.getString("name"),
                        rs.getString("path"),
                        rs.getString("size")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
