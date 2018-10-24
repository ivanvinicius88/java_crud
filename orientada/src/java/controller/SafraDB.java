package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Safra;


public class SafraDB {
    
        public static ArrayList getSafras(Connection conexao){
        ArrayList lista = new ArrayList();
        try{
            Statement st = conexao.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM tbsafra ORDER BY 1");
            while(rs.next()){
                int    codigo    = rs.getInt("safcodigo");
                String descricao = rs.getString("safdescricao");
                String ano       = rs.getString("safano");
                Safra safra = new Safra(codigo, descricao, ano);
                lista.add(safra);
            }
        }
        catch(SQLException erro){
            System.out.println("Erro de SQL: " + erro.getMessage());
        } 
        return lista;
    }
    
    public static boolean SetInsereSafra(Safra safra, Connection conexao){
        boolean inseriu = false;
        try{
            PreparedStatement pst = conexao.prepareStatement("INSERT INTO tbsafra (safdescricao, safano) values (?,?)");
            pst.setString(1, safra.getDescricao());
            pst.setString(2, safra.getAno());
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
        
        
    
    public static boolean SetExcluiSafra(int codigo, Connection conexao){
        boolean excluiu = false;
        try{
            PreparedStatement pst = conexao.prepareStatement("DELETE FROM tbsafra WHERE safcodigo = ?");
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
    
    
        public static boolean SetAlteraSafra(Safra safra, Connection conexao){
        boolean alterou = false;
        try{
            PreparedStatement pst = conexao.prepareStatement("UPDATE tbsafra SET safdescricao = ?, safano = ? WHERE safcodigo = ?");
            pst.setString(1, safra.getDescricao());
            pst.setString(2, safra.getAno());
            pst.setInt(3, safra.getCodigo());
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
    
    
    
    //função para pegar estado na hora da alteração
    public static Safra getSafra(int codigo, Connection conexao){
        Safra safra = null;
        try{
            PreparedStatement pst = conexao.prepareStatement("SELECT * FROM tbsafra where safcodigo = ?");
            pst.setInt(1, codigo);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                int auxCodigo = rs.getInt("safcodigo");
                String descricao = rs.getString("safdescricao");
                String ano = rs.getString("safano");
                safra = new Safra(auxCodigo, descricao, ano);
            }
        }
        catch(SQLException erro){
            System.out.println("Erro de SQL: " + erro.getMessage());
        }
        return safra;
    }
    
    
    
    
    
}
