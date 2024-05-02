package ClasesJava;

import java.util.List;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.sql.Statement;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.sql.Time;
import java.sql.ResultSetMetaData;
/**
 *
 * @author itzee
 */
public class Consultas {

    public static List<String[]> obtenerProgramas() {
        List<String[]> programas = new ArrayList<>();
        try {
            Connection conn = ConectaDB.obtenConexion();
            PreparedStatement ps = conn.prepareStatement("SELECT id_programaedu, nombre FROM programa_educativo");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String[] programa = new String[2];
                programa[0] = rs.getString("id_programaedu");
                programa[1] = rs.getString("nombre");
                programas.add(programa);
            }
            ConectaDB.cerrarConexion();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return programas;
    }

    public static List<String> obtenerNombresMateriasPorPrograma(String idPrograma) {
        List<String> nombresMaterias = new ArrayList<>();
        try {
            Connection conn = ConectaDB.obtenConexion();
            PreparedStatement ps = conn.prepareStatement("SELECT DISTINCT nombre FROM materias WHERE id_programaedu = ?");
            ps.setString(1, idPrograma);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String nombreMateria = rs.getString("nombre");
                nombresMaterias.add(nombreMateria);
            }
            // Cerrar ResultSet, PreparedStatement y Connection en este orden.
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nombresMaterias;
    }

// Método para obtener el nombre del programa educativo dado su ID
    public static String obtenerNombrePrograma(String idPrograma) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String nombrePrograma = null;

        try {
            // Establecer conexión con la base de datos
            conn = ConectaDB.obtenConexion(); // Suponiendo que tienes una clase de conexión llamada ConexionDB

            // Consulta SQL para obtener el nombre del programa educativo
            String query = "SELECT nombre FROM programa_educativo WHERE id_programaedu = ?";

            // Preparar la declaración SQL
            stmt = conn.prepareStatement(query);
            stmt.setString(1, idPrograma);

            // Ejecutar la consulta
            rs = stmt.executeQuery();

            // Verificar si se encontró el programa y obtener su nombre
            if (rs.next()) {
                nombrePrograma = rs.getString("nombre");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return nombrePrograma;
    }

    public static Map<String, Integer> obtenerProfesoresPorMateria(String nombreMateria) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Map<String, Integer> profesores = new HashMap<>();

        try {
            conn = ConectaDB.obtenConexion();
            String query = "SELECT p.id_profesor, p.nombre, p.apellido_paterno, p.apellido_materno "
                    + "FROM profesores p "
                    + "INNER JOIN materias m ON p.id_profesor = m.id_profesor "
                    + "WHERE m.nombre = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, nombreMateria);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int idProfesor = rs.getInt("id_profesor");
                String nombre = rs.getString("nombre");
                String apellidoPaterno = rs.getString("apellido_paterno");
                String apellidoMaterno = rs.getString("apellido_materno");
                String nombreCompleto = nombre + " " + apellidoPaterno + " " + apellidoMaterno;
                profesores.put(nombreCompleto, idProfesor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return profesores;
    }

    public static Time formatTime(java.sql.Time hora) {
        LocalTime localTime = hora.toLocalTime();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        String formattedTime = localTime.format(formatter);
        return Time.valueOf(formattedTime);
    }

    public static int insertarSolicitud(int matricula, String fecha, java.sql.Time hora, String asunto, int idProfesor, String estado) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int idSolicitud = -1; // Inicializar con un valor inválido

        try {
            // Establecer conexión con la base de datos
            conn = ConectaDB.obtenConexion();

            // Consulta SQL para insertar la solicitud
            String query = "INSERT INTO solicitudes (fecha_asesoria, hora_asesoria, asunto, estado, id_profesor, matricula) VALUES (?, ?, ?, ?, ?, ?)";

            // Preparar la declaración SQL
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            stmt.setDate(1, java.sql.Date.valueOf(fecha));
            stmt.setTime(2, formatTime(hora));
            stmt.setString(3, asunto);
            stmt.setString(4, estado);
            stmt.setInt(5, idProfesor);
            stmt.setInt(6, matricula);

            // Ejecutar la consulta
            int filasInsertadas = stmt.executeUpdate();

            // Obtener las claves generadas por la base de datos
            rs = stmt.getGeneratedKeys();

            // Si se insertó un registro, obtener el id_asesoria
            if (filasInsertadas > 0 && rs.next()) {
                idSolicitud = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return idSolicitud;
    }

    public static Map<String, Object> obtenerDetallesSolicitud(int idSolicitud) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Map<String, Object> detallesSolicitud = new HashMap<>();

        try {
            // Establecer conexión con la base de datos
            conn = ConectaDB.obtenConexion();

            // Consulta SQL para obtener los detalles de la solicitud
            String query = "SELECT * FROM solicitudes WHERE id_solicitud = ?";

            // Preparar la declaración SQL
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, idSolicitud);

            // Ejecutar la consulta
            rs = stmt.executeQuery();

            // Verificar si se encontró la solicitud con el idSolicitud especificado
            if (rs.next()) {
                detallesSolicitud.put("idSolicitud", rs.getInt("id_solicitud"));
                detallesSolicitud.put("fechaAsesoria", rs.getDate("fecha_asesoria"));
                detallesSolicitud.put("horaAsesoria", rs.getTime("hora_asesoria"));
                detallesSolicitud.put("asunto", rs.getString("asunto"));
                detallesSolicitud.put("idProfesor", rs.getInt("id_profesor"));
                detallesSolicitud.put("matricula", rs.getInt("matricula"));
                detallesSolicitud.put("estado", rs.getString("estado"));
                // Agrega otros campos según tu esquema de base de datos
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return detallesSolicitud;
    }

    
}
