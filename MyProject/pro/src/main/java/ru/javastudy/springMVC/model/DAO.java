package ru.javastudy.springMVC.model;


import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAO {
    private static void testDatabase() {
        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5432/TaskTracker";
            String login = "postgres";
            String password = "CegthCrekm##";
            Connection con = DriverManager.getConnection(url, login, password);
            try {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT type_category FROM Category");
                while (rs.next()) {
                    String str = rs.getString("type_category") + ":" + rs.getString(2);
                    System.out.println("Category:" + str);
                }
                rs.close();
                stmt.close();
            } finally {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        testDatabase();
    }
}
