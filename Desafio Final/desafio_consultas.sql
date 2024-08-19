create table tb_curso (
    id int not null,
    carga_horaria int,
    nome varchar(255),
    nota_minima numeric,
    nota_prevista numeric,
    valor numeric,
    primary key (id)
);

create table tb_turma (
    id int not null,
    inicio date,
    numero int,
    vagas int,
    curso_id int,
    primary key (id),
    foreign key (curso_id) references tb_curso
);

create table tb_aluno (
    cpf varchar(255) not null,
    nascimento date,
    nome varchar(255),
    primary key (cpf)
);

create table tb_matricula (
    data date,
    prestacoes int,
    aluno_id varchar(255) not null,
    turma_id int not null,
    primary key (aluno_id, turma_id),
    foreign key (aluno_id) references tb_aluno,
    foreign key (turma_id) references tb_turma
);

create table tb_avaliacao (
    id int not null,
    data date,
    nota numeric,
    turma_id int,
    primary key (id),
    foreign key (turma_id) references tb_turma
);

create table tb_resultado (
    nota_obtida numeric(10,2),
    aluno_id varchar(255) not null,
    avaliacao_id int not null,
    primary key (aluno_id, avaliacao_id),
    foreign key (aluno_id) references tb_aluno,
    foreign key (avaliacao_id) references tb_avaliacao
);
 

-- CURSO HTML
INSERT INTO tb_curso (id, nome, carga_horaria, valor, nota_prevista, nota_minima) VALUES (1, 'HTML Básico', 10, 80.0, 100.0, 70.0);

-- DUAS TURMAS PARA O CURSO HTML
INSERT INTO tb_turma (id, numero, inicio, vagas, curso_id) VALUES (1, 1, '2017-09-10', 30, 1);
INSERT INTO tb_turma (id, numero, inicio, vagas, curso_id) VALUES (2, 10, '2022-05-20', 30, 1);

-- QUATRO ALUNOS
INSERT INTO tb_aluno (cpf, nome, nascimento) VALUES ('736376983-19', 'Carlos Silva', '1990-07-21');
INSERT INTO tb_aluno (cpf, nome, nascimento) VALUES ('353847901-22', 'Maria Clara', '1991-09-03');
INSERT INTO tb_aluno (cpf, nome, nascimento) VALUES ('444123123-44', 'Ana Portes', '1995-05-21');
INSERT INTO tb_aluno (cpf, nome, nascimento) VALUES ('555098098-55', 'Pedro Tiago', '2001-10-15');

-- DUAS MATRICULAS NA TURMA 1, E TRES MATRICULAS NA TURMA 2
INSERT INTO tb_matricula (turma_id, aluno_id, data, prestacoes) VALUES (1, '736376983-19', '2017-09-05', 6);
INSERT INTO tb_matricula (turma_id, aluno_id, data, prestacoes) VALUES (1, '353847901-22', '2017-09-06', 12);

INSERT INTO tb_matricula (turma_id, aluno_id, data, prestacoes) VALUES (2, '736376983-19', '2022-05-13', 1);
INSERT INTO tb_matricula (turma_id, aluno_id, data, prestacoes) VALUES (2, '444123123-44', '2022-05-13', 6);
INSERT INTO tb_matricula (turma_id, aluno_id, data, prestacoes) VALUES (2, '555098098-55', '2022-05-15', 10);

-- DUAS AVALIACOES NA TURMA 1, E DUAS AVALIACOES NA TURMA 2
INSERT INTO tb_avaliacao (id, nota, data, turma_id) VALUES (1, 40.0, '2017-10-20', 1);
INSERT INTO tb_avaliacao (id, nota, data, turma_id) VALUES (2, 60.0, '2017-11-30', 1);

INSERT INTO tb_avaliacao (id, nota, data, turma_id) VALUES (3, 50.0, '2022-06-20', 2);
INSERT INTO tb_avaliacao (id, nota, data, turma_id) VALUES (4, 50.0, '2022-07-20', 2);

