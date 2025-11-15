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
        
        // --- PACIENTES DE TESTE ---

        Paciente p1 = new Paciente();
        p1.setCpf("11111111111");
        p1.setNome("João da Silva");
        p1.setEndereco("Rua A, 123");
        p1.setContato("(81) 90000-1111");
        p1.setPlanoSaude("Unimed");
        pacientes.add(p1);

        Paciente p2 = new Paciente();
        p2.setCpf("22222222222");
        p2.setNome("Maria Oliveira");
        p2.setEndereco("Av. Central, 456");
        p2.setContato("(81) 90000-2222");
        p2.setPlanoSaude("Hapvida");
        pacientes.add(p2);

        Paciente p3 = new Paciente();
        p3.setCpf("33333333333");
        p3.setNome("Carlos Pereira");
        p3.setEndereco("Rua B, 890");
        p3.setContato("(81) 90000-3333");
        p3.setPlanoSaude("Amil");
        pacientes.add(p3);

        Paciente p4 = new Paciente();
        p4.setCpf("44444444444");
        p4.setNome("Ana Rodrigues");
        p4.setEndereco("Travessa Verde, 45");
        p4.setContato("(81) 90000-4444");
        p4.setPlanoSaude("Bradesco Saúde");
        pacientes.add(p4);

        Paciente p5 = new Paciente();
        p5.setCpf("55555555555");
        p5.setNome("Pedro Santos");
        p5.setEndereco("Av. Leste-Oeste, 999");
        p5.setContato("(81) 90000-5555");
        p5.setPlanoSaude("Sem plano");
        pacientes.add(p5);
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
