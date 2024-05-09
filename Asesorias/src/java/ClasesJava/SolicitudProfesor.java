package ClasesJava;

import java.util.Date;
import org.apache.tomcat.jni.Time;

public class SolicitudProfesor {
    private int idSolicitud;
    private Date fechaAsesoria;
    private Time horaAsesoria;
    private String asunto;
    private String estado;
    private String comentario_profesor;
    private String idProfesor;
    private String matricula;

    // Métodos getters y setters
    public int getIdSolicitud() {
        return idSolicitud;
    }
    public void setIdSolicitud(int idSolicitud) {
        this.idSolicitud = idSolicitud;
    }
    
    public Date getFechaAsesoria() {
        return fechaAsesoria;
    }

    public void setFechaAsesoria(Date fechaAsesoria) {
        this.fechaAsesoria = fechaAsesoria;
    }

    public Time getHoraAsesoria() {
        return horaAsesoria;
    }

    public void setHoraAsesoria(Time horaAsesoria) {
        this.horaAsesoria = horaAsesoria;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getIdProfesor() {
        return idProfesor;
    }

    public void setIdProfesor(String idProfesor) {
        this.idProfesor = idProfesor;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }
    
    public String getComentario_Profesor() {
        return comentario_profesor;
    }

    public void setComentario_Profesor(String comentario_profesor) {
        this.comentario_profesor = comentario_profesor;
    }

    
}
