/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.streamilo.dao;

import com.streamilo.entity.submitWeb;
import com.streamilo.helper.ConnectionProvider;
import java.beans.Statement;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author asus
 */
public class webDao {

    ConnectionProvider cp = new ConnectionProvider();

    public boolean addWebDetail(submitWeb sw) {
        Connection con = cp.getConnection();
        boolean res = false;
        try {
            String query = "insert into websubmit(web_name,web_purpose,web_goal,web_photo) values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, sw.getW_name());
            ps.setString(2, sw.getW_purp());
            ps.setString(3, sw.getW_goal());
            ps.setString(4, sw.getW_pto());
            ps.executeUpdate();

            //upload
            res = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return res;
    }
//    

    public ArrayList<submitWeb> getAllWebInfo() {
        ArrayList<submitWeb> list = new ArrayList<>();
        
        try {
            ConnectionProvider cp = new ConnectionProvider();
            Connection con = cp.getConnection();

            String q = "select * from websubmit";
            java.sql.Statement st = con.createStatement();
            ResultSet set = st.executeQuery(q);
            
            while(set.next()){
                String wname=set.getString("web_name");
                String wpurp=set.getString("web_purpose");
                String wgoal=set.getString("web_goal");
                String wpto=set.getString("web_photo");
                
                submitWeb s =new submitWeb(wname, wpurp, wgoal, wpto);
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

}
