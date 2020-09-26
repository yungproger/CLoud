package models;

public interface IUserDao {
    void addUser(User user);
    User getUserByEmail(String email);
}
