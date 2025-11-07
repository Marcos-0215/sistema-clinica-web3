/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.marcosandre.sistemaclinica.sistemadeclinica.controller;

import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medicamento;
import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios.RepositorioMedicamento;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author André
 */

@WebServlet(name = "medicamento", urlPatterns = {"/medicamento"})

public class MedicamentoServlet extends HttpServlet {

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
            out.println("<title>Servlet MedicamentoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MedicamentoServlet at " + request.getContextPath() + "</h1>");
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
        String codigoStr = request.getParameter("codigo");

        if (op == null || op.equals("listar")) {
            // LISTAR
            List<Medicamento> lista = RepositorioMedicamento.listarTodos();
            request.setAttribute("medicamentos", lista);
            request.getRequestDispatcher("/WEB-INF/paginas/medicamento/listar.jsp")
                   .forward(request, response);
            return;
        }

        if ("novo".equals(op) || "form".equals(op)) {
            // FORM para novo
            request.getRequestDispatcher("/WEB-INF/paginas/medicamento/form.jsp")
                   .forward(request, response);
            return;
        }

        if ("detalhes".equals(op) && codigoStr != null && !codigoStr.trim().isEmpty()) {
            try {
                int codigo = Integer.parseInt(codigoStr);
                Medicamento m = RepositorioMedicamento.buscarPorCodigo(codigo);
                request.setAttribute("medicamento", m);
                request.getRequestDispatcher("/WEB-INF/paginas/medicamento/detalhes.jsp")
                       .forward(request, response);
            } catch (NumberFormatException e) {
                // código inválido → volta à lista
                response.sendRedirect(request.getContextPath() + "/medicamento");
            }
            return;
        }

        if ("editar".equals(op) && codigoStr != null && !codigoStr.trim().isEmpty()) {
            try {
                int codigo = Integer.parseInt(codigoStr);
                Medicamento m = RepositorioMedicamento.buscarPorCodigo(codigo);
                request.setAttribute("medicamento", m);
                request.getRequestDispatcher("/WEB-INF/paginas/medicamento/form.jsp")
                       .forward(request, response);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/medicamento");
            }
            return;
        }

        if ("excluir".equals(op) && codigoStr != null && !codigoStr.trim().isEmpty()) {
            try {
                int codigo = Integer.parseInt(codigoStr);
                RepositorioMedicamento.deletar(codigo);
            } catch (NumberFormatException e) {
                // ignorar
            }
            response.sendRedirect(request.getContextPath() + "/medicamento");
            return;
        }

        // qualquer outro caso → listar
        response.sendRedirect(request.getContextPath() + "/medicamento");
        
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
        
        request.setCharacterEncoding("UTF-8");

        String codigoStr = request.getParameter("codigo");
        String nome = request.getParameter("nome");
        String dosagemStr = request.getParameter("dosagem");
        String tipoDosagem = request.getParameter("tipoDosagem");
        String descricao = request.getParameter("descricao");
        String observacao = request.getParameter("observacao");

        int codigo = 0;
        int dosagem = 0;
        try {
            codigo = Integer.parseInt(codigoStr);
        } catch (NumberFormatException ex) {
            // Se quiser: gerar código automático no repositório.
            // Aqui deixamos 0 para indicar ausência / falha de parse.
            codigo = 0;
        }
        try {
            dosagem = Integer.parseInt(dosagemStr);
        } catch (NumberFormatException ex) {
            dosagem = 0;
        }

        Medicamento m = new Medicamento();
        m.setCodigo(codigo);
        m.setNome(nome);
        m.setDosagem(dosagem);
        m.setTipoDosagem(tipoDosagem);
        m.setDescricao(descricao);
        m.setObservacao(observacao);

        // Decidir inserir ou atualizar: se já existe (por código) → atualizar
        if (codigo != 0 && RepositorioMedicamento.buscarPorCodigo(codigo) != null) {
            RepositorioMedicamento.atualizar(m);
        } else {
            // Se o repositório não gerar código automaticamente, inserir com o código informado.
            RepositorioMedicamento.inserir(m);
        }

        response.sendRedirect(request.getContextPath() + "/medicamento");
    
        
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
