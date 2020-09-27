package interfaces;

import models.UserFile;

import java.util.List;

public interface IUserFileDao {
    UserFile getFileById(long id);
    void addUserFile(UserFile userFile);
    void deleteFile(long id) throws Exception;
    List<UserFile> searchFileByName(String file);
    List<UserFile> getFilesByFolderId(Long id);

}
