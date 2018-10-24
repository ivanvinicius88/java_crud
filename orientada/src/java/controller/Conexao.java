/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author 42165 
 */
public class Conexao {
    private static String base = "orientada";
    private static String servidor = "localhost";
    private static String porta = ":5432";
    private static String usuario = "postgres";
    private static String senha = "unidavi";
    private static String driver = "org.postgresql.Driver";
    private static String url = "jdbc:postgresql://"+servidor+porta+"/"+base;
    
    public static Connection getConexao(){
        Connection conexao = null;
        try{
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, usuario, senha);
        }
        catch(ClassNotFoundException erro){
            System.out.println("Erro de driver: " + erro.getMessage());
        }
        catch(SQLException erro){
            System.out.println("Erro de conexão: " + erro.getMessage());
        }
        return conexao;
    }
    
    public static void setFechaConexao(Connection conexao){
        try{
            if(conexao != null){
                conexao.close();
            }
        }
        catch(SQLException erro){
            System.out.println("Erro ao fechar a conexão: " + erro.getMessage());
        }
    }
}
