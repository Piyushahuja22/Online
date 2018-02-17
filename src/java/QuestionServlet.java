/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.CMYKColor;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PIYUSH AHUJA
 */
public class QuestionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
            Document document = new Document();
            try{
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
                
                Font blackFont = FontFactory.getFont(FontFactory.TIMES, 12, Font.BOLD, new CMYKColor(255, 255, 255, 255));
                Font rollNOFont = FontFactory.getFont(FontFactory.TIMES_ROMAN, 10 ,Font.NORMAL); 
                Paragraph paragraphOne = new Paragraph("Department of Computer Science and Engineering, AITR, Indore", blackFont);
                Paragraph paragraphTwo = new Paragraph("Session July-Dec 2015", blackFont);
                Paragraph paragraphThree = new Paragraph("Roll  No..................................", rollNOFont);
                Paragraph subjectCode = new Paragraph("CS-305", blackFont);
                Paragraph semester = new Paragraph("B.E. III Semester (MST-1)", blackFont);
                Paragraph subject = new  Paragraph("DATA STRUCTURE (SET-A)", blackFont);
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
                subject.setAlignment(Paragraph.ALIGN_CENTER);
                semester.setAlignment(Paragraph.ALIGN_CENTER);
                time.setAlignment(Paragraph.ALIGN_LEFT);
                note.setAlignment(Paragraph.ALIGN_LEFT);
                
                
                document.add(paragraphOne);
                document.add(paragraphTwo);
                document.add(paragraphThree);
                document.add(subject);
                document.add(subjectCode);
                document.add(time);
                document.add(note);
                document.add(line);
                
                out.print("pdf Created");
                
                //closing document and writer
                document.close();
                writer.close();
                } catch (Exception e)
               {
                    out.print(e);
                    }
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
