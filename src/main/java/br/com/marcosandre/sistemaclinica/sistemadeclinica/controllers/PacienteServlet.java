/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package br.com.marcosandre.sistemaclinica.sistemadeclinica.controllers;

import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Paciente;
import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios.RepositorioPaciente;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;


/**
 *
 * @author André
 */

@WebServlet(name = "PacienteServlet", urlPatterns = {"/paciente"})

public class PacienteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PacienteServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PacienteServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String op = request.getParameter("op");
        String cpf = request.getParameter("cpf");
        if (cpf != null) cpf = cpf.trim();

        if (op == null) {
            // LISTAR
            List<Paciente> lista = RepositorioPaciente.listarTodos();
            request.setAttribute("pacientes", lista);
            request.getRequestDispatcher("WEB-INF/paginas/paciente/listar.jsp")
                   .forward(request, response);
        } 
        else if (op.equals("detalhes") && cpf != null && !cpf.isEmpty()) {
            // DETALHAR
            Paciente p = RepositorioPaciente.buscarPorCpf(cpf);
            request.setAttribute("paciente", p);
            request.getRequestDispatcher("W EB-INF/paginas/paciente/detalhes.jsp")
                   .forward(request, response);
        } 
        else if (op.equals("editar") && cpf != null && !cpf.isEmpty()) {
            // EDITAR (carrega formulÃ¡rio com dados)
            Paciente p = RepositorioPaciente.buscarPorCpf(cpf);
            request.setAttribute("paciente", p);
            request.getRequestDispatcher("WEB-INF/paginas/paciente/form.jsp")
                   .forward(request, response);
        } 
        else if (op.equals("excluir") && cpf != null && !cpf.isEmpty()) {
            // EXCLUIR
            RepositorioPaciente repo = new RepositorioPaciente();
            repo.deletar(cpf);
            response.sendRedirect("paciente");
        } 
        else if (op.equals("novo")) {
            // NOVO CADASTRO
            request.getRequestDispatcher("WEB-INF/paginas/paciente/form.jsp")
                   .forward(request, response);
        }
    }
        
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String endereco = request.getParameter("endereco");
        String contato = request.getParameter("contato");
        String plano = request.getParameter("planoSaude");

        Paciente p = new Paciente();
        p.setCpf(cpf);
        p.setNome(nome);
        p.setEndereco(endereco);
        p.setContato(contato);
        p.setPlanoSaude(plano);

        // Verifica se é uma atualização ou novo
        if (RepositorioPaciente.buscarPorCpf(cpf) != null) {
            RepositorioPaciente.atualizar(p);
        } else {
            RepositorioPaciente.inserir(p);
        }

        response.sendRedirect("paciente");


    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
   
    
    
}

