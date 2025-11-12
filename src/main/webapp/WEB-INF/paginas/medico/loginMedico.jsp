<%-- 
    Document   : loginMedico
    Created on : 11 de nov. de 2025, 15:58:37
    Author     : André
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
        <title>Login do Médico</title>
    </head>
    <body class="bg-light">

        <!-- Se o médico já estiver logado, redireciona -->
        <c:if test="${sessionScope.medicoLogado ne null}">
            <c:redirect url="indexMedico.jsp"/>
        </c:if>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card shadow-sm p-4">
                        <h3 class="text-center mb-4">Acesso do Médico</h3>

                        <!-- Formulário de login -->
                        <form method="post" action="loginMedico">
                            <input type="hidden" name="op" value="login"/>
                            <div class="mb-3">
                                <label for="crm" class="form-label">CRM</label>
                                <input type="text" class="form-control" id="crm" name="crm" required>
                            </div>

                            <div class="mb-3">
                                <label for="senha" class="form-label">Senha</label>
                                <input type="password" class="form-control" id="senha" name="senha" required>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Entrar</button>
                            </div>
                            
                            
                            <div class="text-center">
                                <p>Não tem cadastro? <a href="#!" 
                                        data-bs-toggle="modal" data-bs-target="#modalCadastro">Cadastre-se</a></p>
                                <p>ou entre com:</p>
                                <button type="button" data-mdb-button-init="" data-mdb-ripple-init="" class="btn btn-link btn-floating mx-1" data-mdb-button-initialized="true">
                                    <i class="fab fa-facebook-f"></i>
                                </button>

                                <button type="button" data-mdb-button-init="" data-mdb-ripple-init="" class="btn btn-link btn-floating mx-1" data-mdb-button-initialized="true">
                                    <i class="fab fa-google"></i>
                                </button>

                                <button type="button" data-mdb-button-init="" data-mdb-ripple-init="" class="btn btn-link btn-floating mx-1" data-mdb-button-initialized="true">
                                    <i class="fab fa-twitter"></i>
                                </button>

                                <button type="button" data-mdb-button-init="" data-mdb-ripple-init="" class="btn btn-link btn-floating mx-1" data-mdb-button-initialized="true">
                                    <i class="fab fa-github"></i>
                                </button>
                            </div>
                            
                            
                        </form>

                        
                        <c:if test="${not empty mensagemErro}">
                            <div class="alert alert-danger mt-3 text-center">
                                ${mensagemErro}
                            </div>
                        </c:if>

                        <div class="text-center mt-3">
                            <a href="${pageContext.request.contextPath}/" class="text-decoration-none">
                                ← Voltar à página inicial
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                
        <div class="modal fade" id="modalCadastro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Cadastro de Médico</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="loginMedico">
                            <input type="hidden" name="op" value="cadastro">
                            <table class="table">
                                <tr>
                                    <td>CRM</td>
                                    <td><input type="text" name="crm" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>Nome</td>
                                    <td><input type="text" name="nome" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>Especialidade</td>
                                    <td><input type="text" name="especialidade" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>Contato</td>
                                    <td><input type="text" name="contato" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>Senha</td>
                                    <td><input type="password" name="senha" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <td>Confirmação</td>
                                    <td><input type="password" name="confirm" class="form-control"/></td>
                                </tr>
                            </table>
                            <button class="btn btn-primary">registrar</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>                    
                                
                                
                                
    </body>
</html>
