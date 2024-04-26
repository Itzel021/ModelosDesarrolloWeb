<%-- 
    Document   : index
    Created on : 24 abr 2024, 00:20:00
    Author     : itzee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <title>Inicio</title>
    </head>
    <body>
        <div class="main">  	
            <input type="checkbox" id="chk" aria-hidden="true">
            <div class="login">
                <form class="form">
                    <div class="logo-container">
                        <img src="estudiante.png" alt="Estudiante" class="logo">
                        <label for="chk" aria-hidden="true">Estudiante</label>
                    </div>
                    <div id="welcome-student">
                        <h3>Bienvenido</h3>
                        <p>Ingresa tu número de solicitud para consultar su estado.</p>
                    </div>
                    <div class="input-group">
                        <input type="text" class="input" placeholder="Número de solicitud">
                        <button class="button-student">Consultar</button>
                    </div>
                    <button class="button-student">Solicitar Asesoría</button>
                </form>
            </div>

            <div class="register">
                <form class="form">
                    <div class="logo-container">
                        <img src="profesor.png" alt="Profesor" class="logo">
                        <label for="chk" aria-hidden="true">Profesor</label>
                    </div>
                    <div id="welcome-teacher">
                        <h3>Bienvenido</h3>
                        <p>Ingresa tu identificador de docente para consultar tus asesorias.</p>
                    </div>
                    <div class="input-group">
                        <input type="text" class="input" placeholder="ID de profesor">
                        <button class="button-teacher">Acceder</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
