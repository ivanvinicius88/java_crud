/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import controller.Conexao;
import java.sql.Connection;

/**
 *
 * @author 42165
 */
public class  TestaConexao {
    public static void main(String[] args) {
    Connection conexao = Conexao.getConexao();
    Conexao.setFechaConexao(conexao);
    }    
}
