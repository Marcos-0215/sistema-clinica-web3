/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios;

import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medico;
import java.util.ArrayList;
import java.util.List;
        
/**
 *
 * @author André
 */
public class RepositorioMedico {
    
    private static List<Medico> medicos;
    
    static{        
        medicos = new ArrayList<>();        
    }
    
    public static void inserir(Medico m){
        RepositorioMedico.medicos.add(m);
    }
    
    public static void atualizar(Medico m){
                
        for(Medico mAux: medicos){
            if(mAux.getCrm().equals(m.getCrm())){
                mAux.setNome(m.getNome());
                mAux.setEspecialidade(m.getEspecialidade());
                mAux.setContato(m.getContato());                             
                
                return;
            }
        }        
    }
    
    public static Medico buscarPorCrm(String crm){
        
        for(Medico mAux: medicos){
            if(mAux.getCrm().equals(crm)){                                
                return mAux;
            }
        }        
        return null;        
    }
        
    public static boolean deletar(String crm) {
        return medicos.removeIf(m -> m.getCrm().equals(crm));
    }
    
    public static List<Medico> listarTodos() {
        return medicos;
    }    
    
    public static Medico login(String crm, String senha){
        
        for(Medico mAux: medicos){
            if(mAux.getCrm().equals(crm) && mAux.getSenha().equals(senha)){
                return mAux;
            }
        }
        return null;
    }
    
    public static void alterarSenha(String crm, String senha){
        
        for(Medico mAux: medicos){
            if(mAux.getCrm().equals(crm)){
                mAux.setSenha(senha);
                return;
            }
        }        
    }
    
    
}
