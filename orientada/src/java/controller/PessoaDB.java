/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Pessoa;

/**
 *
 * @author 42165
 */
public class PessoaDB {
    public static ArrayList getPessoa(Connection conexao){
        ArrayList lista = new ArrayList();
        try{
            Statement st = conexao.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM tbpessoa");
            while(rs.next()){
                Integer codigo = rs.getInt("pescodigo");
                String nome = rs.getString("pesnome");
                Integer idade = rs.getInt("pesidade");
                String cpf = rs.getString("pescpf");
                Pessoa pessoa = new Pessoa(codigo, nome, idade, cpf);
                lista.add(pessoa);
            }
        }
        catch(SQLException erro){
            System.out.println("Erro de SQL: " + erro.getMessage());
        }
        return lista;
    }
    
    public static boolean SetInserePessoa(Pessoa pessoa, Connection conexao){
        boolean inseriu = false;
        try{
            PreparedStatement pst = conexao.prepareStatement("INSERT INTO tbpessoa(pesnome, pesidade, pescpf) VALUES(?, ?, ?)");
            pst.setString(1, pessoa.getNome());
            pst.setInt(2, pessoa.getIdade());
            pst.setString(3, pessoa.getCpf());
            int valor = pst.executeUpdate();
            if(valor == 1){
                inseriu = true;
            }
        } 
        catch(SQLException erro){
            System.out.println("Erro de inserção: " + erro.getMessage());
        }
        return inseriu;
    }
    
    public static boolean SetAlteraPessoa(Pessoa pessoa, Connection conexao){
        boolean alterou = false;
        try{
            PreparedStatement pst = conexao.prepareStatement("UPDATE tbpessoa SET pesnome= ?, pesidade = ?, pescpf= ? WHERE pescodigo= ?");
            pst.setString(1, pessoa.getNome());
            pst.setInt(2, pessoa.getIdade());
            pst.setString(3, pessoa.getCpf());
            pst.setInt(4, pessoa.getCodigo());
            int valor = pst.executeUpdate();
            if(valor == 1){
                alterou = true;
            }
        }
        catch(SQLException erro){
            System.out.println("Erro ao alterar: " + erro.getMessage());
        }
        return alterou;
    }
    
    public static boolean SetExcluiPessoa(Integer codigo, Connection conexao){
        boolean excluiu = false;
        try{
            PreparedStatement pst = conexao.prepareStatement("DELETE FROM tbpessoa WHERE pescodigo= ?");
            pst.setInt(1, codigo);
            int valor = pst.executeUpdate();
            if(valor == 1){
                excluiu = true;
            }
        }
        catch(SQLException erro){
            System.out.println("Erro ao excluir: " + erro.getMessage());
        }
        return excluiu;
    }
    
    public static Pessoa getPessoa(Integer codigo, Connection conexao){
        Pessoa pessoa = null;
        try{
            PreparedStatement pst = conexao.prepareStatement("SELECT * FROM tbpessoa WHERE pescodigo = ?");
            pst.setInt(1, codigo);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Integer auxCodigo = rs.getInt("pescodigo");
                String nome = rs.getString("pesnome");
                Integer idade = rs.getInt("pesidade");
                String cpf = rs.getString("pescpf");
                pessoa = new Pessoa(auxCodigo, nome, idade, cpf);
            }
        }
        catch(SQLException erro){
            System.out.println("Erro de sql: " + erro.getMessage());
        }
        return pessoa;
    }
}
