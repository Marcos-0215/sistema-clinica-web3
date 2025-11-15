/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios;

import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Prontuario;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author André
 */
public class RepositorioProntuario {
    
    private static List<Prontuario> prontuarios;
    
    static{        
        prontuarios = new ArrayList<>();        
    }
    
    public static void inserir(Prontuario c){
        RepositorioProntuario.prontuarios.add(c);
    }
    
    public static void atualizar(Prontuario p){
                
        for(Prontuario pAux: prontuarios){
            if(pAux.getCodigo() == p.getCodigo()){
                pAux.setDescricao(p.getDescricao());
                pAux.setObservacao(p.getObservacao());     
                return;
            }
        }        
    }
    
    
    public static Prontuario buscarPorCodigo(int codigo){
        
        for(Prontuario pAux: prontuarios){
            if(pAux.getCodigo() == codigo){                                
                return pAux;
            }
        }        
        return null;        
    }
    
    public static boolean deletar(int codigo) {
        return prontuarios.removeIf(p -> p.getCodigo() == codigo);
    }
    
    public static List<Prontuario> listarTodos() {
        return prontuarios;
    }
     
}
