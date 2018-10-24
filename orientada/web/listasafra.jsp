<%@page import="model.Safra"%>
<%@page import="controller.SafraDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Safras</title>
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
            <h1 class="text-center">Lista de Safras</h1>
            <a class="btn btn-success my-3 col-md-2" href="incluisafra.jsp">Novo</a>
            <table class="table table-bordered table-striped text-center " border="1">
                <tr class="thead-dark">
                    <th>Código</th>
                    <th>Descrição</th>
                    <th>Ano</th>
                    <th>Opções</th>
                </tr>
                <%
                    Connection conexao = (Connection) session.getAttribute("conexao");;
                    ArrayList lista = SafraDB.getSafras(conexao);
                    for (int i = 0; i < lista.size(); i++) {
                        Safra safra = (Safra) lista.get(i);
                %>
                <tr>
                    <td><%=safra.getCodigo()%></td>
                    <td><%=safra.getDescricao()%> </td>
                    <td><%=safra.getAno()%></td>
                    <td>
                        <a class="btn btn-danger col-md-4" href="excluisafra.jsp?codigo=<%=safra.getCodigo()%>">Excluir</a>
                        <a class="btn btn-warning col-md-4" href="alterasafra.jsp?codigo=<%=safra.getCodigo()%>">Alterar</a>
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
