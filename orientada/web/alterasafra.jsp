<%@page import="controller.SafraDB"%>
<%@page import="model.Safra"%>
<%@page import="controller.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Altera Safras</title>
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


        <div class="container">
            <h1 class="text-center">Alterar Safras</h1>
            <a class="btn btn-primary col-md-2 my-4" href="listasafra.jsp">Voltar</a><br>
            <form name="FormAltera" method="POST">
                <%
                    String mensagem = "Informe os dados <br/><br/>";
                    int codigo = Integer.parseInt(request.getParameter("codigo"));
                    Connection conexao = Conexao.getConexao();
                    Safra safra = SafraDB.getSafra(codigo, conexao);
                    if (request.getParameter("btnAltera") != null) {
                        safra.setCodigo(Integer.parseInt(request.getParameter("codigo")));
                        safra.setDescricao(request.getParameter("descricao"));
                        safra.setAno(request.getParameter("ano"));
                        boolean alterou = SafraDB.SetAlteraSafra(safra, conexao);
                        if (alterou) {
                            mensagem = "<div class='alert alert-success col-md-6'>Safra alterada com sucesso! </div>";
                        } else {
                            mensagem = "<div class='alert alert-danger col-md-6'>Erro ao alterar a safra </div>";
                        }
                    }
                    out.println(mensagem);
                    Conexao.setFechaConexao(conexao);
                %>


                <div class="form-group">
                    <label >Código</label>
                    <input type="text" readonly="true" class="form-control col-md-1" name="codigo" id="codigo" value="<%=codigo%>">
                </div>
                <div class="form-group">
                    <label >Descricao</label>
                    <input type="text" class="form-control col-md-3" name="descricao" id="descricao" value="<%=safra.getDescricao()%>">
                </div>
                <div class="form-group">
                    <label >Ano</label>
                    <input type="text" class="form-control col-md-2" name="ano" id="ano" value="<%=safra.getAno()%>">
                </div>
                <div class="form-group">
                    <input class=" my-4 col-md-2 btn btn-warning " type="submit" name="btnAltera" value="alterar">
                </div>
            </form>

        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
