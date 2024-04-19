

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class MisAlumnos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String DNI, Nombre, Apellido, Apellido2, Linea, Resultado="";
        int Edad, Posicion;
        try{
            //Class.forName("com.mysql.cj.jdbc.Driver");
            Class.forName("com.mysql.jdbc.Driver");
            Connection Conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/misalumnos", "root", "");
            Statement SentenciaSQL = Conexion.createStatement();
            ResultSet alumnos = SentenciaSQL.executeQuery("SELECT * FROM datospersonales");
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Mis Alumnos</title>");
            out.println("<style>");
            out.println("table,th, td{ border: 1px solid black; }");
            out.println("thead { color:red; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body align='center'>");
            out.println("<h1> Listado de Alumnos </h1>");
            out.println("<center>");
            out.println("<table>");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Número</th>");
            out.println("<th>Matrícula</th>");
            out.println("<th>Nombre</th>");
            out.println("<th>Apellido Paterno</th>");
            out.println("<th>Apellido Materno</th>");
            out.println("<th>Edad</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            
            while (alumnos.next()) {
                DNI = alumnos.getString("matricula");
                Nombre = alumnos.getString("nombre");
                Apellido = alumnos.getString("ap_pat");
                Apellido2 = alumnos.getString("ap_mat");
                Edad = alumnos.getInt("edad");
                Posicion = alumnos.getRow();
                
                out.println("<tr><td>"+Posicion+"</td><td>"+DNI+"</td><td>"+Nombre+"</td><td>"+Apellido+"</td><td>"+Apellido2+"</td><td>"+Edad+"</td></tr>");
                }
            out.println("</tbody>");
            out.println("</table>");
            out.println("</center>");
            out.println("</body>");
            out.println("</html>");
            alumnos.close();
            Conexion.close();
            SentenciaSQL.close();
           }catch(ClassNotFoundException e)
                { 
                 System.out.println("No se pudo cargar el controlador: " +e.getMessage());
           }catch(SQLException e)
                { 
                 System.out.println("Excepción SQL: " + e.getMessage());
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
