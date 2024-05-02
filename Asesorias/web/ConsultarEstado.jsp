<%-- 
    Document   : ConsultarEstado
    Created on : 1 may 2024, 22:11:14
    Author     : itzee
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Detalles de la Solicitud</title>
        <link rel="stylesheet" href="estilosSolicitud.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="encabezado">          
            <div class="encabezado-contenedor">               
                <img src="estado.png" alt="estadoSolicitud" style="width: 100px; height: auto;">
                <h1>Detalles de la Solicitud</h1>
            </div>
        </div>
        <%
            Map<String, Object> detallesSolicitud = (Map<String, Object>) request.getAttribute("detallesSolicitud");
            if (detallesSolicitud != null && !detallesSolicitud.isEmpty()) {
        %>
        <div class="mensaje">
            <p><strong>Nombre: </strong><%=  request.getAttribute("nombreAlumno")%></p>
            <p><strong>Matricula: </strong><%= detallesSolicitud.get("matricula")%></p>
            <p><strong>Programa Educativo: </strong><%=  request.getAttribute("programaEducativo")%></p>
            <p><strong>Materia: </strong></p>
            <p><strong>Profesor: </strong><%=  request.getAttribute("nombreProfesor")%></p>
        </div>
        <div class="consulta">

            <table>
                <tr>
                    <th>ID de Solicitud</th>
                    <th>Fecha de Asesoría</th>
                    <th>Hora de Asesoría</th>
                    <th>Asunto</th>
                    <th>Estado</th>
                </tr>
                <tr>
                    <td><%= detallesSolicitud.get("idSolicitud")%></td>
                    <td><%= detallesSolicitud.get("fechaAsesoria")%></td>
                    <td><%= detallesSolicitud.get("horaAsesoria")%></td>
                    <td><%= detallesSolicitud.get("asunto")%></td>
                    <td><%= detallesSolicitud.get("estado")%></td>
                </tr>
            </table>
        </div>
        <div class="button"><a href="index.jsp">Regresar al inicio</a></div>
        <%
        } else {
        %>
        <p>No se encontró ninguna solicitud con el ID especificado.</p>
        <%
            }
        %>
    </body>
</html>

