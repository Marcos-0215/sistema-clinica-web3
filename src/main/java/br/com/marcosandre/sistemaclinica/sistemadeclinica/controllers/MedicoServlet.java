/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.marcosandre.sistemaclinica.sistemadeclinica.controllers;

import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medico;
import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios.RepositorioMedico;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author André
 */

@WebServlet(name = "medico", urlPatterns = {"/medico"})

public class MedicoServlet extends HttpServlet {

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
            out.println("<title>Servlet MedicoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MedicoServlet at " + request.getContextPath() + "</h1>");
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
        
        String op = request.getParameter("op");
        String crm = request.getParameter("crm");

        if (op == null) {
            // LISTAR
            List<Medico> lista = RepositorioMedico.listarTodos();
            request.setAttribute("medicos", lista);
            request.getRequestDispatcher("WEB-INF/paginas/medico/listar.jsp")
                   .forward(request, response);
        } 
        else if (op.equals("detalhes") && crm != null) {
            // DETALHAR
            Medico m = RepositorioMedico.buscarPorCrm(crm);
            request.setAttribute("medico", m);
            request.getRequestDispatcher("WEB-INF/paginas/medico/detalhes.jsp")
                   .forward(request, response);
        } 
        else if (op.equals("editar") && crm != null) {
            // EDITAR
            Medico m = RepositorioMedico.buscarPorCrm(crm);
            request.setAttribute("medico", m);
            request.getRequestDispatcher("WEB-INF/paginas/medico/form.jsp")
                   .forward(request, response);
        } 
        else if (op.equals("excluir") && crm != null) {
            // EXCLUIR
            RepositorioMedico.deletar(crm);
            response.sendRedirect("medico");
        } 
        else if (op.equals("novo")) {
            // NOVO CADASTRO
            request.getRequestDispatcher("WEB-INF/paginas/medico/form.jsp")
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
        
        String crm = request.getParameter("crm");
        String nome = request.getParameter("nome");
        String especialidade = request.getParameter("especialidade");
        String contato = request.getParameter("contato");

        Medico m = new Medico();
        m.setCrm(crm);
        m.setNome(nome);
        m.setEspecialidade(especialidade);
        m.setContato(contato);

        // Verifica se é atualização ou novo cadastro
        if (RepositorioMedico.buscarPorCrm(crm) != null) {
            RepositorioMedico.atualizar(m);
        } else {
            RepositorioMedico.inserir(m);
        }

        response.sendRedirect("medico");
        
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
