-- ============================================================================
-- CRIAÇÃO DAS TABELAS DO SISTEMA DE AGENDAMENTO
-- ============================================================================

-- Remove as tabelas caso elas já existam (evita erros ao reinstalar o banco)
DROP TABLE IF EXISTS agendamento CASCADE;
DROP TABLE IF EXISTS medico_especialidade CASCADE;
DROP TABLE IF EXISTS especialidade CASCADE;
DROP TABLE IF EXISTS medico CASCADE;
DROP TABLE IF EXISTS paciente CASCADE;
DROP TABLE IF EXISTS pessoa CASCADE;


CREATE TABLE pessoa (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15)
);

-- (Herança/Extensão de Pessoa)
CREATE TABLE paciente (
    cpf_pessoa VARCHAR(11) PRIMARY KEY,
    senha VARCHAR(50) NOT NULL,
    plano_de_saude BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (cpf_pessoa) REFERENCES pessoa(cpf) ON DELETE CASCADE
);

-- (Herança/Extensão de Pessoa)
CREATE TABLE medico (
    cpf_pessoa VARCHAR(11) PRIMARY KEY,
    crm VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (cpf_pessoa) REFERENCES pessoa(cpf) ON DELETE CASCADE
);

CREATE TABLE especialidade (
    id_especialidade SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL UNIQUE
);

-- (Muitos para Muitos)
CREATE TABLE medico_especialidade (
    cpf_medico VARCHAR(11),
    id_especialidade INT,
    PRIMARY KEY (cpf_medico, id_especialidade),
    FOREIGN KEY (cpf_medico) REFERENCES medico(cpf_pessoa) ON DELETE CASCADE,
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade) ON DELETE CASCADE
);

CREATE TABLE agendamento (
    id_agendamento SERIAL PRIMARY KEY,
    cpf_paciente VARCHAR(11) NOT NULL,
    cpf_medico VARCHAR(11) NOT NULL,
    data_hora_consulta TIMESTAMP NOT NULL,
    data_hora_agendamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_consulta DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (cpf_paciente) REFERENCES paciente(cpf_pessoa) ON DELETE CASCADE,
    FOREIGN KEY (cpf_medico) REFERENCES medico(cpf_pessoa) ON DELETE CASCADE
);