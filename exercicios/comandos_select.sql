-- ============================================================================
-- DISCIPLINA: Banco de Dados
-- PROFESSOR: Demostenes Santos de Sena
-- ATIVIDADE: Comandos DQL - SELECT - (Sistema Agendamento)
-- COMPONENTES: Alisson Bruno Dantas Felix e Patricia Cristina Bandeira de Melo
-- ============================================================================


-- 1. Listar todos os dados de todas as pessoas cadastradas.
SELECT * 
FROM pessoa;

-- 2. Listar nome, e-mail e data de nascimento das pessoas cadastradas.
SELECT nome, email, data_nascimento 
FROM pessoa;

-- 3. Listar nome, e-mail e data de nascimento da 3ª à 8ª pessoa cadastrada.
SELECT nome, email, data_nascimento 
FROM pessoa 
ORDER BY cpf 
LIMIT 6 OFFSET 2;

-- 4. Listar nome, e-mail e idade das pessoas cadastradas.
-- AGE() = calcula o intervalo exato 
-- EXTRACT(YEAR FROM ...) = extrai a parte dos anos
SELECT nome, email, EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade 
FROM pessoa;

-- 5. Listar a quantidade de agendamentos.
SELECT COUNT(*) AS quantidade_agendamentos 
FROM agendamento;

-- 6. Listar a data/hora das consultas e os respectivos valores com desconto de 5%.
SELECT data_hora_consulta, 
       'R$ ' || TO_CHAR(valor_consulta * 0.95, 'FM999990.00') AS valor_com_desconto
FROM agendamento;

-- 7. Listar nome, cpf e e-mail dos pacientes que não possuem plano de saúde.
SELECT p.nome, p.cpf, p.email 
FROM pessoa p
JOIN paciente pa ON p.cpf = pa.cpf_pessoa
WHERE pa.plano_de_saude = FALSE;

-- 8. Listar os dados dos agendamentos registrados para o mesmo mês da consulta.
SELECT * 
FROM agendamento 
WHERE EXTRACT(MONTH FROM data_hora_agendamento) = EXTRACT(MONTH FROM data_hora_consulta)
  AND EXTRACT(YEAR FROM data_hora_agendamento) = EXTRACT(YEAR FROM data_hora_consulta);

-- 9. Listar cpf, nome e e-mail dos pacientes que não possuem telefone.
SELECT p.cpf, p.nome, p.email 
FROM pessoa p
JOIN paciente pa ON p.cpf = pa.cpf_pessoa
WHERE p.telefone IS NULL OR p.telefone = '';

-- 10. Listar a data das consultas cujo o valor está entre R$ 50.00 e R$ 100.00.
SELECT data_hora_consulta::DATE AS data_consulta 
FROM agendamento 
WHERE valor_consulta BETWEEN 50.00 AND 100.00;

-- 11. Listar cpf, nome e e-mail dos pacientes que moram em "Natal".
-- ILIKE = evita problemas de maiúsculas/minúsculas
SELECT p.cpf, p.nome, p.email 
FROM pessoa p
JOIN paciente pa ON p.cpf = pa.cpf_pessoa
WHERE p.endereco ILIKE '%Natal%';

-- 12. Listar cpf, nome, e-mail e data de nascimento dos pacientes ordenados pela data de nascimento.
SELECT p.cpf, p.nome, p.email, p.data_nascimento 
FROM pessoa p
JOIN paciente pa ON p.cpf = pa.cpf_pessoa
ORDER BY p.data_nascimento ASC;

-- 13. Listar a quantidade de pacientes que não possuem plano de saúde.
SELECT COUNT(*) AS total_pacientes_sem_plano 
FROM paciente 
WHERE plano_de_saude = FALSE;

-- 14. Listar o maior e o menor valor das consultas agendadas para cada dia que contém consulta.
SELECT data_hora_consulta::DATE AS dia_consulta, 
       MAX(valor_consulta) AS maior_valor, 
       MIN(valor_consulta) AS menor_valor
FROM agendamento 
GROUP BY data_hora_consulta::DATE
ORDER BY dia_consulta;

-- 15. Listar a média dos valores das consultas agendadas para o mês de Dezembro.
SELECT ROUND(AVG(valor_consulta), 2) AS media_valores_dezembro 
FROM agendamento 
WHERE EXTRACT(MONTH FROM data_hora_consulta) = 12;

-- 16. Listar nome e e-mail das pessoas que agendaram alguma consulta para o dia do seu aniversário.
SELECT DISTINCT p.nome, p.email 
FROM pessoa p
JOIN agendamento a ON p.cpf = a.cpf_paciente
WHERE EXTRACT(DAY FROM a.data_hora_consulta) = EXTRACT(DAY FROM p.data_nascimento)
  AND EXTRACT(MONTH FROM a.data_hora_consulta) = EXTRACT(MONTH FROM p.data_nascimento);

-- 17. Listar o nome, e-mail, cpf dos médicos e as suas respectivas especialidades.
SELECT p.nome, p.email, p.cpf, e.descricao AS especialidade
FROM pessoa p
JOIN medico m ON p.cpf = m.cpf_pessoa
JOIN medico_especialidade me ON m.cpf_pessoa = me.cpf_medico
JOIN especialidade e ON me.id_especialidade = e.identificador;

-- 18. Listar a quantidade de consultas para cada médico.
-- Traz o nome do médico e faz a contagem agrupada de agendamentos
SELECT p.nome AS nome_medico, COUNT(a.id) AS quantidade_consultas
FROM pessoa p
JOIN medico m ON p.cpf = m.cpf_pessoa
LEFT JOIN agendamento a ON m.cpf_pessoa = a.cpf_medico
GROUP BY p.cpf, p.nome
ORDER BY quantidade_consultas DESC;