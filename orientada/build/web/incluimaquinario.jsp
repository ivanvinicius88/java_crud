<%-- 
    Document   : incluimaquinario
    Created on : 05/09/2018, 21:23:53
    Author     : 42165
--%>

<%@page import="controller.MaquinarioDB"%>
<%@page import="controller.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.Maquinario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incluindo Maquinário</title>
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
            <h1 class="text-center">Novo Maquinário</h1>
            <a class="btn btn-primary col-md-2 my-4" href="listamaquinario.jsp">Voltar</a><br>
            <%
                String mensagem = "<div class='mb-2'>Informe os dados abaixo</div>";
                if (request.getParameter("btnNovo") != null) {
                    int codigo = '1';
                    String descricao = request.getParameter("descricao");
                    String ano = request.getParameter("ano");
                    Double valor = Double.parseDouble(request.getParameter("valor"));
                    Maquinario maquinario = new Maquinario(codigo, descricao, ano, valor);
                    Connection conexao = (Connection) session.getAttribute("conexao");
                    boolean inseriu = MaquinarioDB.SetInsereMaquinario(maquinario, conexao);
                    if (inseriu) {
                        mensagem = "<div class='alert alert-success col-md-6'>Maquina cadastrada com sucesso! </div>";
                    } else {
                        mensagem = "<div class='alert alert-danger col-md-6'>Erro ao cadastrar a Maquina </div>";
                    }
                }
                out.println(mensagem);
            %>

            
            
            <form method="post" name="novomaquinario">
                <div class="form-group">
                    <label >Descrição</label>
                    <input type="text" class="form-control col-md-3" name="descricao"  >
                </div>
                <div class="form-group">
                    <label >Ano</label>
                    <input type="text" class="form-control col-md-1" name="ano" >
                </div>
                <div class="form-group">
                    <label >Valor</label>
                    <input type="text" class="form-control col-md-2" name="valor" >
                </div>
                <div class="form-group">
                    <input class=" my-2 col-md-2 btn btn-success "type="submit" name="btnNovo" value="Cadastrar">
                </div>
            </form>
            
            
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
