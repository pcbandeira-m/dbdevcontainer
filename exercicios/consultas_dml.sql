-- ============================================================================
-- POPULAÇÃO DO BANCO DE DADOS (20 PESSOAS NO TOTAL)
-- ============================================================================

-- Garante que as tabelas fiquem vazias antes da inserção e reinicia os contadores (IDs)
TRUNCATE TABLE agendamento, medico_especialidade, especialidade, medico, paciente, pessoa RESTART IDENTITY CASCADE;

-- 1. Inserindo as 20 Pessoas (Mistura de Médicos e Pacientes com dados variados)
INSERT INTO pessoa (cpf, nome, email, data_nascimento, endereco, telefone) VALUES
('11122233344', 'Dr. Arnaldo Silva', 'arnaldo@clinica.com', '1975-05-12', 'Av. Hermes da Fonseca, Tirol, Natal', '84999991111'),
('22233344455', 'Dra. Beatriz Costa', 'beatriz@clinica.com', '1980-08-20', 'Rua Mossoró, Petrópolis, Natal', '84999992222'),
('55566677788', 'Carlos Eduardo', 'carlos.edu@gmail.com', '1995-12-05', 'Rua das Flores, Lagoa Nova, Natal', NULL),
('99988877766', 'Mariana Sousa', 'mariana.s@hotmail.com', '1990-03-15', 'Av. Roberto Freire, Ponta Negra, Natal', '84988883333'),
('44455566611', 'Ana Júlia', 'ana.julia@gmail.com', '2000-07-17', 'Rua João Pessoa, Centro, Macaíba', '84987774444'),
('10020030044', 'Dr. Fabio Albuquerque', 'fabio.alb@clinica.com', '1982-11-04', 'Av. Deodoro da Fonseca, Cidade Alta, Natal', '84999993333'),
('10020030055', 'Dra. Camila Vasconcelos', 'camila.v@clinica.com', '1988-01-30', 'Rua Trairi, Petrópolis, Natal', '84999994444'),
('10020030066', 'Dr. Ricardo Mendes', 'ricardo.m@clinica.com', '1979-06-14', 'Av. Amintas Barros, Lagoa Nova, Natal', '84999995555'),
('10020030077', 'Dra. Juliana Freire', 'juliana.f@clinica.com', '1991-09-22', 'Rua Potengi, Petrópolis, Natal', '84999996666'),
('10020030088', 'Dr. Lucas Fontes', 'lucas.fontes@clinica.com', '1985-04-08', 'Av. Prudente de Morais, Tirol, Natal', '84999997777'),
('33344455599', 'Roberto de Almeida', 'roberto.almeida@gmail.com', '1970-07-17', 'Rua São João, Centro, Natal', '84988112233'),
('44433322211', 'Fernanda Lima', 'fernanda.lima@outlook.com', '1993-05-25', 'Av. Ayrton Senna, Nova Parnamirim, Parnamirim', '84987223344'),
('55544433322', 'Gabriel Silva e Sousa', 'gabriel.ss@gmail.com', '2002-10-12', 'Rua das Laranjeiras, Nova Natal, Natal', NULL),
('66655544433', 'Amanda Pinheiro', 'amanda.pinheiro@hotmail.com', '1987-02-28', 'Rua Miramar, Areia Preta, Natal', '84994556677'),
('77766655544', 'Pedro Henrique Alves', 'pedro.alves@yahoo.com.br', '1965-08-03', 'Av. Capitão-Mor Gouveia, Lagoa Nova, Natal', '84981229988'),
('88877766655', 'Beatriz Rocha', 'beatriz.rocha@gmail.com', '1998-12-15', 'Rua Moema, Igapó, Natal', NULL),
('22211100099', 'Lucas Gabriel Medeiros', 'lucas.gabriel@gmail.com', '2005-03-20', 'Rua da Solidade, Centro, Macaíba', '84988771122'),
('33322211100', 'Larissa Cavalcanti', 'larissa.c@outlook.com', '1994-11-02', 'Av. Engenheiro Roberto Freire, Capim Macio, Natal', '84996554433'),
('44433322200', 'Rodrigo Fagundes', 'rodrigo.fagundes@gmail.com', '1981-12-01', 'Rua Chile, Ribeira, Natal', '84987441100'),
('55544433300', 'Patrícia Costa de Melo', 'patricia.melo@gmail.com', '1992-07-10', 'Rua Potengi, Petrópolis, Natal', '84991223344');

-- 2. Inserindo os Pacientes (13 no total)
INSERT INTO paciente (cpf_pessoa, senha, plano_de_saude) VALUES
('55566677788', 'senha123', FALSE),
('99988877766', 'mari1990', TRUE),
('44455566611', 'anaj2000', FALSE),
('33344455599', 'rob7070', TRUE),
('44433322211', 'fer1993', FALSE),
('55544433322', 'gabs2002', FALSE),
('66655544433', 'ama8787', TRUE),
('77766655544', 'pedro65', FALSE),
('88877766655', 'bia9898', FALSE),
('22211100099', 'lucas05', TRUE),
('33322211100', 'lari9494', TRUE),
('44433322200', 'rod1981', FALSE),
('55544433300', 'paty92', TRUE);

-- 3. Inserindo os Médicos (7 no total)
INSERT INTO medico (cpf_pessoa, crm) VALUES
('11122233344', 'CRM/RN 1234'),
('22233344455', 'CRM/RN 5678'),
('10020030044', 'CRM/RN 9911'),
('10020030055', 'CRM/RN 9922'),
('10020030066', 'CRM/RN 9933'),
('10020030077', 'CRM/RN 9944'),
('10020030088', 'CRM/RN 9955'),
('33344455599', 'CRM/RN 9966');

-- 4. Inserindo Especialidades
INSERT INTO especialidade (descricao) VALUES 
('Cardiologia'),
('Pediatria'),
('Clínica Médica'),
('Psiquiatria');

-- 5. Associando Médicos às Especialidades (Relacionamento N:M)
INSERT INTO medico_especialidade (cpf_medico, id_especialidade) VALUES
('11122233344', 1),
('11122233344', 3),
('22233344455', 2),
('10020030044', 1),
('10020030055', 2),
('10020030066', 3),
('10020030077', 1),
('10020030088', 3),
('33344455599', 2);

-- 6. Inserindo Histórico de Agendamentos para os Testes
INSERT INTO agendamento (cpf_paciente, cpf_medico, data_hora_consulta, data_hora_agendamento, valor_consulta) VALUES
('55566677788', '11122233344', '2026-12-10 14:00:00', '2026-12-01 09:15:00', 150.00),
('99988877766', '22233344455', '2026-07-20 10:30:00', '2026-07-15 16:00:00', 0.00),
('44455566611', '11122233344', '2026-07-17 15:00:00', '2026-07-10 11:00:00', 80.00),
('33344455599', '10020030066', '2026-07-17 16:30:00', '2026-07-12 10:00:00', 0.00),
('44433322211', '10020030044', '2026-08-05 09:00:00', '2026-07-15 14:20:00', 180.00),
('55544433322', '10020030055', '2026-08-05 10:30:00', '2026-07-15 14:30:00', 75.00),
('44433322200', '10020030088', '2026-12-15 11:00:00', '2026-11-20 08:00:00', 90.00),
('55566677788', '11122233344', '2020-12-05 10:00:00', '2020-11-25 09:15:00', 200.00),
('99988877766', '11122233344', '2020-12-15 14:30:00', '2020-12-01 16:00:00', 100.00),
('44455566611', '22233344455', '2020-12-20 09:00:00', '2020-12-10 11:00:00', 250.00);