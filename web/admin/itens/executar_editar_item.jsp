<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="model.Item"%>
<%@page import="dao.ItemDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>

<%
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

    if (usuarioLogado == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    int idItem = 0;
    String nome = "";
    String categoria = "";
    String tipo = "";
    String local = "";
    String dataOcorrenciaTexto = "";
    String descricao = "";
    String status = "";
    String imagemAtual = "";
    String novaImagem = null;
    File arquivoNovo = null;

    if (ServletFileUpload.isMultipartContent(request)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        upload.setHeaderEncoding("UTF-8");
        upload.setFileSizeMax(5 * 1024 * 1024);

        List<FileItem> campos = upload.parseRequest(request);

        for (FileItem campo : campos) {
            if (campo.isFormField()) {
                String valor = campo.getString("UTF-8");

                if (campo.getFieldName().equals("idItem")) idItem = Integer.parseInt(valor);
                if (campo.getFieldName().equals("nome")) nome = valor;
                if (campo.getFieldName().equals("categoria")) categoria = valor;
                if (campo.getFieldName().equals("tipo")) tipo = valor;
                if (campo.getFieldName().equals("local")) local = valor;
                if (campo.getFieldName().equals("dataOcorrencia")) dataOcorrenciaTexto = valor;
                if (campo.getFieldName().equals("descricao")) descricao = valor;
                if (campo.getFieldName().equals("status")) status = valor;
                if (campo.getFieldName().equals("imagemAtual")) imagemAtual = valor;
            } else {
                if (campo.getFieldName().equals("imagem") && campo.getSize() > 0) {
                    String nomeOriginal = new File(campo.getName()).getName();
                    String extensao = "";

                    int posicao = nomeOriginal.lastIndexOf(".");

                    if (posicao >= 0) {
                        extensao = nomeOriginal.substring(posicao);
                    }

                    String nomeArquivo = System.currentTimeMillis() + extensao;
                    String pastaUploads = application.getRealPath("/uploads");

                    File pasta = new File(pastaUploads);

                    if (!pasta.exists()) {
                        pasta.mkdirs();
                    }

                    arquivoNovo = new File(pasta, nomeArquivo);
                    campo.write(arquivoNovo);

                    novaImagem = "uploads/" + nomeArquivo;
                }
            }
        }

        String imagemFinal = imagemAtual;

        if (novaImagem != null) {
            imagemFinal = novaImagem;
        }

        Item item = new Item();
        item.setIdItem(idItem);
        item.setNome(nome);
        item.setCategoria(categoria);
        item.setTipo(tipo);
        item.setLocal(local);
        item.setDataOcorrencia(Date.valueOf(dataOcorrenciaTexto));
        item.setDescricao(descricao);
        item.setStatus(status);
        item.setImagem(imagemFinal);

        ItemDAO itemDAO = new ItemDAO();

        if (itemDAO.atualizar(item)) {
            if (novaImagem != null && imagemAtual != null && !imagemAtual.isEmpty()) {
                String caminhoImagemAntiga = application.getRealPath("/" + imagemAtual);
                File arquivoAntigo = new File(caminhoImagemAntiga);

                if (arquivoAntigo.exists()) {
                    arquivoAntigo.delete();
                }
            }

            response.sendRedirect("listar_item.jsp?sucesso=edicao");
        } else {
            if (arquivoNovo != null && arquivoNovo.exists()) {
                arquivoNovo.delete();
            }

            response.sendRedirect("editar_item.jsp?id=" + idItem + "&erro=1");
        }
    } else {
        response.sendRedirect("listar_item.jsp");
    }
%>