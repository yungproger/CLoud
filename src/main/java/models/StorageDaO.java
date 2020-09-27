package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StorageDaO {
    Connection conn;
    private static StorageDaO instance = null;

    public static StorageDaO getInstance(){
        if(instance == null){
            instance = new StorageDaO();
        }
        return instance;
    }


    private StorageDaO(){

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","2092002B");
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void addStorage(Folder folder){
        try {
            String sql = "INSERT INTO cloud(root_id) " +
                    "VALUES(?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setLong(1, folder.getId());
            stmt.execute();
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }
}
