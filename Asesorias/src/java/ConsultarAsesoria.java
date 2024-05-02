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

        // Añadir los detalles de la solicitud al objeto request
        request.setAttribute("detallesSolicitud", detallesSolicitud);

        // Enviar la solicitud al JSP para que se muestren los detalles
        request.getRequestDispatcher("ConsultarEstado.jsp").forward(request, response);
    }
}
