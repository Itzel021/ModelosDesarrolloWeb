
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ClasesJava.*;

@WebServlet("/ConsultarAsesoria")
public class ConsultarAsesoria extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el idSolicitud del formulario
        int idSolicitud = Integer.parseInt(request.getParameter("idSolicitud"));

        // Llamar al método para obtener los detalles de la solicitud
        Map<String, Object> detallesSolicitud = Consultas.obtenerDetallesSolicitud(idSolicitud);
        
        // Obtener la matrícula del mapa detallesSolicitud
        Integer matricula = (Integer) detallesSolicitud.get("matricula");
        Integer idProfesor = (Integer) detallesSolicitud.get("idProfesor");
        
        Map<String, Object> detallesAlumno = Consultas.obtenerDetallesAlumno(matricula.intValue());
        String nombreProfesor = Consultas.obtenerNombreProfesor(idProfesor.intValue());
        //String programaEducativo = Consultas.obtenerProgramaEducativo(matricula.intValue());
        
        // Añadir los detalles de la solicitud al objeto request
        request.setAttribute("detallesSolicitud", detallesSolicitud);
        request.setAttribute("detallesAlumno", detallesAlumno);
        request.setAttribute("nombreProfesor", nombreProfesor);
        //request.setAttribute("programaEducativo", programaEducativo);
        // Enviar la solicitud al JSP para que se muestren los detalles
        request.getRequestDispatcher("ConsultarEstado.jsp").forward(request, response);

    }
}
