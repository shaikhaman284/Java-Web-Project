package DatabaseDAO;

import java.sql.*;

public class UserDAO {

    public User checkLogin(String email, String password) throws SQLException,
            ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/quizdb";
        String dbUser = "root";
        String dbPassword = "6967";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String sql = "SELECT * FROM registerstudent WHERE email = ? and password = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);

        ResultSet result = statement.executeQuery();

        User user = null;

        if (result.next()) {
            user = new User();
            user.setName(result.getString("name"));
            user.setEmail(email);
        }

        con.close();

        return user;
    }

    public User checkLogin(String email) throws SQLException,
            ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/quizdb";
        String dbUser = "root";
        String dbPassword = "6967";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String sql = "SELECT * FROM registerstudent WHERE email = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, email);
        ;

        ResultSet result = statement.executeQuery();

        User user = null;

        if (result.next()) {
            user = new User();
            user.setName(result.getString("name"));
            user.setEmail(email);
        }

        con.close();

        return user;
    }
}
