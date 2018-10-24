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
import model.Contato;

/**
 *
 * @author 42165
 */
public class ContatoDB {
    public static ArrayList getContato(Connection conexao){
        ArrayList lista = new ArrayList();
        try{
            Statement st = conexao.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM tbcontato");
            while(rs.next()){
                int codigo = rs.getInt("concodigo");
                String telefone = rs.getString("contelefone");
                String email = rs.getString("conemail");
                Integer pessoa = rs.getInt("pescodigo");
                Contato contato = new Contato(codigo, telefone, email, pessoa);
                lista.add(contato);
            }
        }
        catch(SQLException erro){
            System.out.println("Erro de SQL: " + erro.getMessage());
        }
        return lista;
    }
    
    public static boolean SetInsereContato(Contato contato, Connection conexao){
        boolean inseriu = false;
        try{
            PreparedStatement pst = conexao.prepareStatement("INSERT INTO tbcontato (contelefone, conemail, pescodigo) VALUES(?, ?, ?)");
            pst.setString(1, contato.getTelefone());
            pst.setString(2, contato.getEmail());
            pst.setInt(3, contato.getPescodigo());
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
    
    public static boolean SetAlteraContato(Contato contato, Connection conexao){
        boolean alterou = false;
        try{
            PreparedStatement pst = conexao.prepareStatement("UPDATE tbcontato SET contelefone = ?, conemail = ?, pescodigo = ? WHERE concodigo = ?");
            pst.setString(1, contato.getTelefone());
            pst.setString(2, contato.getEmail());
            pst.setInt(3, contato.getPescodigo());
            pst.setInt(4, contato.getCodigo());
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
    
    public static boolean SetExcluiContato(int codigo, Connection conexao){
        boolean excluiu = false;
        try{
            PreparedStatement pst = conexao.prepareStatement("DELETE FROM tbcontato WHERE concodigo = ?");
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
    
    public static Contato getContato(int codigo, Connection conexao){
        Contato contato = null;
        try{
            PreparedStatement pst = conexao.prepareStatement("SELECT * FROM tbcontato WHERE concodigo = ?");
            pst.setInt(1, codigo);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                int auxCodigo = Integer.parseInt(rs.getString("concodigo"));
                String telefone = rs.getString("contelefone");
                String email = rs.getString("conemail");
                Integer pescodigo = rs.getInt("pescodigo");
                contato = new Contato(auxCodigo, telefone, email, pescodigo);
            }
        }
        catch(SQLException erro){
            System.out.println("Erro de sql: " + erro.getMessage());
        }
        return contato;
    }
}
