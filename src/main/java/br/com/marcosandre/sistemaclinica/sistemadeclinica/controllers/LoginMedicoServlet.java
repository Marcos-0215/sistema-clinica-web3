/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.marcosandre.sistemaclinica.sistemadeclinica.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medico;
import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios.RepositorioMedico;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author André
 */
@WebServlet(name = "loginMedico", urlPatterns = {"/loginMedico"})
public class LoginMedicoServlet extends HttpServlet {

     
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/paginas/medico/loginMedico.jsp");
        rd.forward(request, response);
        
    }

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("op");
        String crm = request.getParameter("crm");
        String senha = request.getParameter("senha");
        
        // LOGIN
        
        if (op != null && op.equals("login")) {
            
            Medico medico = RepositorioMedico.login(crm, senha);

            if (medico != null) {            
                HttpSession session = request.getSession();
                session.setAttribute("medicoLogado", medico);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/paginas/medico/indexMedico.jsp");
rd.forward(request, response);    
            } else {

                request.setAttribute("mensagemErro", "CRM ou senha inválidos!");
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/paginas/medico/loginMedico.jsp");
                rd.forward(request, response);
            }            
            
        }
        
        

        // CADASTRO
        else if ("cadastro".equals(op)) {
                        
            String nome = request.getParameter("nome");
            String especialidade = request.getParameter("especialidade");
            String contato = request.getParameter("contato");            
            String confirm = request.getParameter("confirm");

            if (!senha.equals(confirm)) {
                request.setAttribute("mensagemErro", "As senhas não coincidem!");
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/paginas/medico/loginMedico.jsp");
                rd.forward(request, response);
                return;
            }

            Medico m = new Medico();
            m.setCrm(crm);
            m.setNome(nome);
            m.setEspecialidade(especialidade);
            m.setContato(contato);
            m.setSenha(senha);

            RepositorioMedico.inserir(m);

            request.setAttribute("mensagemSucesso", "Cadastro realizado com sucesso! Faça login para continuar.");
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/paginas/medico/loginMedico.jsp");
            rd.forward(request, response); 
            
            
        }
        
        
        
        /*
        String confirma = request.getParameter("confirm");
        
        if(op == null && !senha.equals(confirma)){
            
            request.getSession().setAttribute("msg","Erro ao validar a senha!");
            response.sendRedirect("LoginMedico.jsp");
            return;
        }        
        
                
        String nome =  request.getParameter("nome");
        String especialidade =  request.getParameter("especialidade");
        String contato = request.getParameter("contato");
        
        Medico m = new Medico();
        
        m.setCrm(crm);
        m.setNome(nome);
        m.setEspecialidade(especialidade);
        m.setContato(contato);
        
        request.getSession().setAttribute("svd", "ok");
        
        if(op==null){
            m.setSenha(senha);
            RepositorioMedico.inserir(m);
            request.getSession().setAttribute("msg", "Hospedeiro cadastrado com sucesso! Por favor, faça o login!");
            response.sendRedirect("loginMedico.jsp");
        }else{
            RepositorioMedico.atualizar(m);
            request.setAttribute("msg", "Hospedeiro alterado com sucesso!");
            getServletContext().getRequestDispatcher("/WEB-INF/jsps/perfilMedico.jsp")
                    .forward(request, response);
            
        }
        
        */
        
    }
    

    
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
