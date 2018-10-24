/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author 42165
 */
public class Contato {
    private Integer codigo;
    private String telefone;
    private String email;
    private Integer pescodigo;
    
    public Contato(Integer codigo, String telefone, String email, Integer pescodigo) {
        this.codigo = codigo;
        this.telefone = telefone;
        this.email = email;
        this.pescodigo = pescodigo;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getPescodigo() {
        return pescodigo;
    }

    public void setPescodigo(Integer pescodigo) {
        this.pescodigo = pescodigo;
    }       
}
