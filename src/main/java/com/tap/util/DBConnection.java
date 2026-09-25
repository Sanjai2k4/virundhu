package com.tap.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/virundhu";

    private static final String USERNAME = "root";

    // Password is taken from Windows environment variable
    private static final String PASSWORD =
            System.getenv("DB_PASSWORD");

    public static Connection getConnection() {

        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(
                    URL,
                    USERNAME,
                    PASSWORD
            );

            System.out.println(
                    "Database connected successfully!"
            );

        } catch (ClassNotFoundException e) {

            System.out.println(
                    "JDBC Driver not found!"
            );

            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println(
                    "Database connection failed!"
            );

            e.printStackTrace();
        }

        return connection;
    }
}