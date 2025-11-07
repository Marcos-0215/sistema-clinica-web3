/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.marcosandre.sistemaclinica.sistemadeclinica.controllers;

import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.IndicadorExame;
import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios.RepositorioIndicadorExame;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author André
 */

@WebServlet(name = "indicadorexame", urlPatterns = {"/indicadorexame"})

public class IndicadorExameServlet extends HttpServlet {

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
            out.println("<title>Servlet IndicadorExameServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IndicadorExameServlet at " + request.getContextPath() + "</h1>");
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
            request.setAttribute("indicadores", RepositorioIndicadorExame.listarTodos());
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/paginas/indicador/listar.jsp");
            rd.forward(request, response);

        } else if (acao.equals("editar")) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            IndicadorExame indicador = RepositorioIndicadorExame.buscarPorCodigo(codigo);
            request.setAttribute("indicador", indicador);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/paginas/indicador/form.jsp");
            rd.forward(request, response);

        } else if (acao.equals("excluir")) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            RepositorioIndicadorExame.deletar(codigo);
            response.sendRedirect("indicadorexame?acao=listar");

        } else if ("novo".equals(acao) || "form".equals(acao)) {
            // FORM para novo
            request.getRequestDispatcher("/WEB-INF/paginas/indicador/form.jsp")
                   .forward(request, response);            
        }
        
        else if (acao.equals("detalhes")) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            IndicadorExame indicador = RepositorioIndicadorExame.buscarPorCodigo(codigo);
            request.setAttribute("indicador", indicador);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/paginas/indicador/detalhes.jsp");
            rd.forward(request, response);

        } else {
            response.sendRedirect("indicadorexame?acao=listar");
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
        
        int codigo = Integer.parseInt(request.getParameter("codigo"));
        String indicador = request.getParameter("indicador");
        String descricao = request.getParameter("descricao");
        Double minValorReferencia = Double.parseDouble(request.getParameter("minValorReferencia"));
        Double maxValorReferencia = Double.parseDouble(request.getParameter("maxValorReferencia"));

        IndicadorExame i = new IndicadorExame();
        i.setCodigo(codigo);
        i.setIndicador(indicador);
        i.setDescricao(descricao);
        i.setMinValorReferencia(minValorReferencia);
        i.setMaxValorReferencia(maxValorReferencia);

        IndicadorExame existente = RepositorioIndicadorExame.buscarPorCodigo(codigo);
        if (existente == null) {
            RepositorioIndicadorExame.inserir(i);
        } else {
            RepositorioIndicadorExame.atualizar(i);
        }

        response.sendRedirect("indicadorexame?acao=listar");
        
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
