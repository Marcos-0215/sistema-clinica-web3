/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios;

import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Paciente;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author André
 */
public class RepositorioPaciente {
    
    private static List<Paciente> pacientes;
    
    static{        
        pacientes = new ArrayList<>();        
    }
    
    public static void inserir(Paciente p){
        RepositorioPaciente.pacientes.add(p);
    }
    
    
    public static void atualizar(Paciente p){
                
        for(Paciente pAux: pacientes){
            if(pAux.getCpf().equals(p.getCpf())){
                pAux.setNome(p.getNome());
                pAux.setEndereco(p.getEndereco());
                pAux.setContato(p.getContato());
                pAux.setPlanoSaude(p.getPlanoSaude());                
                
                return;
            }
        }        
    }
    
    
    public static Paciente buscarPorCpf(String cpf){
        
        for(Paciente pAux: pacientes){
            if(pAux.getCpf().equals(cpf)){                                
                return pAux;
            }
        }        
        return null;        
    }
    
    /*
    public static void deletar(String cpf){
        
        for(Paciente pAux: pacientes){
            
            if(pAux.getCpf().equals(cpf)){
                pacientes.remove(pAux);                
                return;
            }            
        }        
    }
    */
    public static boolean deletar(String cpf) {
        return pacientes.removeIf(p -> p.getCpf().equals(cpf));
    }
    
    public static List<Paciente> listarTodos() {
        return pacientes;
    }
    
    
}
