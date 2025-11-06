/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.marcosandre.sistemaclinica.sistemadeclinica.model.negocio;

/**
 *
 * @author André
 */
public class IndicadorExame {
    
    private int codigo;
    private String indicador;    
    private String descricao;
    private Double minValorReferencia;
    private Double maxValorReferencia;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getIndicador() {
        return indicador;
    }

    public void setIndicador(String indicador) {
        this.indicador = indicador;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Double getMinValorReferencia() {
        return minValorReferencia;
    }

    public void setMinValorReferencia(Double minValorReferencia) {
        this.minValorReferencia = minValorReferencia;
    }

    public Double getMaxValorReferencia() {
        return maxValorReferencia;
    }

    public void setMaxValorReferencia(Double maxValorReferencia) {
        this.maxValorReferencia = maxValorReferencia;
    }
    
    
    
}
