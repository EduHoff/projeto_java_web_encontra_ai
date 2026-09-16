# encontra_ai

Documentação rápida de execução do projeto.

## Docker

Primeira execução / Rebuild:
```
docker compose up --build
```

Iniciar:
```
docker compose run --rm encontra_ai
```

Encerrar:
```
docker compose down
```

## Código SQL utilizado para criar o banco de dados
```
DROP DATABASE IF EXISTS achados_perdidos; CREATE DATABASE achados_perdidos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; USE achados_perdidos; CREATE TABLE usuario (id_usuario INT AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(100) NOT NULL, login VARCHAR(50) NOT NULL UNIQUE, senha VARCHAR(100) NOT NULL, ativo BOOLEAN NOT NULL DEFAULT TRUE); CREATE TABLE item (id_item INT AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(150) NOT NULL, categoria VARCHAR(100) NOT NULL, tipo VARCHAR(20) NOT NULL, local VARCHAR(150) NOT NULL, data_ocorrencia DATE NOT NULL, descricao VARCHAR(500), status VARCHAR(30) NOT NULL, imagem VARCHAR(255), data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP); INSERT INTO usuario (nome, login, senha, ativo) VALUES ('Administrador', 'admin', '1234', TRUE); INSERT INTO item (nome, categoria, tipo, local, data_ocorrencia, descricao, status, imagem) VALUES ('Carteira Preta', 'Documentos', 'PERDIDO', 'Bloco A', '2026-09-01', 'Carteira preta contendo documentos pessoais.', 'ABERTO', NULL), ('Mochila Azul', 'Material Escolar', 'PERDIDO', 'Biblioteca', '2026-09-02', 'Mochila azul contendo cadernos e um estojo.', 'ABERTO', NULL), ('Chave de Carro', 'Chaves', 'ENCONTRADO', 'Estacionamento', '2026-09-03', 'Chave de veículo encontrada próxima ao estacionamento.', 'ABERTO', NULL), ('Celular Preto', 'Eletrônicos', 'PERDIDO', 'Cantina', '2026-08-25', 'Celular preto com capa transparente.', 'FINALIZADO', NULL), ('Óculos de Grau', 'Acessórios', 'ENCONTRADO', 'Laboratório de Informática', '2026-09-03', 'Óculos de grau com armação preta.', 'ABERTO', NULL);
```
