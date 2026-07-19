-- ============================================================================
-- SCRIPT DE CRIAÇÃO DO BANCO DE DADOS: SISTEMA DE CARONAS
-- SGBD: PostgreSQL
-- ============================================================================

-- 1. REMOÇÃO DE TABELAS EXISTENTES (Ordem inversa das dependências)
DROP TABLE IF EXISTS ROTA_PARADAS CASCADE;
DROP TABLE IF EXISTS RESERVA CASCADE;
DROP TABLE IF EXISTS CARONA CASCADE;
DROP TABLE IF EXISTS ROTA CASCADE;
DROP TABLE IF EXISTS VEICULO CASCADE;
DROP TABLE IF EXISTS MOTORISTA CASCADE;
DROP TABLE IF EXISTS USUARIO CASCADE;

-- 2. CRIAÇÃO DAS TABELAS

CREATE TABLE USUARIO (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    contato VARCHAR(20) NOT NULL,
    mini_biografia TEXT
);

CREATE TABLE MOTORISTA (
    id_usuario INT PRIMARY KEY,
    CONSTRAINT fk_motorista_usuario FOREIGN KEY (id_usuario) 
        REFERENCES USUARIO(id_usuario) ON DELETE CASCADE
);

CREATE TABLE VEICULO (
    placa VARCHAR(10) PRIMARY KEY,
    id_motorista INT NOT NULL,
    marca VARCHAR(30) NOT NULL,
    modelo VARCHAR(30) NOT NULL,
    cor VARCHAR(20) NOT NULL,
    ano INT NOT NULL,
    CONSTRAINT fk_veiculo_motorista FOREIGN KEY (id_motorista) 
        REFERENCES MOTORISTA(id_usuario) ON DELETE CASCADE
);

CREATE TABLE ROTA (
    id_rota INT PRIMARY KEY,
    endereco_saida VARCHAR(255) NOT NULL,
    endereco_destino VARCHAR(255) NOT NULL
);

CREATE TABLE ROTA_PARADAS (
    id_rota INT,
    paradas VARCHAR(255),
    PRIMARY KEY (id_rota, paradas),
    CONSTRAINT fk_paradas_rota FOREIGN KEY (id_rota) 
        REFERENCES ROTA(id_rota) ON DELETE CASCADE
);

CREATE TABLE CARONA (
    id_carona INT PRIMARY KEY,
    id_motorista INT NOT NULL,
    id_rota INT NOT NULL,
    data_viagem DATE NOT NULL,
    hora_saida TIME NOT NULL,
    hora_chegada TIME NOT NULL,
    qntd_passageiros INT NOT NULL,
    limite_banco_traseiro BOOLEAN DEFAULT FALSE,
    valor_passageiro DECIMAL(10,2),
    comentario TEXT,
    CONSTRAINT fk_carona_motorista FOREIGN KEY (id_motorista) 
        REFERENCES MOTORISTA(id_usuario) ON DELETE RESTRICT,
    CONSTRAINT fk_carona_rota FOREIGN KEY (id_rota) 
        REFERENCES ROTA(id_rota) ON DELETE RESTRICT
);

CREATE TABLE RESERVA (
    id_usuario INT,
    id_carona INT,
    PRIMARY KEY (id_usuario, id_carona),
    CONSTRAINT fk_reserva_usuario FOREIGN KEY (id_usuario) 
        REFERENCES USUARIO(id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_reserva_carona FOREIGN KEY (id_carona) 
        REFERENCES CARONA(id_carona) ON DELETE CASCADE
);