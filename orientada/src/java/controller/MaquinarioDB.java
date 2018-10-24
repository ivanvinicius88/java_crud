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
import model.Maquinario;

/**
 *
 * @author 42165
 */
public class MaquinarioDB {
    public static ArrayList getMaquinario(Connection conexao){
        ArrayList lista = new ArrayList();
        try{
            Statement st = conexao.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM tbmaquinario");
            while(rs.next()){
                Integer codigo = rs.getInt("maqcodigo");
                String descricao = rs.getString("maqdescricao");
                String ano = rs.getString("maqano");
                Double valor = rs.getDouble("maqvalor");
                Maquinario maquinario = new Maquinario(codigo, descricao, ano, valor);
                lista.add(maquinario);
            }
        }
        catch(SQLException erro){
            System.out.println("Erro de SQL: " + erro.getMessage());
        }
        return lista;
    }
    
    public static boolean SetInsereMaquinario(Maquinario maquinario, Connection conexao){
        boolean inseriu = false;
        try{
            PreparedStatement pst = conexao.prepareStatement("INSERT INTO tbmaquinario(maqdescricao, maqano, maqvalor) VALUES(?,?,?)");
            pst.setString(1, maquinario.getDescricao());
            pst.setString(2, maquinario.getAno());
            pst.setDouble(3, maquinario.getValor());
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
    
    public static boolean SetAlteraMaquinario(Maquinario maquinario, Connection conexao){
        boolean alterou = false;
        try{
            PreparedStatement pst = conexao.prepareStatement("UPDATE tbmaquinario SET maqdescricao = ?, maqano = ?, maqvalor = ?  WHERE maqcodigo = ?");
            pst.setString(1, maquinario.getDescricao());
            pst.setString(2, maquinario.getAno());
            pst.setDouble(3, maquinario.getValor());
            pst.setInt(4, maquinario.getCodigo());
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
    
    public static boolean SetExcluiMaquinario(Integer codigo, Connection conexao){
        boolean excluiu = false;
        try{
            PreparedStatement pst = conexao.prepareStatement("DELETE FROM tbmaquinario WHERE maqcodigo = ?");
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
    
    public static Maquinario getMaquinario(Integer codigo, Connection conexao){
        Maquinario maquinario = null;
        try{
            PreparedStatement pst = conexao.prepareStatement("SELECT * FROM tbmaquinario WHERE maqcodigo = ?");
            pst.setInt(1, codigo);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Integer auxCodigo = rs.getInt("maqcodigo");
                String descricao = rs.getString("maqdescricao");
                String ano = rs.getString("maqano");
                Double valor = rs.getDouble("maqvalor");
                maquinario = new Maquinario(auxCodigo, descricao, ano, valor);
            }
        }
        catch(SQLException erro){
            System.out.println("Erro de sql: " + erro.getMessage());
        }
        return maquinario;
    }
}
