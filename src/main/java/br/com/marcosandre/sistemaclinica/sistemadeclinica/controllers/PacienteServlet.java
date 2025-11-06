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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author André
 */
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
        
        String acao = request.getParameter("acao");

        if (acao == null || acao.equals("listar")) {
            listar(request, response);
        } else if (acao.equals("novo")) {
            mostrarFormularioNovo(request, response);
        } else if (acao.equals("editar")) {
            mostrarFormularioEditar(request, response);
        } else if (acao.equals("excluir")) {
            excluir(request, response);
        } else {
            response.sendRedirect("paciente?acao=listar");
        }
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

    
    // ==== Métodos auxiliares (organização) ====

    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Paciente> lista = RepositorioPaciente.listarTodos();
        request.setAttribute("listaPacientes", lista);
        request.getRequestDispatcher("paciente-lista.jsp").forward(request, response);
    }

    private void mostrarFormularioNovo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("paciente", new Paciente());
        request.getRequestDispatcher("paciente-form.jsp").forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cpf = request.getParameter("cpf");
        Paciente p = RepositorioPaciente.buscarPorCpf(cpf);

        if (p != null) {
            request.setAttribute("paciente", p);
            request.getRequestDispatcher("paciente-form.jsp").forward(request, response);
        } else {
            response.sendRedirect("paciente?acao=listar");
        }
    }

    private void excluir(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String cpf = request.getParameter("cpf");
        RepositorioPaciente.deletar(cpf);
        response.sendRedirect("paciente?acao=listar");
    }

    private void salvar(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String endereco = request.getParameter("endereco");
        String contato = request.getParameter("contato");
        String planoSaude = request.getParameter("planoSaude");

        Paciente existente = RepositorioPaciente.buscarPorCpf(cpf);

        if (existente == null) {
            // Novo paciente
            Paciente p = new Paciente();
            
            p.setCpf(cpf);
            p.setNome(nome);
            p.setEndereco(endereco);
            p.setContato(contato);
            p.setPlanoSaude(planoSaude);
            
            RepositorioPaciente.inserir(p);
        } else {
            // Atualizar paciente existente
            existente.setNome(nome);
            existente.setEndereco(endereco);
            existente.setContato(contato);
            existente.setPlanoSaude(planoSaude);
            RepositorioPaciente.atualizar(existente);
        }

        response.sendRedirect("paciente?acao=listar");
    }
    
}
