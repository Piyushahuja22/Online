/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.mysql.jdbc.Connection;
import datasource.MyConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PIYUSH AHUJA
 */
public class Controller {
    public boolean insertQuestion(String branch, String subject , String unit, String question){
      boolean value = false;
      
      try{
          
          Connection con = MyConnection.myConnectoin();
          //get max questions in table so as if max questions in row exists then add new column
          PreparedStatement ps1 = con.prepareStatement("select * from questions");
          ResultSet rs = ps1.executeQuery();
          ResultSetMetaData rsmd=rs.getMetaData();
          int maxColumnCount = rsmd.getColumnCount();
          int maxQuestionsInTable = maxColumnCount - 2;
          PreparedStatement ps2 = con.prepareStatement("select * from questions where BSUId=(select BSUId from BSUIdSelecter where branchid=? AND subjectid=? AND unit=?)");
          ps2.setString(1, branch);
          ps2.setString(2, subject);
          ps2.setString(3, unit);
          ResultSet rs1 = ps2.executeQuery();
          String totalQuestions1 = null;
          if(rs1.next())
          {          totalQuestions1 = rs1.getString("totalquestion");
          
          }
          int totalQuestions = Integer.valueOf(totalQuestions1.toString());
          
          int columnAdded = 0 ;
          
          if(maxQuestionsInTable<=totalQuestions){
              PreparedStatement ps5 = con.prepareStatement("ALTER TABLE questions ADD q" + ( totalQuestions + 1 ) + " varchar(500)");
              columnAdded = ps5.executeUpdate();
              if(columnAdded>0)
              {
                  columnAdded = 1;
              }
          }
          
           PreparedStatement ps4 = con.prepareStatement("UPDATE questions SET q"+ ( totalQuestions + 1 ) +" = ? WHERE BSUId=(select BSUId from BSUidSelecter where branchid=? AND subjectid=? AND unit=?)");
           ps4.setString(1, question);
           ps4.setString(2, branch);
           ps4.setString(3, subject);
           ps4.setString(4, unit);
           int questionAdded = ps4.executeUpdate();
            
                
          //incrementing totalquestion by 1
          Integer newTotalQuestions = totalQuestions+1;
          PreparedStatement ps3 = con.prepareStatement("UPDATE questions SET totalquestion=? WHERE BSUId=(select BSUId from BSUidSelecter where branchid=? AND subjectid=? AND unit=?)");
          ps3.setString(1, newTotalQuestions.toString());
          ps3.setString(2, branch);
          ps3.setString(3, subject);
          ps3.setString(4, unit);
          
          int k = ps3.executeUpdate();
          
          if(questionAdded>0 && k>0 && columnAdded>0){
                    value = true;
                }
          
          
      }
      catch(Exception e){
          System.out.println(e);
      }
      
      return value;
  }
  
  
  public boolean deleteQuestion(String branch, String subject ,String unit){
      boolean value = false;
  
      try{
          Connection con = MyConnection.myConnectoin();
          PreparedStatement ps = con.prepareStatement("delete from questions where BSUId=(select BSUId from BSUidSelecter where branch=? , subject=? , unit=?)");
          ps.setString(1, branch);
          ps.setString(2, subject);
          ps.setString(3, unit);
          
          int k = ps.executeUpdate();
          if(k>0){
              value = true;
          }
      }catch(Exception e){
          System.out.println(e); 
      }
      
      return value;
  }
  
  
  public List<String> getAllQuestions(String branch, String subject ,String unit){
        List<String> a = null;
        Connection con = null;
        try{
        a = new ArrayList<>();
        con = MyConnection.myConnectoin();
        PreparedStatement ps = con.prepareStatement("select * from questions where BSUId=(select BSUId from BSUIdSelecter where branchid=? AND subjectid=? AND unit=?)");
        ps.setString(1, branch);
        ps.setString(2, subject);
        ps.setString(3, unit);
        ResultSet rs = ps.executeQuery();
        int totalquestion = Integer.valueOf(rs.getString(2));
        int k = 1;
        while(k<=totalquestion){
            String s = rs.getString(k+1);
            a.add(s);
            k++;
        }
        
        }
        catch(SQLException e){
            System.out.println(e);
        }
        
        return a;
    }
  
  
}
