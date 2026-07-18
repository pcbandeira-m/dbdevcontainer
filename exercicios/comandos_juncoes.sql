-- ============================================================================
-- Exercício 04 - Construção do Script com os operadores de JUNÇÃO do Contexto de "Agendamento de Consultas" 
-- ============================================================================

-- Nota: JOIN e INNER JOIN possuem o mesmo comportamento.

-- 1. Listar o nome, e-mail e crm dos médicos.
SELECT p.nome, 
       p.email, 
       m.crm 
FROM medico m
JOIN pessoa p ON m.cpf_pessoa = p.cpf;


-- 2. Listar o nome, e-mail e senha dos pacientes.
SELECT p.nome, 
       p.email, 
       pa.senha 
FROM paciente pa
JOIN pessoa p ON pa.cpf_pessoa = p.cpf;


-- 3. Listar os CRM dos médicos e as descrições das suas respectivas especialidades.

-- Obs: Uso de dois JOINs por causa da tabela intermediária
SELECT m.crm, 
       e.descricao 
FROM medico m
JOIN medico_especialidade me ON m.cpf_pessoa = me.cpf_medico
JOIN especialidade e ON me.id_especialidade = e.id_especialidade;


-- 4. Listar o crm de todos os médicos cardiologistas.
SELECT m.crm 
FROM medico m
JOIN medico_especialidade me ON m.cpf_pessoa = me.cpf_medico
JOIN especialidade e ON me.id_especialidade = e.id_especialidade
WHERE e.descricao = 'Cardiologia';


-- 5. Listar o nome, CPF, crm e senha dos pacientes que também são médicos.
SELECT p.nome, 
       p.cpf, 
       m.crm, 
       pa.senha 
FROM pessoa p
JOIN paciente pa ON p.cpf = pa.cpf_pessoa
JOIN medico m ON p.cpf = m.cpf_pessoa;


-- 6. Listar o nome dos médicos e as respectivas quantidades de consultas agendadas. 
-- Observem que alguns médicos podem não ter consulta agendada.
SELECT p.nome, 
       COUNT(a.id_agendamento) AS quantidade_consultas 
FROM medico m
JOIN pessoa p ON m.cpf_pessoa = p.cpf
LEFT JOIN agendamento a ON m.cpf_pessoa = a.cpf_medico
GROUP BY p.cpf, p.nome;


-- 7. Listar as especialidades e a quantidade de médicos cadastrados nessa especialidade. 
-- Observem que algumas especialidades podem não ter médicos associados.
SELECT e.descricao, 
       COUNT(me.cpf_medico) AS quantidade_medicos 
FROM especialidade e
LEFT JOIN medico_especialidade me ON e.id_especialidade = me.id_especialidade
GROUP BY e.id_especialidade, e.descricao;


-- 8. Listar os dados dos agendamentos, exibindo: (a) o nome e e-mail do paciente, 
-- (b) data/hora e valor da consulta, e (c) o nome e crm dos médicos.
SELECT p_paciente.nome AS nome_paciente, 
       p_paciente.email AS email_paciente, 
       a.data_hora_consulta, 
       a.valor_consulta, 
       p_medico.nome AS nome_medico, 
       m.crm 
FROM agendamento a
JOIN paciente pa ON a.cpf_paciente = pa.cpf_pessoa
JOIN pessoa p_paciente ON pa.cpf_pessoa = p_paciente.cpf
JOIN medico m ON a.cpf_medico = m.cpf_pessoa
JOIN pessoa p_medico ON m.cpf_pessoa = p_medico.cpf;


-- 9. Listar a data/hora das consultas agendadas para todos os cardiologistas cadastrados.
SELECT a.data_hora_consulta 
FROM agendamento a
JOIN medico_especialidade me ON a.cpf_medico = me.cpf_medico
JOIN especialidade e ON me.id_especialidade = e.id_especialidade
WHERE e.descricao = 'Cardiologia';


-- 10. Listar o nome e CRM dos médicos e a média das suas consultas agendadas 
-- para o mês de dezembro/2020.
SELECT p.nome, 
       m.crm, 
       AVG(a.valor_consulta) AS media_valor_consulta 
FROM medico m
JOIN pessoa p ON m.cpf_pessoa = p.cpf
LEFT JOIN agendamento a ON m.cpf_pessoa = a.cpf_medico 
    AND EXTRACT(MONTH FROM a.data_hora_consulta) = 12 
    AND EXTRACT(YEAR FROM a.data_hora_consulta) = 2020
GROUP BY p.cpf, p.nome, m.crm;