package model;

import java.sql.Date;
import java.sql.Timestamp;

public class Item {

    private int idItem;
    private String nome;
    private String categoria;
    private String tipo;
    private String local;
    private Date dataOcorrencia;
    private String descricao;
    private String status;
    private String imagem;
    private Timestamp dataCadastro;

    public Item() {
    }

    public Item(int idItem, String nome, String categoria, String tipo,
            String local, Date dataOcorrencia, String descricao,
            String status, String imagem, Timestamp dataCadastro) {

        this.idItem = idItem;
        this.nome = nome;
        this.categoria = categoria;
        this.tipo = tipo;
        this.local = local;
        this.dataOcorrencia = dataOcorrencia;
        this.descricao = descricao;
        this.status = status;
        this.imagem = imagem;
        this.dataCadastro = dataCadastro;
    }

    public int getIdItem() {
        return idItem;
    }

    public void setIdItem(int idItem) {
        this.idItem = idItem;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public Date getDataOcorrencia() {
        return dataOcorrencia;
    }

    public void setDataOcorrencia(Date dataOcorrencia) {
        this.dataOcorrencia = dataOcorrencia;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public Timestamp getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Timestamp dataCadastro) {
        this.dataCadastro = dataCadastro;
    }
}
