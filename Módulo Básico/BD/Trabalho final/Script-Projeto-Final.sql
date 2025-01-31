-----------------------------------
-- Cria��o ------------------------
-----------------------------------

-- 1. Informe o SQL para cria��o da tabela aluno (4 pontos):

   CREATE TABLE aluno (
	matricula integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
	nome text  NOT NULL, 
	email text, 
	turma integer(1)
);

-- 2. Informe o SQL para cria��o da tabela disciplina (4 pontos):

CREATE TABLE disciplina (
	id_disciplina integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
	nome text  NOT NULL, 
	carga_horaria integer not NULL
);

-- 3. Informe o SQL para cria��o da tabela pauta (4 pontos):

PRAGMA foreign_keys = ON;

CREATE TABLE pauta (
	id_pauta integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
	matricula text  NOT NULL, 
	id_disciplina integer not null,
	nota_1 decimal,
	nota_2 decimal,
	nota_3 decimal,
	FOREIGN KEY(matricula) REFERENCES aluno(matricula),
	FOREIGN KEY(id_disciplina) REFERENCES disciplina(id_disciplina)
);

-- 4. Com o comando ALTER TABLE mude o nome das colunas nota_1, nota_2 e nota_3 para avaliacao_1, avaliacao_2 e avaliacao_3 (2 pontos):

ALTER TABLE pauta RENAME nota_1 to avaliacao_1
ALTER TABLE pauta RENAME nota_2 to avaliacao_2
ALTER TABLE pauta RENAME nota_3 to avaliacao_3

-----------------------------------
-- Inser��o dos dados -------------
-----------------------------------
-- Planilha com os dados a serem inseridos: https://tinyurl.com/y3ngdd5s

-- 1. Informe o SQL para inser��o na tabela alunos (3 pontos):

INSERT INTO aluno (nome, email, turma) 
VALUES	
 ('Ana Paula Silva','aps@residencia.com.br',1),
 ('Jo�o Souza','js@residencia.com.br',1),
 ('Maria Moreira','mm@residencia.com.br',1),
 ('Daiane Costa','dc@residencia.com.br',2),
 ('Guilherme Silva','gs@residencia.com.br',1),
 ('J�lia Almeida','ja@residencia.com.br',2),
 ('Diogo Andrade','da@residencia.com.br',2),
 ('Manuela Botelho','mb@gmail.com',1),
 ('Thiago Tavares','tt@residencia.com',2),
 ('Jo�o Pedro Carvalho','jpc@residencia.com.br',1)



-- 2. Informe o SQL para inser��o na tabela disciplina (3 pontos):

INSERT INTO disciplina (nome, carga_horaria) 
VALUES 
	('Banco de dados',24),
	('L�gica de programa��o',40),
	('Programa��o backend',44)



-- 3. Informe o SQL para inser��o dos dados na tabela pauta
-- (note que devem ser inseridos os respectivos identificadores de
-- alunos e disciplinas, n�o os nomes) (3 pontos):

INSERT INTO pauta (matricula, id_disciplina, avaliacao_1, avaliacao_2, avaliacao_3)
VALUES
	((select matricula from aluno where nome like 'Ana Paula Silva'), (select id_disciplina from disciplina where nome like 'Banco de dados'), 10,9,10),
((select matricula from aluno where nome like 'Ana Paula Silva'), (select id_disciplina from disciplina where nome like 'L�gica de programa��o'), 9,8,7),
((select matricula from aluno where nome like 'Ana Paula Silva'), (select id_disciplina from disciplina where nome like 'Programa��o backend'), 7,7,9),
((select matricula from aluno where nome like 'Jo�o Souza'), (select id_disciplina from disciplina where nome like 'Banco de dados'), 9,6,7),
((select matricula from aluno where nome like 'Jo�o Souza'), (select id_disciplina from disciplina where nome like 'L�gica de programa��o'), 10,10,10),
((select matricula from aluno where nome like 'Jo�o Souza'), (select id_disciplina from disciplina where nome like 'Programa��o backend'), 9,8,9),
((select matricula from aluno where nome like 'Maria Moreira'), (select id_disciplina from disciplina where nome like 'Banco de dados'), 10,7,7),
((select matricula from aluno where nome like 'Daiane Costa'), (select id_disciplina from disciplina where nome like 'L�gica de programa��o'), 8,6,9),
((select matricula from aluno where nome like 'Daiane Costa'), (select id_disciplina from disciplina where nome like 'Programa��o backend'), 6,6,8),
((select matricula from aluno where nome like 'Guilherme Silva'), (select id_disciplina from disciplina where nome like 'Programa��o backend'), 8,6,9),
((select matricula from aluno where nome like 'Diogo Andrade'), (select id_disciplina from disciplina where nome like 'Banco de dados'), 8,8,10),
((select matricula from aluno where nome like 'Manuela Botelho'), (select id_disciplina from disciplina where nome like 'L�gica de programa��o'), 5,7,7),
((select matricula from aluno where nome like 'Thiago Tavares'), (select id_disciplina from disciplina where nome like 'Programa��o backend'), 5,5,4),
((select matricula from aluno where nome like 'Thiago Tavares'), (select id_disciplina from disciplina where nome like 'L�gica de programa��o'), 7,7,6),
((select matricula from aluno where nome like 'Jo�o Pedro Carvalho'), (select id_disciplina from disciplina where nome like 'Banco de dados'), 5,5,2)


