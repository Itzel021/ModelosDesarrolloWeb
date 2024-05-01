<%-- 
    Document   : FormAsesoria
    Created on : 30 abr 2024, 15:57:48
    Author     : itzee
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="ClasesJava.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario de Asesoría</title>
        <link rel="stylesheet" href="estilosForm.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    </head>
    <body>
        <h1>Formulario de Asesoría</h1>
        <div class="container">
            <form action="MateriasServlet" method="post">
                <label for="nombre">Nombre:</label><br>
                <input type="text" id="nombre" name="nombre" required><br>

                <label for="matricula">Matrícula:</label><br>
                <input type="text" id="matricula" name="matricula" required><br>

                <label for="programa">Programa Educativo:</label><br>
                <select id="programa" name="programa" required>
                    <option value="">Selecciona un programa</option>
                    <%
                        List<String[]> programas = Consultas.obtenerProgramas();
                        for (String[] programa : programas) {
                    %>
                    <option value="<%=programa[0]%>"><%=programa[1]%></option>
                    <%
                        }
                    %>
                </select><br>
                <input type="submit" value="Siguiente">
            </form>
        </div>
    </body>
</html>
