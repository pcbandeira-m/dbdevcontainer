-- =====================================
-- SCRIPT DE CONSULTAS: COMANDOS SELECT
-- =====================================

-- C1. Listar todos os campos de todos os registros de uma tabela
SELECT * FROM VEICULO;

-- C2. Listar alguns campos dos registros que satisfazem uma condição simples
-- Lista o ID, a data e o horário de saída apenas das caronas que cobram mais de R$ 5.00
SELECT id_carona, data_viagem, hora_saida, valor_passageiro 
FROM CARONA 
WHERE valor_passageiro > 5.00;

-- C3. Listar alguns campos dos registros que satisfazem uma condição composta
-- Lista os veículos da marca 'Chevrolet' OU que tenham sido fabricados a partir do ano 2020
SELECT placa, marca, modelo, ano 
FROM VEICULO 
WHERE marca = 'Chevrolet' OR ano >= 2020;

-- C4. Listar usando GROUP BY com registros que satisfazem uma condição
-- Filtra as caronas que possuem limite no banco traseiro ativo e agrupa por motorista,
-- mostrando a média de valor cobrado por cada um deles
SELECT id_motorista, COUNT(id_carona) AS total_caronas, ROUND(AVG(valor_passageiro), 2) AS media_valor
FROM CARONA
WHERE limite_banco_traseiro = TRUE
GROUP BY id_motorista;

-- C5. Listar contendo como condição outro SELECT (SELECTs aninhados)
-- Seleciona o nome e contato de todos os usuários do sistema que possuem reservas ativas.
-- O SELECT interno (subquery) extrai a lista de IDs únicos da tabela de RESERVA.
SELECT nome, sobrenome, contato 
FROM USUARIO 
WHERE id_usuario IN (
    SELECT DISTINCT id_usuario 
    FROM RESERVA
);