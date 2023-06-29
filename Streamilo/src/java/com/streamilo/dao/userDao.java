/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.streamilo.dao;

import com.streamilo.entity.User;
import com.streamilo.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author asus
 */
public class userDao {
    ConnectionProvider cp=new ConnectionProvider();
    public boolean addUser(User u){
        boolean f=false;
        Connection con=cp.getConnection();
        try {
            String query="insert into users(username,email,phone,password) values(?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPhone());
            ps.setString(4, u.getPassword());
            ps.executeUpdate();
            f=true;
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        return f;
    }
     public User getUsernameAndpass(String uname,String pass){
        User user=null;
        try {
            Connection con=cp.getConnection();
            String query="select * from users where username=? and password=?";
            PreparedStatement ps =con.prepareStatement(query);
            ps.setString(1, uname);
            ps.setString(2, pass);
            ResultSet set = ps.executeQuery();
            
            if(set.next()){
                user=new User();
                user.setId(set.getInt("id"));
                user.setUsername(set.getString("username"));
                user.setPassword(set.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
         return user;
    }
}
