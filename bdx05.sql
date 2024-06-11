use BDEX5_EVENTOS;

#1. Exibir todas as informações da tabela PARTICIPANTES.
SELECT 
	*
FROM
	participantes;
    
#2. Mostrar os nomes e empresas dos participantes que nasceram depois do ano 1990.
SELECT
	empresa
FROM
	participantes
WHERE
	YEAR(data_nasc)  > 1990;

#3. Listar os nomes dos eventos e as entidades organizadoras.
SELECT
	nome_evento,
	entidade_evento
FROM
	eventos;

#4. Exibir os detalhes das atividades: ID da atividade, nome da atividade, data, hora, nome do evento.
SELECT
	atv.id_atividade,
    atv.nome_atv,
    atv.data_atv,
    atv.hora_atv,
    ev.nome_evento
FROM
	atividades atv
JOIN
	eventos ev ON ev.id_evento =  atv.evento_atv;

#5. Listar o nome dos participantes e quantas atividades cada um participou.
SELECT 
	par.nome,
    COUNT(par_atv.atividade) AS 'Qntd Eventos'
FROM
	participantes par
LEFT JOIN
	participante_atividade par_atv ON par_atv.cpf = par.cpf 
GROUP BY
	par.nome
ORDER BY
	par.nome ASC;

#6. Mostrar os nomes dos eventos realizados em 2023.
SELECT
	nome_evento
FROM 
	eventos
WHERE
	YEAR(data_evento) = 2023;

#7. Listar todos os locais, ordenados pelo nome da cidade de A a Z.
SHOW TABLES;
DESC locais;

SELECT
	*
FROM
	locais
ORDER BY
	cidade ASC;

#8. Mostrar os nomes e CPFs dos participantes que não têm empresa cadastrada.
SELECT 
	nome
FROM
	participantes
WHERE 
	empresa IS NULL OR empresa = ''
;

#9. Exibir os nomes dos participantes que estão inscritos em eventos realizados no local com nome 'Centro de Convenções'.
SELECT 
	p.nome,
    l.nome
FROM
	participantes p
INNER JOIN
	participante_evento pa ON pa.cpf = p.cpf
INNER JOIN
	eventos e ON e.id_evento = pa.evento
INNER JOIN 
	locais l ON l.id_local = e.local_evento
WHERE
	l.nome LIKE '%Centro de Convenções%'
;

#10. Para cada entidade organizadora, mostrar o nome da entidade e a média de eventos realizados.

SELECT
	vt.nome,
    ROUND(AVG(vt.qt_eventos)) AS média
FROM
	(SELECT 
		entidade_evento AS nome,
		COUNT(id_evento) AS qt_eventos
	FROM
		eventos
	GROUP BY
		nome) AS VT
GROUP BY
	vt.nome
;
    
#11. Contar quantos participantes têm uma empresa cadastrada.
SELECT 
	COUNT(cpf)
FROM
	participantes
WHERE
	empresa IS NOT NULL;

#12. Listar os nomes dos participantes que participaram de mais de 5 atividades.
SELECT
	nome,
    qntd
FROM
	(SELECT 
		p.nome AS nome,
        COUNT(pa.atividade) AS qntd
	FROM
		participantes p
	LEFT JOIN
		participante_atividade pa ON pa.cpf = p.cpf
	GROUP BY
		nome) AS part_qntd
WHERE
	qntd > 5
;

-- OU

SELECT
	PART.NOME
FROM
	PARTICIPANTES PART
LEFT JOIN
	PARTICIPANTE_ATIVIDADE PA
ON
	PA.CPF = PART.CPF AND PA.INSCRICAO = PART.NUM_INSCRICAO
GROUP BY
	PART.NOME
HAVING
	COUNT(PA.ATIVIDADE) > 5;

#13. Mostrar o nome dos participantes e a data da última atividade que eles participaram.
SELECT
	p.nome,
    MAX(a.data_atv) 'ult atv'
FROM 
	participantes p
INNER JOIN
	participante_atividade pa
	ON
		pa.cpf = p.cpf
INNER JOIN
	atividades a
	ON
		a.id_atividade = pa.atividade
GROUP BY
	p.nome
;

#14. Contar quantas atividades cada evento possui.
SELECT
	e.nome_evento,
    COUNT(a.id_atividade) AS 'qntd atv'
FROM
	eventos e
LEFT JOIN
	atividades a 
	ON
		a.evento_atv = e.id_evento
GROUP BY
	e.nome_evento;

#15. Para cada participante que participou de um evento, mostrar o CPF, o nome e a porcentagem de eventos em relação ao total de eventos realizados.
SELECT
	participante.cpf,
    participante.nome,
    CONCAT(ROUND((participante.participacao / atividades.total)* 100, 2), '%') AS participacao
FROM
	(SELECT
		p.cpf AS CPF,
        p.nome AS nome,
		COUNT(pa.atividade) AS participacao
	FROM
		participantes p
	LEFT JOIN
		participante_atividade pa
			ON 
				pa.cpf = p.cpf
	GROUP BY
		p.cpf, p.nome) AS participante
JOIN
	(SELECT
		COUNT(id_atividade) AS total
	FROM
		atividades) AS atividades
;
