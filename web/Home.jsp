<%-- 
    Document   : Home
    Created on : Apr 25, 2017, 3:31:52 PM
    Author     : PIYUSH AHUJA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="datasource.MyConnection"%>
<%@page import="java.net.ConnectException"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
                session = request.getSession(false);
            if(session.getCreationTime() == (Long)session.getAttribute("sessionTime")){
            %>
        <div class="leftdiv">
            <ul style="list-style-type:none">
                <a href="QPSelector.jsp"><li>Question Papers</li></a>
                <a href="https://www.google.co.in/"><li>Assignment Papers</li></a>
                <a href="https://www.google.co.in/"><li>Test Papers</li></a>
                <a href="https://www.google.co.in/"><li>Answers</li></a>
            </ul>  
        </div>
        
        
        <div class="rightdiv">
            
            
            <h2>Welcome <%=session.getAttribute("username") %></h2><br>
            <%
                String userName = session.getAttribute("username").toString();
                ResultSet rs = null ;
                String name,department,subjects;
                try{
                    
                    Connection connection = MyConnection.myConnectoin();
                    PreparedStatement ps = connection.prepareStatement("select * from facultydetails where username=?");
                    ps.setString(1, userName);
                    rs = ps.executeQuery();
                    if(rs.next()){
                        
                    }
                }catch(Exception e){
                    System.out.println(e);
                }
            %>
            
        </div>
            <center>
                <div id="FacultyDetailsDiv">
                    
                    <h2>Faculty Details</h2><br>
                    <h3>Name :</h3><%=rs.getString(2)%><br>
                    <h3>Department:</h3><%=rs.getString(3)%><br>
                    <h3>Subjects:</h3><%=rs.getString(4)%><br>
                    
                </div>
            
    <br>
    <a href="QPSelector.jsp">Add new Question</a>
            </center>
    
    <%
        }//Session 
    %>
    </body>
</html>
