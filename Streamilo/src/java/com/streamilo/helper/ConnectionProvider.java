/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.streamilo.helper;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author asus
 */
public class ConnectionProvider {

    private Connection con;

    public Connection getConnection() {
        
        try {
            try {
            if (con == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stream", "root", "Gnc123");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        } catch (Exception e) {
        }
        return con;
    }
}
