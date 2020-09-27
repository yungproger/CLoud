package interfaces;

import models.User;

public interface IUserDao {
    void addUser(User user);
    User getUserByEmail(String email);
}
