<%-- 
    Document   : QPSelecter2
    Created on : Apr 27, 2017, 2:45:17 PM
    Author     : PIYUSH AHUJA
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
        %>
        
        <h1>Select deltails for Paper</h1>
        
        <%   
            //Get branch from previous session
            String branch = session.getAttribute("branch").toString();
            
            //Get subjects as per branch
            String subject1 = session.getAttribute("subject1").toString();
            String subject2 = session.getAttribute("subject2").toString();
            String subject3 = session.getAttribute("subject3").toString();
            String subject4 = session.getAttribute("subject4").toString();
            String subject5 = session.getAttribute("subject5").toString();
            
            //Get subject from dropdown
            String subject = request.getParameter("selectsubject");
            String unit = request.getParameter("selectunit");
            
            
            if(subject!=null && unit!=null){
            //add to session object and redirect to new.jsp
                    session.setAttribute("subject", subject);
                    session.setAttribute("unit", unit);
                    String submitClicked = request.getParameter("submitBtn");
                    String addNewQuestionClicked = request.getParameter("addNewQuestionBtn");
                    
                    if(submitClicked!=null)
                    {   response.sendRedirect("unit1.jsp");}
                    if(addNewQuestionClicked!=null)
                    {   response.sendRedirect("AddNewQuestion.jsp");}
            }
            else{
            %>
            
            <center>
                <form action="QPSelecter2.jsp" method="post">
            SUBJECT:
            <select name="selectsubject" required>
                <option value="">Select Subject</option>
                <option value="1"><%= subject1 %></option>
                <option value="2"><%= subject2 %></option>
                <option value="3"><%= subject3 %></option>
                <option value="4"><%= subject4 %></option>
                <option value="5"><%= subject5 %></option>
            </select>
            
            UNIT:
            <select name="selectunit" required>
                <option value="">SELECT UNIT</option>
                <option value="1">Unit 1</option>
                <option value="2">Unit 2</option>
                <option value="3">Unit 3</option>
                <option value="4">Unit 4</option>
                <option value="5">Unit 5</option>
            </select>
            <br>
            <input type="submit" value="Submit" name="submitBtn" onclick="btnSubmitClicked()">
            </form>
            </center>
    <center>
        <form action="AddNewQuestion.jsp" method="post">
            <input type="submit" value="Add New Question" name="addNewQuestionBtn" onclick="btnAddNewQuestionClicked()">
        </form>
    </center>
            <%
                }
}//session
            %>
            
        
    </body>
</html>