-----------------------------------
-- Atualiza��o dos dados ----------
-----------------------------------

-- 1. Atualizar o e-mail da aluna Manuela Botelho para mb@residencia.com.br (3 pontos):

UPDATE aluno
SET email = 'mb@residencia.com.br'
WHERE nome = 'Manuela Botelho'

-- 2. Atualizar a nota 3 do aluno Jo�o Pedro Carvalho em Banco de dados para 7 (3 pontos):

UPDATE pauta
SET avaliacao_3 = 7
WHERE matricula = (SELECT matricula from aluno WHERE nome = 'Jo�o Pedro Carvalho')

-----------------------------------
-- Consultas ----------------------
-----------------------------------

-- 1. Selecionar o nome e a turma dos alunos (1 ponto):

  SELECT nome, turma FROM aluno

-- 2. Selecionar a quantidade total de alunos cadastrados (2 pontos):

  select count(*) from aluno

-- 3. Selecionar a quantidade total de alunos em cada disciplina (4 pontos):

select d.nome, count(p.matricula) 
from disciplina d, pauta p
where p.id_disciplina = d.id_disciplina 
group by d.nome

-- 4. Selecionar o nome do aluno, disciplina e as tr�s notas de cada aluno (usando INNER JOIN ou WHERE) (4 pontos):

SELECT a.nome, d.nome, p.avaliacao_1, p.avaliacao_2, p.avaliacao_3
from aluno a
inner JOIN pauta p ON p.matricula = a.matricula
inner JOIN disciplina d ON d.id_disciplina = p.id_disciplina


-- 5. Selecionar o nome dos alunos e a quantidade de disciplinas que cada um cursa (4 pontos):

select a.nome, count(p.matricula)
from aluno a
INNER JOIN pauta p on a.matricula = p.matricula
GROUP by a.nome

-- 6. Selecionar o nome, disciplina e a m�dia das tr�s notas de cada aluno (4 pontos):

select a.nome, d.nome, (avaliacao_1+avaliacao_2+avaliacao_3)/3
FROM aluno a
INNER JOIN pauta p ON a.matricula = p.matricula
INNER JOIN disciplina d ON p.id_disciplina = d.id_disciplina
GROUP by a.nome

-- 7. Selecionar o nome, disciplina e a m�dia das tr�s notas dos alunos que tenham m�dia menor que 6 (4 pontos):

select a.nome, d.nome, (avaliacao_1+avaliacao_2+avaliacao_3)/3
FROM aluno a
INNER JOIN pauta p ON a.matricula = p.matricula
INNER JOIN disciplina d ON p.id_disciplina = d.id_disciplina
WHERE (avaliacao_1+avaliacao_2+avaliacao_3)/3 < 6
GROUP by a.nome

-- 8. Selecionar o nome da disciplina e as m�dias das 3 notas (separadamente) de todos os alunos para cada disciplina (4 pontos):

select d.nome, avg(p.avaliacao_1), avg(p.avaliacao_2), avg(p.avaliacao_3)
FROM disciplina d, pauta p
where d.id_disciplina = p.id_disciplina
GROUP by d.nome

-- 9. Selecione o aluno com maior nota na avalia��o 1 de banco de dados, mostrando qual foi a nota (4 pontos):

select a.nome, MAX(p.avaliacao_1)
from aluno a
INNER JOIN pauta p on a.matricula = p.matricula



