package interfaces;

import models.Folder;
import models.User;

import java.util.List;

public interface IFolderDao {
    void addFolder(Folder folder);
    List<Folder> getSubfolders(long parent_id);
    List<Folder> getUserFolders(User user);
    void deleteFolder(long id) throws Exception;
    long getRootId(long user_Id);
}
