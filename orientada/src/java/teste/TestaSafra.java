package teste;

import controller.SafraDB;
import controller.Conexao;
import java.sql.Connection;
import java.util.ArrayList;
import model.Safra;


public class TestaSafra {
    public static void main(String[] args) {
        Connection conexao = Conexao.getConexao();
        ArrayList lista = SafraDB.getSafras(conexao);
        for(int i = 0; i < lista.size(); i++){
            Safra safra = (Safra) lista.get(i);
            System.out.println("Código: " + safra.getCodigo());
            System.out.println("descricao: " + safra.getDescricao());
            System.out.println("ano: " + safra.getAno());
            System.out.println("***********");
        }
        Conexao.setFechaConexao(conexao);
    }
}
