-- ============================================================================
-- SCRIPT DML: MANIPULAÇÃO DE DADOS (B1 AO B11)
-- SGBD: PostgreSQL
-- ============================================================================

-- ----------------------------------------------------------------------------
-- B1. Inserir 5 registros em cada uma das tabelas do modelo
-- ----------------------------------------------------------------------------

INSERT INTO USUARIO (id_usuario, nome, sobrenome, data_nascimento, email, contato, mini_biografia) VALUES
(1, 'Carlos', 'Eduardo', '1995-12-05', 'carlos.edu@gmail.com', '84988881111', 'Adoro viajar e conversar.'),
(2, 'Mariana', 'Sousa', '1990-03-15', 'mariana.s@hotmail.com', '84988882222', 'Motorista prudente, escuto rock.'),
(3, 'Ana', 'Júlia', '2000-07-17', 'ana.julia@gmail.com', '84987773333', NULL),
(4, 'Roberto', 'Almeida', '1985-04-08', 'roberto.a@gmail.com', '84988114444', 'Vou para a faculdade todo dia.'),
(5, 'Fernanda', 'Lima', '1993-05-25', 'fernanda.l@outlook.com', '84987225555', 'Trabalho na área de TI.');

INSERT INTO MOTORISTA (id_usuario) VALUES 
(2), 
(4), 
(5);

INSERT INTO VEICULO (placa, id_motorista, marca, modelo, cor, ano) VALUES
('ABC1234', 2, 'Fiat', 'Argo', 'Prata', 2020),
('XYZ5678', 4, 'Chevrolet', 'Onix', 'Preto', 2019),
('KJD9988', 5, 'Volkswagen', 'Gol', 'Branco', 2015),
('MCO4455', 2, 'Ford', 'Ka', 'Vermelho', 2018),
('NBL3322', 4, 'Hyundai', 'HB20', 'Cinza', 2022);

INSERT INTO ROTA (id_rota, endereco_saida, endereco_destino) VALUES
(10, 'Centro, Natal', 'Campus Central, UFRN'),
(20, 'Zona Norte, Natal', 'Centro, Parnamirim'),
(30, 'Macaíba', 'Lagoa Nova, Natal'),
(40, 'Ponta Negra, Natal', 'Petrópolis, Natal'),
(50, 'Nova Parnamirim', 'Centro, Natal');

INSERT INTO ROTA_PARADAS (id_rota, paradas) VALUES
(10, 'Midway Mall'),
(10, 'Via Direta'),
(20, 'Passarela de Neópolis'),
(30, 'Parada do Ganho'),
(40, 'Praça das Flores');

INSERT INTO CARONA (id_carona, id_motorista, id_rota, data_viagem, hora_saida, hora_chegada, qntd_passageiros, limite_banco_traseiro, valor_passageiro, comentario) VALUES
(101, 2, 10, '2026-08-10', '07:00:00', '07:45:00', 4, TRUE, 5.00, 'Sem atrasos, por favor.'),
(102, 4, 20, '2026-08-10', '18:00:00', '19:00:00', 3, FALSE, 7.50, 'Aceito pets de pequeno porte.'),
(103, 5, 30, '2026-08-11', '06:30:00', '07:30:00', 4, TRUE, 10.00, NULL),
(104, 2, 40, '2026-08-12', '13:30:00', '14:00:00', 2, FALSE, 4.00, 'Carona rápida.'),
(105, 4, 50, '2026-08-12', '07:15:00', '08:00:00', 3, TRUE, 6.00, 'Ar-condicionado ligado.');

INSERT INTO RESERVA (id_usuario, id_carona) VALUES
(1, 101),
(3, 101),
(1, 102),
(3, 103),
(1, 105);

-- ----------------------------------------------------------------------------
-- B2. Um comando UPDATE para atualizar um campo de todos os registros de uma tabela
-- ----------------------------------------------------------------------------

UPDATE CARONA 
SET limite_banco_traseiro = TRUE;

-- ----------------------------------------------------------------------------
-- B3. Um comando UPDATE para atualizar um campo que satisfaz uma condição simples
-- ----------------------------------------------------------------------------

UPDATE VEICULO 
SET cor = 'Grafite' 
WHERE placa = 'ABC1234';

-- ----------------------------------------------------------------------------
-- B4. Um comando UPDATE para atualizar um campo que satisfaz uma condição composta
-- ----------------------------------------------------------------------------

UPDATE CARONA 
SET qntd_passageiros = 4 
WHERE id_motorista = 4 AND id_rota = 20;

-- ----------------------------------------------------------------------------
-- B5. Um comando UPDATE para atualizar dois campos que satisfazem uma condição
-- ----------------------------------------------------------------------------

UPDATE CARONA 
SET valor_passageiro = 12.50, comentario = 'Valor reajustado devido aos novos custos.' 
WHERE id_carona = 103;

-- ----------------------------------------------------------------------------
-- B6. Um comando UPDATE para atualizar um campo usando o antigo valor desse campo
-- ----------------------------------------------------------------------------

UPDATE CARONA 
SET valor_passageiro = valor_passageiro + 1.50 
WHERE id_carona = 101;

-- ----------------------------------------------------------------------------
-- B7. Um comando UPDATE para atualizar um campo usando uma função
-- ----------------------------------------------------------------------------

UPDATE USUARIO 
SET sobrenome = UPPER(sobrenome);

-- ----------------------------------------------------------------------------
-- B8. Um comando DELETE para remover todos os registros de uma tabela
-- ----------------------------------------------------------------------------
-- IMPORTANTE: Como este comando exige a exclusão de todos os registros de uma tabela, escolhemos a tabela ROTA_PARADAS porque, se esvaziássemos uma tabela como USUARIO ou ROTA, as chaves estrangeiras das outras tabelas impediriam a execução devido às restrições de integridade. Portanto, os comandos seguintes (B9, B10, B11) usam dados das tabelas que permaneceram intactas para funcionar perfeitamente.

DELETE FROM ROTA_PARADAS;

-- ----------------------------------------------------------------------------
-- B9. Um comando DELETE para remover registros que satisfazem uma condição simples
-- ----------------------------------------------------------------------------

DELETE FROM VEICULO 
WHERE placa = 'KJD9988';

-- ----------------------------------------------------------------------------
-- B10. Um comando DELETE para remover registros que satisfazem uma condição composta
-- ----------------------------------------------------------------------------

DELETE FROM RESERVA 
WHERE id_usuario = 1 AND id_carona = 102;

-- ----------------------------------------------------------------------------
-- B11. Um comando DELETE baseado em uma função
-- ----------------------------------------------------------------------------

DELETE FROM USUARIO 
WHERE LENGTH(nome) <= 3;