<%-- 
    Document   : QPSelector
    Created on : Apr 26, 2017, 4:32:30 PM
    Author     : PIYUSH AHUJA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="datasource.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <%
            session = request.getSession(false);
            if(session.getCreationTime() == (Long)session.getAttribute("sessionTime")){
            String branch = request.getParameter("branch");
            
            int k = 0;
            
            String subject1=null;
            String subject2=null;
            String subject3=null;
            String subject4=null;
            String subject5=null;
            
            if(branch!=null){
            
                
            
                if(branch.equals("cse"))
                {
                  
                  k = 1;
                }
                if(branch.equals("it"))
                {
                  k = 2;
                }
                if(branch.equals("ec"))
                {
                  k = 3;
                }
                if(branch.equals("civil"))
                {
                  k = 4;
                }
                if(branch.equals("mech"))
                {
                  k = 5;
                }
                
                
                
                switch(k){
                    case 1 : {
                        try{
                            Connection connnection = MyConnection.myConnectoin();
                            PreparedStatement ps = connnection.prepareStatement("select * from subjectlist where branch=?");
                            ps.setString(1, branch);
                            ResultSet rs = ps.executeQuery();
                            if(rs.next()){
                                subject1 = rs.getString(2);
                                subject2 = rs.getString(3);
                                subject3 = rs.getString(4);
                                subject4 = rs.getString(5);
                                subject5 = rs.getString(6);
                            
                            }
                            
                        }
                        catch(Exception e){
                            out.println(e);
                        }
                        
                        break;
                }
                    case 2 :{
                        try{
                            Connection connnection = MyConnection.myConnectoin();
                            PreparedStatement ps = connnection.prepareStatement("select * from subjectlist where branch=?");
                            ps.setString(1, branch);
                            ResultSet rs = ps.executeQuery();
                            if(rs.next()){
                                subject1 = rs.getString(2);
                                subject2 = rs.getString(3);
                                subject3 = rs.getString(4);
                                subject4 = rs.getString(5);
                                subject5 = rs.getString(6);
                            }
                        }
                        catch(Exception e){
                            System.out.println(e);
                        }
                        break;
                    }
                    
                    case 3 :{
                        try{
                            Connection connnection = MyConnection.myConnectoin();
                            PreparedStatement ps = connnection.prepareStatement("select * from subjectlist where branch=?");
                            ps.setString(1, branch);
                            ResultSet rs = ps.executeQuery();
                            if(rs.next()){
                                subject1 = rs.getString(2);
                                subject2 = rs.getString(3);
                                subject3 = rs.getString(4);
                                subject4 = rs.getString(5);
                                subject5 = rs.getString(6);
                            }
                        }
                        catch(Exception e){
                            System.out.println(e);
                        }
                        break;
                    }
                    
                    case 4 :{
                        try{
                            Connection connnection = MyConnection.myConnectoin();
                            PreparedStatement ps = connnection.prepareStatement("select * from subjectlist where branch=?");
                            ps.setString(1, branch);
                            ResultSet rs = ps.executeQuery();
                            if(rs.next()){
                                subject1 = rs.getString(2);
                                subject2 = rs.getString(3);
                                subject3 = rs.getString(4);
                                subject4 = rs.getString(5);
                                subject5 = rs.getString(6);
                            }
                        }
                        catch(Exception e){
                            System.out.println(e);
                        }
                        break;
                    }
                    
                    case 5 :{
                        try{
                            Connection connnection = MyConnection.myConnectoin();
                            PreparedStatement ps = connnection.prepareStatement("select * from subjectlist where branch=?");
                            ps.setString(1, branch);
                            ResultSet rs = ps.executeQuery();
                            if(rs.next()){
                                subject1 = rs.getString(2);
                                subject2 = rs.getString(3);
                                subject3 = rs.getString(4);
                                subject4 = rs.getString(5);
                                subject5 = rs.getString(6);
                            }
                        }
                        catch(Exception e){
                            System.out.println(e);
                        }
                        break;
                    }
                }    
                session.setAttribute("branch", branch);
                session.setAttribute("subject1", subject1);
                session.setAttribute("subject2", subject2);
                session.setAttribute("subject3", subject3);
                session.setAttribute("subject4", subject4);
                session.setAttribute("subject5", subject5);
                response.sendRedirect("QPSelecter2.jsp");
            }
            else{
                    
                %>
                
    <center>
        <div class="BranchSelecter">
        <form action="QPSelector.jsp" method="post">
        
            BRANCH:
            <select name="branch" required>
                <option value="">SELECT ONE</option>
                <option value="cse">COMPUTER SCIENCE</option>
                <option value="it">INFORMATION TECHNOLOGY</option>
                <option value="ec">ELECTRONIC AND COMMUNICATION</option>
                <option value="civil">CIVIL</option>
                <option value="mech">MECHANICAL</option>
            </select><br>
        
        <input type="submit" value="Submit">
        </form>
        </div>
    </center>
        <%
            }
}//Session
        %>
    </body>
</html>
