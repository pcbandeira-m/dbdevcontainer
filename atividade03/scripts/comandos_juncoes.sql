-- =========================================
-- SCRIPT DE CONSULTAS: OPERADORES DE JUNÇÃO
-- =========================================

-- D1. SELECT de DUAS tabelas usando junção qualificada (INNER JOIN)
-- Exibe a placa e modelo do veículo junto com o nome do motorista proprietário
SELECT 
    v.placa, 
    v.marca, 
    v.modelo, 
    u.nome AS nome_motorista
FROM VEICULO v
INNER JOIN USUARIO u ON v.id_motorista = u.id_usuario;

-- D2. SELECT de TRÊS tabelas usando junções qualificadas (INNER JOIN)
-- Lista todas as reservas mostrando o nome do passageiro, o ID da carona e a rota correspondente
SELECT 
    u.nome AS nome_passageiro, 
    r.id_carona, 
    rt.endereco_saida, 
    rt.endereco_destino
FROM RESERVA r
INNER JOIN USUARIO u ON r.id_usuario = u.id_usuario
INNER JOIN CARONA c ON r.id_carona = c.id_carona
INNER JOIN ROTA rt ON c.id_rota = rt.id_rota;

-- D3. SELECT usando operador de junção externa (LEFT OUTER JOIN)
-- Lista TODOS os usuários do sistema e, caso eles sejam motoristas, exibe a placa do veículo.
-- Usuários que não são motoristas aparecerão na listagem com o campo da placa como NULL.
SELECT 
    u.id_usuario, 
    u.nome, 
    u.sobrenome, 
    v.placa AS placa_veiculo
FROM USUARIO u
LEFT OUTER JOIN VEICULO v ON u.id_usuario = v.id_motorista;

-- D4. SELECT usando o operador de junção qualificada FULL OUTER JOIN
-- Cruza todas as caronas e todas as reservas do sistema.
-- Exibe as caronas mesmo que não tenham reservas e exibe reservas mesmo que (em um cenário hipotético) 
-- a carona vinculada tivesse sido apagada, garantindo integridade visual total de ambos os lados.
SELECT 
    c.id_carona, 
    c.data_viagem, 
    c.hora_saida, 
    r.id_usuario AS id_passageiro_reserva
FROM CARONA c
FULL OUTER JOIN RESERVA r ON c.id_carona = r.id_carona;