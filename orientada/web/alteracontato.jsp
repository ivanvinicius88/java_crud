<%-- 
    Document   : alteracontato
    Created on : 12/09/2018, 20:21:05
    Author     : 42165
--%>

<%@page import="model.Contato"%>
<%@page import="controller.ContatoDB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Alterando Contato</title>
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
            <h1  class="text-center">Alterar Contato</h1>
            <a class="btn btn-primary col-md-2 my-4" href="listacontato.jsp">Voltar</a><br>
            <%
                String mensagem = "Informe os dados";
                int codigo = Integer.parseInt(request.getParameter("codigo"));
                Connection conexao = (Connection) session.getAttribute("conexao");
                Contato contato = ContatoDB.getContato(codigo, conexao);
                if (request.getParameter("btnAltera") != null) {
                    contato.setCodigo(Integer.parseInt(request.getParameter("codigo")));
                    contato.setTelefone(request.getParameter("telefone"));
                    contato.setEmail(request.getParameter("email"));
                    contato.setPescodigo(Integer.parseInt(request.getParameter("pescodigo")));
                    boolean alterou = ContatoDB.SetAlteraContato(contato, conexao);
                    if (alterou) {
                            mensagem = "<div class='alert alert-success col-md-6'>Contato alterado com sucesso! </div>";
                    } else {
                            mensagem = "<div class='alert alert-danger col-md-6'>Erro ao alterar o contato </div>";
                    }
                }
                out.println(mensagem);
            %>

                
                <form class="mt-2" name="FormAltera" method="post">
                    <div class="form-group">
                        <label >C�digo</label>
                        <input type="text" readonly="true" class="form-control col-md-1" name="codigo"  value="<%=codigo%>">
                    </div>
                    <div class="form-group">
                        <label >Telefone</label>
                        <input type="text" class="form-control col-md-3"  name="telefone" value="<%=contato.getTelefone()%>">
                    </div>
                    <div class="form-group">
                        <label >Email</label>
                        <input type="text" class="form-control col-md-4" name="email" value="<%=contato.getEmail()%>">
                    </div>
                    <div class="form-group">
                        <label >Pessoa</label>
                        <input type="text" class="form-control col-md-3" name="pescodigo" value="<%=contato.getPescodigo()%>">
                    </div>
                    <div class="form-group">
                        <input class=" my-4 col-md-2 btn btn-warning " type="submit" name="btnAltera" value="Alterar">
                    </div>
                </form>    
                
                
                
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
