/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.marcosandre.sistemaclinica.sistemadeclinica.controllers;

import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Consulta;
import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medico;
import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios.RepositorioConsulta;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author André
 */


@WebServlet(name = "IndexMedicoServlet", urlPatterns = {"/medico/index"})
public class IndexMedicoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        // Verifica login
        Medico medico = (Medico) session.getAttribute("medicoLogado");
        if (medico == null) {
            resp.sendRedirect(req.getContextPath() + "/loginMedico.jsp");
            return;
        }

        // Lista TODAS as consultas do médico
        List<Consulta> todas = RepositorioConsulta.listarPorMedico(medico.getCrm());

        // Filtra apenas consultas pendentes = sem prontuário
        List<Consulta> pendentes = new ArrayList<>();
        for (Consulta c : todas) {
            if (c.getProntuario() == null) {
                pendentes.add(c);
            }
        }

        // Envia para JSP
        req.setAttribute("consultasPendentes", pendentes);

        // Redireciona
        req.getRequestDispatcher("/WEB-INF/paginas/medico/indexMedico.jsp")
           .forward(req, resp);
    }
}

