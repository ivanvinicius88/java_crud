<%-- 
    Document   : ori_view_consulta_maquinario
    Created on : 05/09/2018, 19:48:59
    Author     : 42165
--%>

<%@page import="model.Maquinario"%>
<%@page import="controller.MaquinarioDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Maquin�rio</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="http://localhost:8080/orientada/"><div class="bg-danger py-2 h4">&nbsp;&nbsp;&nbsp;Trabalho&nbsp;&nbsp;&nbsp;</div></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="nav-item ">
                            <a class="nav-link" href="listasafra.jsp">Safras</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listamaquinario.jsp">Maquinarios</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listapessoa.jsp">Pessoas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listacontato.jsp">Contatos</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <br /><br /><br /><br />

        <div class="container ">
            
            <h1 class="text-center">Lista de Maquinarios</h1>
            <a class="btn btn-success my-3 col-md-2" href="incluimaquinario.jsp">Novo</a>
            <table class="table table-bordered table-striped text-center " border="1">
                <tr class="thead-dark">
                    <th>C�digo</th>
                    <th>Descri��o</th>
                    <th>Ano</th>
                    <th>Valor</th>
                    <th>Op��es</th>
                </tr>
                <%
                    Connection conexao = (Connection) session.getAttribute("conexao");
                    ArrayList lista = MaquinarioDB.getMaquinario(conexao);
                    for (int i = 0; i < lista.size(); i++) {
                        Maquinario maquinario = (Maquinario) lista.get(i);
                %>
                <tr>
                    <td><%=maquinario.getCodigo()%></td>
                    <td><%=maquinario.getDescricao()%></td>
                    <td><%=maquinario.getAno()%></td>
                    <td><%=maquinario.getValor()%> R$</td>
                    <td>
                        <a class="btn btn-danger col-md-4" href="excluimaquinario.jsp?codigo=<%=maquinario.getCodigo()%>">Excluir</a>
                        
                        <a class="btn btn-warning col-md-4"  href="alteramaquinario.jsp?codigo=<%=maquinario.getCodigo()%>">Alterar</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
