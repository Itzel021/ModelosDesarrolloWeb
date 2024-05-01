
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ClasesJava.*;

public class InsertarSolicitud extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recuperar los parámetros enviados desde el formulario

        int matricula = Integer.parseInt(request.getParameter("matricula"));
        String fecha = request.getParameter("fecha");

        String asunto = request.getParameter("asunto");
        String profesor = request.getParameter("profesor");
        String[] parts = profesor.split("_");
        int idProfesor = Integer.parseInt(parts[0]);
        String nombreProfesor = parts[1];
        String estado = "Pendiente";
        // Obtener la cadena de hora del formulario
        String hora = request.getParameter("hora");

        // Dividir la cadena de hora en horas y minutos
        String[] partesHora = hora.split(":");
        int horas = Integer.parseInt(partesHora[0]);
        int minutos = Integer.parseInt(partesHora[1]);

        // Crear un objeto Time con la hora y los minutos
        java.sql.Time tiempo = new java.sql.Time(horas, minutos, 0);
        // Insertar la solicitud en la base de datos
        boolean exito = Consultas.insertarSolicitud(matricula, fecha, tiempo, asunto, idProfesor, estado);
        int idSolicitud = Consultas.obtenerIdSolicitudRecienCreada();
        // Enviar una respuesta al cliente
        if (exito) {
            // Agregar el ID de la solicitud como un atributo de la solicitud
            request.setAttribute("idSolicitud", idSolicitud);
            // Redirigir a una página JSP en caso de éxito
            response.sendRedirect("exito.jsp");
        } else {
            response.getWriter().println("Error al insertar la solicitud");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Si el servlet no admite el método GET, podrías redirigir a una página de error o realizar alguna otra acción
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Este servlet solo admite solicitudes POST");
    }
}
