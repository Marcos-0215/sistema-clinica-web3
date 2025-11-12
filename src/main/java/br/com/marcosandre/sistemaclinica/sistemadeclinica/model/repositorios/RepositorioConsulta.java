/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios;

import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Consulta;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author André
 */
public class RepositorioConsulta {
    
    private static List<Consulta> consultas;
    
    static{        
        consultas = new ArrayList<>();        
    }
    
    public static void inserir(Consulta c){
        RepositorioConsulta.consultas.add(c);
    }
    
    public static void atualizar(Consulta c){
                
        for(Consulta cAux: consultas){
            if(cAux.getCodigo() == c.getCodigo()){
                cAux.setDataHora(c.getDataHora());
                cAux.setDataHoraVolta(c.getDataHoraVolta());
                cAux.setObservacao(c.getObservacao());
                cAux.setMedico(c.getMedico());
                cAux.setPaciente(c.getPaciente());
                cAux.setProntuario(c.getProntuario());
                
                return;
            }
        }        
    }
    
    
    public static Consulta buscarPorCodigo(int codigo){
        
        for(Consulta cAux: consultas){
            if(cAux.getCodigo() == codigo){                                
                return cAux;
            }
        }        
        return null;        
    }
    
    public static boolean deletar(int codigo) {
        return consultas.removeIf(c -> c.getCodigo() == codigo);
    }
    
    public static List<Consulta> listarTodos() {
        return consultas;
    }
    
    
    
}
