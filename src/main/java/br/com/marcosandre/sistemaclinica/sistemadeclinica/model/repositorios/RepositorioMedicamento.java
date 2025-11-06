/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.marcosandre.sistemaclinica.sistemadeclinica.model.repositorios;

import br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio.Medicamento;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author André
 */
public class RepositorioMedicamento {
    
    private static List<Medicamento> medicamentos;
    
    static{        
        medicamentos = new ArrayList<>();        
    }
    
    public static void inserir(Medicamento m){
        RepositorioMedicamento.medicamentos.add(m);
    }
    
    
    public static void atualizar(Medicamento m){
                
        for(Medicamento mAux: medicamentos){
            if(mAux.getCodigo() == m.getCodigo()){
                mAux.setNome(m.getNome());
                mAux.setDosagem(m.getDosagem());
                mAux.setTipoDosagem(m.getTipoDosagem());
                mAux.setDescricao(m.getDescricao());
                mAux.setObservacao(m.getObservacao());
                
                return;
            }
        }        
    }
    
    
    public static Medicamento buscarPorCodigo(int codigo){
        
        for(Medicamento mAux: medicamentos){
            if(mAux.getCodigo() == codigo){                                
                return mAux;
            }
        }        
        return null;        
    }
    
    /*
    public static void deletar(int codigo){
        
        for(Medicamento mAux: medicamentos){
            
            if(mAux.getCodigo() == codigo){
                medicamentos.remove(mAux);                
                return;
            }            
        }        
    }
    */
    public static boolean deletar(int codigo) {
        return medicamentos.removeIf(m -> m.getCodigo() == codigo);
    }
    
    public static List<Medicamento> listarTodos() {
        return medicamentos;
    }
    
    
}

