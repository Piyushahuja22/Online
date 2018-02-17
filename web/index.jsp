<%-- 
    Document   : index
    Created on : Apr 24, 2017, 8:56:58 PM
    Author     : PIYUSH AHUJA
--%>

<%@page import="controller.QuestionsDAO"%>
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
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <h1>LOGIN</h1>
        <div>
            <%
                String studentLogin = request.getParameter("studentlogin");
                String facultyLogin = request.getParameter("facultylogin");
                
                if(studentLogin!=null || facultyLogin!=null){

                    if(studentLogin!=null){
                        String studentName = request.getParameter("txtstudentusername");
                        String studentPassword = request.getParameter("txtstudentpassword");
                        
                        Connection con = MyConnection.myConnectoin();
                        PreparedStatement ps = con.prepareStatement("select * from studentlogin where username=? and password=?");
                        ps.setString(1, studentName);
                        ps.setString(2, studentPassword);
                        ResultSet rs = ps.executeQuery();
                        if(rs.next()){
                            session.setAttribute("username", studentName);
                            session.setAttribute("sessionTime", session.getCreationTime());
                            response.sendRedirect("Home.jsp");
                        }
                        else{
                            out.print("Username/Password Incorrect...");

            %>
                            <h2>You will be redirected to Login...</h2>
                            <META http-equiv="refresh" content="7;URL=http://localhost:8080/Online/index.jsp">
            <%   
                            
                        }
                    }
                    else
                        if(facultyLogin!=null)
                        {
                            String facultyName = request.getParameter("txtfacultyusername");
                            String facultyPassword = request.getParameter("txtfacultypassword");

                            Connection con = MyConnection.myConnectoin();
                            PreparedStatement ps = con.prepareStatement("select * from facultylogin where username=? and password=?");
                            ps.setString(1, facultyName);
                            ps.setString(2, facultyPassword);
                            ResultSet rs = ps.executeQuery();
                            if(rs.next()){
                                session.setAttribute("username", facultyName);
                                session.setAttribute("sessionTime", session.getCreationTime());
                                response.sendRedirect("Home.jsp");
                            }
                            else{
                                out.print("Username/Password Incorrect...");

            %>
                            <h2>You will be redirected to Login...</h2>
                            <META http-equiv="refresh" content="7;URL=http://localhost:8080/Online/index.jsp">
            <%   
                            
                        }
                        }
                }
                else{
            %><center>
            <div>
                <form action="index.jsp">
                <h3>Faculty Login</h3><br>
                User Name:<input type="text" placeholder="Enter Name" name="txtfacultyusername" required>
                Password :<input type="password" placeholder="Enter password" name="txtfacultypassword" required>
                <input type="submit" value="Login" name="facultylogin">
                </form>
            </div>
            <div>
                <form action="index.jsp">
                <h3>Student Login</h3><br>
                User Name:<input type="text" placeholder="Enter Name" name="txtstudentusername" required>
                Password :<input type="password" placeholder="Enter password" name="txtstudentpassword" required>
                <input type="submit" value="Login" name="studentlogin">
                </form>
            </div>
            </center>
        </div>
            
             
            <%
                }

                
            %>
            
           
    </body>
</html>
