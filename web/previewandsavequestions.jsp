<%-- 
    Document   : previewquestions
    Created on : May 1, 2017, 7:20:02 PM
    Author     : PIYUSH AHUJA
--%>

<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.CMYKColor"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.*"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="datasource.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="controller.Controller"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  session = request.getSession(false);
            if(session.getCreationTime() == (Long)session.getAttribute("sessionTime")){
            
            %><center><%
         try {
            ArrayList selectedQuestion = new ArrayList<String>();
            String[] questionsToFile = null;
            ArrayList<String> questions  = new ArrayList();
            selectedQuestion = (ArrayList<String>) session.getAttribute("selectedQuestion");
            //out.print(selectedQuestion);
            String branch = session.getAttribute("branch").toString();
            String subject = session.getAttribute("subject").toString();
            Integer unit = 1;
            
            %><h2>Unit = <%=unit%></h2><%
            %><br><%
            Controller controller = new Controller();
            int k = 0 ;
            
            
            Connection connection = MyConnection.myConnectoin();
            
            
            Document document = new Document();
            Font blackFont = FontFactory.getFont(FontFactory.TIMES, 12, Font.BOLD, new CMYKColor(255, 255, 255, 255));
            Font rollNOFont = FontFactory.getFont(FontFactory.TIMES_ROMAN, 10 ,Font.NORMAL); 
            Font questionFont = FontFactory.getFont(FontFactory.TIMES_ROMAN, 10 ,Font.BOLD); 
            
                PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("e:\\HelloWorld.pdf"));
                document.open();
                //document.add(new Paragraph("A Hello World PDF document."));
                
                //Set attributes here
                document.addAuthor("Lokesh Gupta");
                document.addCreationDate();
                document.addCreator("HowToDoInJava.com");
                document.addTitle("Set Attribute Example");
                document.addSubject("An example to show how attributes can be added to pdf files.");
                
                /*
                
                //Add Image
                Image image1 = Image.getInstance("E:\\logo.png");
                //Fixed Positioning
                image1.setAbsolutePosition(100f, 550f);
                //Scale to new height and new width of image
                image1.scaleAbsolute(150, 150);
                //Add to document
                document.add(image1);
                
                */
                
                String s = null ;
              
              if(branch.equals("cse"))
                  s = "Computer Science and Engineering";
              if(branch.equals("it"))
                  s = "Informatio Technology";
              if(branch.equals("ec"))
                  s = "Electronics and Communication";
              if(branch.equals("civil"))
                  s = "Civil Engineering";
              if(branch.equals("mech"))
                  s = "Mechanical Engineering";
                
            
                String subjectName = null ;
                PreparedStatement psx = connection.prepareStatement("select * from subjectlist where branch=?");
                            psx.setString(1, branch);
                            ResultSet rsx = psx.executeQuery();
                            if(rsx.next()){
                                subjectName = rsx.getString((Integer.valueOf(subject)+1));
                            }
                
                Paragraph paragraphOne = new Paragraph("Department of "+s+", AITR, Indore", blackFont);
                Paragraph paragraphTwo = new Paragraph("Session July-Dec 2015", blackFont);
                Paragraph paragraphThree = new Paragraph("Roll  No..................................", rollNOFont);
                Paragraph subjectCode = new Paragraph("CS-305", blackFont);
                Paragraph semester = new Paragraph("B.E. III Semester (MST-1)", blackFont);
                Paragraph subject1 = new  Paragraph(subjectName, blackFont);
                Paragraph time = new Paragraph("TIME: 50 Minutes                                                                                                                                                                      MM:20", rollNOFont);
                Paragraph note = new Paragraph("\nNOTE: i) Answer two questions. In each question part A, B is compulsory and C part has internal choice." +
"\n" +
"ii)	All parts of each question are to be attempted at one place." +
"\n" +
"iii)	Each question carry equal distribution of marks, out of which part A (Max.50 words) carry 2 marks, part B (Max.100 words) carry 3 marks, part C (Max.400 words) carry 5 marks. ", rollNOFont);
                String dash = "_____________________________________________________________________________";
                               
                Paragraph line = new Paragraph(dash);
                
                
                
                paragraphOne.setAlignment(Paragraph.ALIGN_CENTER);
                paragraphTwo.setAlignment(Paragraph.ALIGN_CENTER);
                paragraphThree.setAlignment(Paragraph.ALIGN_RIGHT);
                subjectCode.setAlignment(Paragraph.ALIGN_CENTER);
                subject1.setAlignment(Paragraph.ALIGN_CENTER);
                semester.setAlignment(Paragraph.ALIGN_CENTER);
                time.setAlignment(Paragraph.ALIGN_LEFT);
                note.setAlignment(Paragraph.ALIGN_LEFT);
                
                
                document.add(paragraphOne);
                document.add(paragraphTwo);
                document.add(paragraphThree);
                document.add(subject1);
                document.add(subjectCode);
                document.add(time);
                document.add(note);
                document.add(line);
                
              
              
              
              
              
              
              int serialNo = 1;
              
              
              Paragraph unitParagraph = new Paragraph("unit = "+ unit.toString(), blackFont);
                document.add(unitParagraph);
              
            while(unit<=5 && k<=selectedQuestion.size()){
                //print questions from database and increment unit number on getting 0 in selectedQuestion
                Connection con = MyConnection.myConnectoin();
                PreparedStatement ps = con.prepareStatement("select * from questions where BSUId=(select BSUId from BSUIdSelecter where branchid=? AND subjectid=? AND unit=?)");
                ps.setString(1, branch);
                ps.setString(2, subject);
                ps.setString(3, unit.toString());
                ResultSet rs = ps.executeQuery();
                
                
                if(rs.next()){
                    
                    
                    if(selectedQuestion.get(k).equals(0)){
                        //Do nothing just increment counter by 1
                        
                    }
                    else{
                        //Get questions from database and print on page
                        Integer q = Integer.valueOf(selectedQuestion.get(k).toString());
                        
                        //printing questions
                        out.print(rs.getString(Integer.valueOf(q)+2));
                        
                        //Write to file
                        String questionString = rs.getString(Integer.valueOf(q)+2).toString();
                        Paragraph questionParagraph = new Paragraph(serialNo + ". " + questionString, questionFont);
                        document.add(questionParagraph);
                        
                        serialNo++;
                        
                        
                        %><br><%
                        %><br><%
                    }
                    
                }
                
                if(selectedQuestion.get(k).equals(0))
                {   
                
                    unit++;
                    if(unit<6)
                    {
                    %><h2>Unit = <%=unit%></h2><%
                         
                        
                        Paragraph unitParagraph1 = new Paragraph("unit = "+ unit.toString(), blackFont);
                        document.add(unitParagraph1);
                        serialNo = 1 ;
                        
                        }
                    %>
                    <br>
                    <%
                       
                }

                k++;

            }
            %></center><%
                
                //out.print("pdf Created");
                
                //closing document and writer
                document.close();
                writer.close();
                } catch (Exception e)
               {
                    out.print(e);
                    }
               
        %>
        <a href="Home.jsp">Home</a>
        
        <%
            }//Session
        %>
    </body>
</html>
