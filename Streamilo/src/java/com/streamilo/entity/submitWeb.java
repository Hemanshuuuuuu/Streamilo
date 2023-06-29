/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.streamilo.entity;

/**
 *
 * @author asus
 */
public class submitWeb {
    private String w_name;
    private String w_purp;
    private String w_goal;
    private String w_pto;

    public submitWeb() {
    }

    public submitWeb(String w_name, String w_purp, String w_goal,String w_pto) {
        this.w_name = w_name;
        this.w_purp = w_purp;
        this.w_goal = w_goal;
        this.w_pto = w_pto;
    }

    public String getW_name() {
        return w_name;
    }

    public void setW_name(String w_name) {
        this.w_name = w_name;
    }

    public String getW_purp() {
        return w_purp;
    }

    public void setW_purp(String w_purp) {
        this.w_purp = w_purp;
    }

    public String getW_goal() {
        return w_goal;
    }

    public void setW_goal(String w_goal) {
        this.w_goal = w_goal;
    }

   

    public String getW_pto() {
        return w_pto;
    }

    public void setW_pto(String w_pto) {
        this.w_pto = w_pto;
    }
    
}
