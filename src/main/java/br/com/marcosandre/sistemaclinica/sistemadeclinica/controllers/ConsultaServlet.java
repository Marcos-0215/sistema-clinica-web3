/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.marcosandre.sistemaclinica.sistemadeclinica.controllers;

import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Consulta;
import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medico;
import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Paciente;
import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios.RepositorioConsulta;
import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios.RepositorioPaciente;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author André
 */
@WebServlet(name = "Consultas", urlPatterns = {"/Consultas"})
public class ConsultaServlet extends HttpServlet {
       
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Medico medico = (Medico) session.getAttribute("medicoLogado");

        // SEGURANÇA
        if (medico == null) {
            response.sendRedirect("loginMedico");
            return;
        }

        String op = request.getParameter("op");

        // LISTAGEM
        if (op == null || op.equals("listar")) {

            request.setAttribute("listaConsultas",
                    RepositorioConsulta.listarPorMedico(medico.getCrm()));

            RequestDispatcher rd = request.getRequestDispatcher(
                    "/WEB-INF/paginas/consulta/listar.jsp");
            rd.forward(request, response);
            return;
        }

        // ABRIR FORM NOVO
        if (op.equals("form")) {

            request.setAttribute("listaPacientes", RepositorioPaciente.listarTodos());

            RequestDispatcher rd = request.getRequestDispatcher(
                    "/WEB-INF/paginas/consulta/form.jsp");
            rd.forward(request, response);
            return;
        }

        // ABRIR FORM PARA EDITAR
        if (op.equals("editar")) {

            int codigo = Integer.parseInt(request.getParameter("codigo"));
            Consulta c = RepositorioConsulta.buscarPorCodigo(codigo);

            if (c == null) {
                response.sendRedirect("Consultas?op=listar");
                return;
            }

            request.setAttribute("consulta", c);
            request.setAttribute("listaPacientes", RepositorioPaciente.listarTodos());

            RequestDispatcher rd = request.getRequestDispatcher(
                    "/WEB-INF/paginas/consulta/form.jsp");
            rd.forward(request, response);
            return;
        }

        // EXCLUIR
        if (op.equals("excluir")) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            RepositorioConsulta.deletar(codigo);
            response.sendRedirect("Consultas?op=listar");
        }
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Medico medico = (Medico) session.getAttribute("medicoLogado");

        String op = request.getParameter("op");

        // INSERIR
        if ("inserir".equals(op)) {

            Consulta c = montarConsulta(request, medico);
            c.setCodigo(RepositorioConsulta.listarTodos().size() + 1);

            RepositorioConsulta.inserir(c);

            session.setAttribute("msg", "Consulta marcada com sucesso!");
            response.sendRedirect("Consultas?op=listar");
            return;
        }

        // ATUALIZAR
        if ("atualizar".equals(op)) {

            Consulta c = montarConsulta(request, medico);
            c.setCodigo(Integer.parseInt(request.getParameter("codigo")));

            RepositorioConsulta.atualizar(c);

            session.setAttribute("msg", "Consulta atualizada com sucesso!");
            response.sendRedirect("Consultas?op=listar");
        }
        
    }

    
    // MÉTODO AUXILIAR CENTRAL
    // -----------------------------

    private Consulta montarConsulta(HttpServletRequest request, Medico medico) {

        String cpfPaciente = request.getParameter("cpfPaciente");
        String dataHora = request.getParameter("dataHora");
        String dataHoraVolta = request.getParameter("dataHoraVolta");
        String observacao = request.getParameter("observacao");

        Paciente p = RepositorioPaciente.buscarPorCpf(cpfPaciente);

        Consulta c = new Consulta();
        c.setMedico(medico);
        c.setPaciente(p);
        c.setDataHora(dataHora);
        c.setDataHoraVolta(dataHoraVolta);
        c.setObservacao(observacao);
        c.setProntuario(null); // ainda não tem prontuári

        return c;
    }
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
