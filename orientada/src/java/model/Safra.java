package model;

import com.sun.corba.se.spi.activation._ActivatorImplBase;


public class Safra {
    private int codigo;
    private String descricao;
    private String ano;

    public Safra(int codigo, String descricao, String ano) {
        this.codigo = codigo;
        this.descricao = descricao;
        this.ano = ano;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    

    
    
    
    
}
