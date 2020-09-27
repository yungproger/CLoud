package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FolderDao {
    Connection conn;
    private static FolderDao instance = null;

    public static FolderDao getInstance(){
        if(instance == null){
            instance = new FolderDao();
        }
        return instance;
    }


    private FolderDao(){

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","2092002B");
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void addFolder(Folder folder){
        try {
            String sql = "INSERT INTO folders(name, parent_id) " +
                    "VALUES(?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, folder.getName());
            stmt.setLong(2, folder.getParent_id());
            stmt.execute();
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

    public List<Folder> getSubfolders(long parent_id){
        try {
            String sql = "SELECT * from folders " +
                    "WHERE parent_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setLong(1, parent_id);
            ResultSet rs = stmt.executeQuery();
            List<Folder> folders = new ArrayList<Folder>();
            while (rs.next()) {
                folders.add(new Folder(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getLong("parent_id")
                ));
            }
            return folders;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Folder> getUserFolders(User user){
        try {
            String sql = "SELECT folders.id,folders.name,folders.parent_id from folders " +
                    "WHERE parent_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setLong(1, getRootId(user.getId()));
            ResultSet rs = stmt.executeQuery();
            List<Folder> folders = new ArrayList<Folder>();
            while (rs.next()) {
                folders.add(new Folder(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getLong("parent_id")
                ));
            }
            return folders;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public long getRootId(long user_Id) {
        try {
            String sql = "SELECT root_id FROM cloud join users on cloud.cloud_id = users.storage_id " +
                    "WHERE users.id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setLong(1, user_Id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getLong("root_id");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }
}
