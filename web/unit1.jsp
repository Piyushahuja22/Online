<%--    
    Document   : new
    Created on : Apr 27, 2017, 1:54:39 AM
    Author     : PIYUSH AHUJA
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="datasource.MyConnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="controller.Controller"%>
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
                
            
            String branch = session.getAttribute("branch").toString();
            String subject = session.getAttribute("subject").toString();
            String unit = session.getAttribute("unit").toString();
            
        %>
        
        <h3>Choose from unit <%=unit %></h3>
        <%
            if(subject!=null && branch!=null && unit!=null){
                
                String[] chk = request.getParameterValues("selectquestion");
                ArrayList selectedQuestion = new ArrayList<String>();
                
            
               if (chk != null) 
                    {
                       
                       for (int i = 0; i < chk.length; i++) 
                       {
                          selectedQuestion.add(chk[i]);
                          out.println ("<b>"+chk[i]+"<b>");
                       }
                       //adding 0 (zero) at last of each unit question value
                       selectedQuestion.add(0);
                       
                       //clubbing selected questions with sesssion object
                       session.setAttribute("selectedQuestion", selectedQuestion);
                       session.setAttribute("unit", unit);
                       response.sendRedirect("unit2.jsp");
                    }

        %>
        <form action="unit1.jsp">
        <center>
        <table border="1" style="width:80%;">
            <tr>
                <th>Serial No</th>
                <th>Question</th>
                <th>Select</th>
            </tr>
            <%
                Controller controller = new Controller();
                List<String> questions = new ArrayList();
                
                Connection con = MyConnection.myConnectoin();
                PreparedStatement ps = con.prepareStatement("select * from questions where BSUId=(select BSUId from BSUIdSelecter where branchid=? AND subjectid=? AND unit=?)");
                ps.setString(1, branch);
                ps.setString(2, subject);
                ps.setString(3, unit);
                ResultSet rs = ps.executeQuery();
                int totalquestions = 0;
                
                if(rs.next()){
                    
                    totalquestions = Integer.valueOf(rs.getString(2));
                
                
                    
                    for (int k = 1; k<=totalquestions ; k++) {
        %>
            <tr>
                <td><%=k%></td>
                <td><% out.print(rs.getString(k+2)); %></td>
                <td><input type="checkbox" name="selectquestion" value="<%=k %>"></td>
            </tr>
        <% 

               }
        }
}

}//session
        %>
        </table>
        </center>
        <input type="submit" value="Submit">
        </form>
    </body>
</html>
