CREATE TABLE tb_cargo (
	id INT PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	nivel VARCHAR(10),
	salario FLOAT
);

CREATE TABLE tb_departamento (
	id INT PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	sigla VARCHAR(10)
);

CREATE TABLE tb_funcionario (
	id INT,
	nome VARCHAR(30) NOT NULL,
	data_adm DATE,
	sexo CHAR(1),
	cod_cargo INT,
	cod_depto INT,
	PRIMARY KEY (id),
	FOREIGN KEY (cod_cargo) REFERENCES tb_cargo(id), FOREIGN KEY (cod_depto) REFERENCES tb_departamento(id)
);

CREATE TABLE table_example (
	id INT, 
	nome VARCHAR(20)
);

--adicionando coluna na tabela
ALTER TABLE tb_funcionario ADD data_nasc DATE; 

--add outra coluna na tabela como não nulo
ALTER TABLE tb_funcionario ADD email VARCHAR(20) NOT NULL;
ALTER TABLE table_example ADD id INT NOT NULL;

-- deletando coluna da tabela
ALTER TABLE tb_funcionario DROP COLUMN data_nasc;


--alterando nome da coluna (meio alternativo)
EXEC sp_RENAME 'tb_funcionario.email' , 'cont_email' , 'COLUMN' ;

--alterar tipo de dado da coluna
ALTER TABLE tb_funcionario ALTER COLUMN cont_email VARCHAR(22);

--adicionar chave primaria
ALTER TABLE table_example ADD PRIMARY KEY(id);

--depois pesquisar constraint da chave primaria PK

--remover chave estrangeira
ALTER TABLE tb_funcionario DROP CONSTRAINT FK__tb_funcio__cod_c__3B75D760;

--adicionar chave estrangeira
ALTER TABLE tb_funcionario ADD FOREIGN KEY (cod_cargo) REFERENCES tb_cargo(id);

--dml COMANDO INSERT
INSERT INTO [dbo].[tb_cargo]([id],[nome],[nivel],[salario])VALUES(1,'analista de sistemas','JR',3000.0);
INSERT INTO [dbo].[tb_cargo]([id],[nome],[nivel],[salario])VALUES(2,'desenvolvedor','SR',10000.0);
INSERT INTO [dbo].[tb_cargo]([id],[nome],[nivel],[salario])VALUES(3,'desenvolvedor','PL',5200.0);
INSERT INTO [dbo].[tb_cargo]([id],[nome],[nivel],[salario])VALUES(4,'atendente',NULL,1212.0);

INSERT INTO [dbo].[tb_departamento]([id],[nome],[sigla])VALUES(1,'Informatica','INF');
INSERT INTO [dbo].[tb_departamento]([id],[nome],[sigla])VALUES(2,'Financeiro','FIN');
INSERT INTO [dbo].[tb_departamento]([id],[nome],[sigla])VALUES(3,'Recursos Humanos','RH');

INSERT INTO [dbo].[tb_funcionario]([id],[nome],[data_adm],[sexo],[cod_cargo],[cod_depto],[cont_email])VALUES(1, 'Pedro Nogueira', '2021-03-12', 'M', 1, 1, 'pedro@gmail.com');
INSERT INTO [dbo].[tb_funcionario]([id],[nome],[data_adm],[sexo],[cod_cargo],[cod_depto],[cont_email])VALUES(2, 'Maria Silva', '2021-06-11', 'F', 2, 1, 'maria@gmail.com');

-- dml update de um registro especifico
UPDATE [dbo].[tb_funcionario] SET nome = 'Ricardo Fernandes' WHERE id = 1;

-- dml delete comando (remover uma funcionaria)
DELETE FROM [dbo].[tb_funcionario] WHERE id = 2;

--