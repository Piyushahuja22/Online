<%-- 
    Document   : AddNewQuestion2
    Created on : May 13, 2017, 12:13:19 PM
    Author     : PIYUSH AHUJA
--%>

<%@page import="controller.Controller"%>
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
            //Get branch, subject and unit from previous session
            String branch = session.getAttribute("branch").toString();
            String subject = session.getAttribute("subject").toString();
            String unit = session.getAttribute("unit").toString();
            
            
            String questionString = request.getParameter("txtquestion");
            
            if(questionString!=null){
            try{
            Connection connection = MyConnection.myConnectoin();
            Controller con = new Controller();
            
            boolean flag = con.insertQuestion(branch, subject, unit, questionString);
            if(flag){
                 out.print("Question added Succesfully...");
                    
            }else{
                out.print("Question Not added...");
            }

}
catch(Exception e)
{ 
    out.print(e);
}}
else //question == null

{
        %>
        <form action="AddNewQuestion.jsp" method="post">
            <textarea rows="4" cols="50" name="txtquestion" placeholder="Enter Your Question here...."></textarea>
            <input type="submit" value="Add Question">
        </form>
        
        <%
           
                }
        %>
    </body>
</html>
