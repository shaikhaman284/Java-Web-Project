package DatabaseDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class QuestionDAO {

    public Question GetQuestion(String count) throws SQLException,
            ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/quizdb";
        String dbUser = "root";
        String dbPassword = "6967";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String sql = "SELECT * FROM questionsopt WHERE quesno = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, count);

        ResultSet result = statement.executeQuery();

        Question ques = null;

        if (result.next()) {
            ques = new Question();
            ques.setQuestions(result.getString("questions"));
            ques.setOpt1(result.getString("opt1"));
            ques.setOpt2(result.getString("opt2"));
            ques.setOpt3(result.getString("opt3"));
            ques.setOpt4(result.getString("opt4"));
            ques.setAnswers(result.getString("answers"));

        }

        con.close();

        return ques;
    }

    public Question GetRowno() throws SQLException,
            ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/quizdb";
        String dbUser = "root";
        String dbPassword = "6967";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String query = "select count(1) as NoRows from " + "questionsopt";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        Question ques = null;

        if (rs.next()) {
            ques = new Question();
            ques.setRowno(rs.getInt("NoRows"));
        }
        return ques;

    }

    public void InsertResp(String email, int quesno, String question, String userAnswer, String answer, int marks) throws SQLException,
            ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/quizdb";
        String dbUser = "root";
        String dbPassword = "6967";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String query = "insert into user_answer (email, quesno, question, user_answer, correct_answer, marks) values(?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1, email);
        pst.setInt(2, quesno);
        pst.setString(3, question);
        pst.setString(4, userAnswer);
        pst.setString(5, answer);
        pst.setInt(6, marks);
        pst.executeUpdate();

    }

}
