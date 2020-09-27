package models;

public class UserFile {
    private long id;
    private String name;
    private long folder_id;
    private String path;
    private String size;

    public UserFile() {
    }

    public UserFile(String name, String path, String size) {
        this.name = name;
        this.path = path;
        this.size = size;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getFolder_id() {
        return folder_id;
    }

    public void setFolder_id(long folder_id) {
        this.folder_id = folder_id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
}