-- RESULTADOS PARA CADA ALUNO EM CADA AVALIACAO DA TURMA 1 
INSERT INTO tb_resultado (aluno_id, avaliacao_id, nota_obtida) VALUES ('736376983-19', 1, 35.0);
INSERT INTO tb_resultado (aluno_id, avaliacao_id, nota_obtida) VALUES ('353847901-22', 1, 36.5);
INSERT INTO tb_resultado (aluno_id, avaliacao_id, nota_obtida) VALUES ('736376983-19', 2, 47.0);
INSERT INTO tb_resultado (aluno_id, avaliacao_id, nota_obtida) VALUES ('353847901-22', 2, 52.4);

-- RESULTADOS PARA CADA ALUNO EM CADA AVALIACAO DA TURMA 2
INSERT INTO tb_resultado (aluno_id, avaliacao_id, nota_obtida) VALUES ('736376983-19', 3, 30.0);
INSERT INTO tb_resultado (aluno_id, avaliacao_id, nota_obtida) VALUES ('444123123-44', 3, 50.0);
INSERT INTO tb_resultado (aluno_id, avaliacao_id, nota_obtida) VALUES ('555098098-55', 3, 40.0);
INSERT INTO tb_resultado (aluno_id, avaliacao_id, nota_obtida) VALUES ('736376983-19', 4, 35.0);
INSERT INTO tb_resultado (aluno_id, avaliacao_id, nota_obtida) VALUES ('444123123-44', 4, 45.0);
INSERT INTO tb_resultado (aluno_id, avaliacao_id, nota_obtida) VALUES ('555098098-55', 4, 35.5);

----------------------------------------------------------------
--OBS: SCRIPTS DESENVOLVIDOS UTILIZANDO O PADRÃO SLQ SERVER 2022 
----------------------------------------------------------------

--Questão 1:
SELECT tb_curso.nome AS curso, tb_turma.numero AS turma, tb_turma.inicio 
From tb_curso
INNER JOIN tb_turma ON tb_turma.curso_id = tb_curso.id
------------------------------------------------------------------------

--Questão 2:
SELECT tb_curso.nome AS curso, tb_turma.numero AS turma, tb_aluno.nome AS aluno, tb_aluno.cpf
FROM tb_curso
INNER JOIN tb_turma ON tb_turma.curso_id = tb_curso.id
INNER JOIN tb_matricula ON tb_turma.id = tb_matricula.turma_id
INNER JOIN tb_aluno ON tb_matricula.aluno_id = tb_aluno.cpf
ORDER BY turma_id ASC
-------------------------------------------------------------------------

 --Questão 3:
 SELECT tb_avaliacao.data, 
 CAST(tb_avaliacao.nota AS DECIMAL (10,1)) AS nota, tb_aluno.nome, 
 CAST(tb_resultado.nota_obtida AS DECIMAL (10,1)) AS nota_obtida, 
 CAST((nota_obtida * 100.0 / nota) AS DECIMAL (10,2)) AS porcentagem
 FROM tb_avaliacao
 INNER JOIN tb_resultado ON tb_avaliacao.id = tb_resultado.avaliacao_id
 INNER JOIN tb_aluno ON tb_resultado.aluno_id = tb_aluno.cpf
 ORDER BY tb_avaliacao.data DESC, tb_aluno.nome ASC
 ------------------------------------------------------------------------

 --Questão 4:
SELECT tb_aluno.nome AS nome, SUM(CAST((tb_resultado.nota_obtida) AS DECIMAL (10,1))) AS total
FROM tb_aluno
INNER JOIN tb_resultado ON tb_aluno.cpf = tb_resultado.aluno_id
INNER JOIN tb_avaliacao ON tb_resultado.avaliacao_id = tb_avaliacao.id
INNER JOIN tb_turma ON tb_avaliacao.turma_id = tb_turma.id
WHERE tb_turma.numero = 10 
GROUP BY tb_aluno.nome;