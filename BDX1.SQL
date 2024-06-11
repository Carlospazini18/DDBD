#Usando a base de dados BDEX1_HOSPITAL, responda:
USE BDEX1_HOSPITAL;

# 1 - Exibir todas as informações da tabela PACIENTES.
SELECT * FROM pacientes;

# 2 - Mostrar os nomes e e-mails dos pacientes que nasceram depois do ano 2000.
SELECT nome, email FROM pacientes; 

# 3 - Listar os nomes dos médicos e as especialidades em que trabalham.
SELECT
	md.nome, dp.nome_especialidade 
FROM
	medicos md
JOIN
	departamentos dp ON dp.cod_especialidade = md.depto_cod_espec;

# 4 - Exibir os detalhes das consultas: ID da consulta, data, hora, nome do médico e nome do paciente.
SELECT 
	cons.id_consulta, concat_ws('|', cons.data_cons, cons.hora_cons) AS 'data e hora', md.nome, pas.nome
FROM	
	consultas cons
JOIN
	medicos md ON md.crm = cons.crm AND md.uf = cons.uf
JOIN
	pacientes pas ON pas.cpf_paciente = cons.cpf_paciente
;

# 5 - Listar o nome dos pacientes e quantas consultas cada um fez.
SELECT 
	pas.nome, count(cons.id_consulta) AS 'Qntd de consultas'
FROM 
	pacientes pas
JOIN
	consultas cons ON cons.cpf_paciente = pas.cpf_paciente
GROUP BY
	pas.nome 
ORDER BY 
	pas.nome ASC
;

# 6 - Mostrar as especialidades de médicos que fizeram consultas em 2024.
SELECT 
	md.nome, dp.nome_especialidade, cons.data_cons
FROM
	medicos md
JOIN
	departamentos dp ON dp.cod_especialidade = md.depto_cod_espec
JOIN
	consultas cons ON cons.crm = md.crm AND cons.uf = md.uf
WHERE 
	YEAR(cons.data_cons) = 2024
;

# 7 - Listar todos os departamentos, ordenados pelo nome da especialidade de A a Z.
SELECT
	nome_especialidade
FROM
	departamentos
ORDER BY
	nome_especialidade ASC
;

# 8 - Mostrar os nomes e e-mails dos médicos que não têm telefone cadastrado.
SELECT 
	nome, email
FROM 
	medicos
WHERE 
	telefone IS NULl OR telefone = ''
;

# 9 - Exibir os nomes dos pacientes que têm consultas com médicos do departamento de Cardiologia.
SELECT
	pas.nome, dpt.nome_especialidade
FROM
	pacientes pas 
JOIN
	consultas cons ON cons.cpf_paciente = pas.cpf_paciente
JOIN
	medicos md ON md.crm = cons.crm AND md.uf = cons.uf
JOIN
	departamentos dpt ON dpt.cod_especialidade = md.depto_cod_espec
WHERE
	dpt.nome_especialidade = 'CARDIOLOGIA'
;

# 10 - Para cada especialidade, mostrar o nome da especialidade e a média de consultas realizadas pelos médicos dessa especialidade.
SELECT
	ec.especialidade, AVG(ec.quantidade)
FROM (SELECT
		dpt.nome_especialidade AS especialidade, count(cons.id_consulta) AS quantidade
	FROM
		departamentos dpt
	JOIN
		medicos md ON md.depto_cod_espec = dpt.cod_especialidade
	JOIN
		consultas cons	ON cons.crm = md.crm AND cons.uf = md.uf
	GROUP BY
		dpt.nome_especialidade) ec
GROUP BY
	ec.especialidade
;

SELECT 
	especialidade, ROUND(AVG(quantidade), 2) AS 'consulta por especialidade'
FROM (SELECT 
		CONCAT_WS('  -  ',md.crm, md.uf) as id_md,
        md.nome,
		dpt.nome_especialidade AS especialidade,
        COUNT(cons.id_consulta) AS quantidade
	FROM
		medicos md
	JOIN
		departamentos dpt ON dpt.cod_especialidade = md.depto_cod_espec
	JOIN 
		consultas cons ON cons.crm = md.crm AND cons.uf = cons.uf
	GROUP BY
		id_md, md.nome, dpt.nome_especialidade) AS cons_md
GROUP BY 
		especialidade;


# 11 - Contar quantos pacientes têm um telefone cadastrado.
SELECT count(*) AS 'total de numeros' FROM pacientes WHERE telefone IS NOT NULL OR  telefone = '';

# 12 - Listar os nomes dos médicos que fizeram mais de 10 consultas.
SELECT
	nome
FROM 
	(SELECT 
		md.nome AS nome, COUNT(cons.id_consulta) AS quant_cons
	FROM 
		medicos md 
	JOIN 
		consultas cons ON cons.crm = md.crm AND cons.uf = md.uf
	GROUP BY
		md.nome) AS cons_med
WHERE quant_cons >   10;


-- ou


SELECT 
	md.nome
FROM 
	medicos md 
JOIN 
	consultas cons ON cons.crm = md.crm AND cons.uf = md.uf
GROUP BY
	md.nome
HAVING 
	COUNT(cons.id_consulta) > 10;

# 13 - Mostrar o nome dos pacientes e a data da última consulta que eles fizeram.
SELECT 
	pa.nome,
    CONCAT_WS('/', DAY(MAX(cons.data_cons)), MONTH(MAX(cons.data_cons)), YEAR(MAX(cons.data_cons))) AS'última consulta'
FROM
	pacientes pa
JOIN
	consultas cons ON cons.cpf_paciente = pa.cpf_paciente
GROUP BY
	pa.nome;

# 14 - Contar quantas consultas cada médico realizou.
SELECT
	md.nome,
    COUNT(cons.id_consulta) AS 'N° de consultas'
FROM
	medicos md
JOIN
	consultas cons ON cons.crm = md.crm AND cons.uf = md.uf
GROUP BY 
	md.nome
;

# 15 - Para cada paciente que fez uma consulta, mostrar o CPF, o nome e a porcentagem de consultas em relação ao total de consultas feitas por todos os pacientes.
SELECT
	total_pac.nome,
	total_pac.cpf,
    CONCAT(ROUND((total_pac.qt_pac / qt_total.qt_geral) * 100, 1), '%') AS porcentagem
FROM
	(SELECT
		pa.cpf_paciente AS cpf,
        pa.nome AS nome,
        COUNT(cons.id_consulta) AS qt_pac
	FROM
		pacientes pa
	LEFT JOIN
		consultas cons ON cons.cpf_paciente = pa.cpf_paciente
	GROUP BY
		cpf, nome) AS total_pac
JOIN 
	(SELECT
		COUNT(*) AS qt_geral
	FROM consultas
    ) AS qt_total
;
