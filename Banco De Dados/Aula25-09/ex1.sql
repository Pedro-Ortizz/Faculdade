/* No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Fazer a modelagem lógica conforme a regra de negócio: 
• 1 professor leciona 1 ou muitas disciplinas;
• 1 disciplina é lecionada por apenas 1 professor;
Criar a tabela chamada Professor para conter os dados: idProfessor, nome 
(tamanho 50), sobrenome (tamanho 30), especialidade1 (tamanho 40), 
especialidade2 (tamanho 40), sendo que idProfessor é a chave primária da tabela.
Inserir pelo menos uns 6 professores.
Criar a tabela chamada Disciplina para conter os dados: idDisc, nomeDisc
(tamanho 45), sendo que idDisc é a chave primária da tabela.
Inserir pelo menos 3 disciplinas.
Escreva e execute os comandos para:
• Configurar a chave estrangeira na tabela conforme sua modelagem (Pode fazer 
no comando CREATE TABLE);
• Exibir os professores e suas respectivas disciplinas;
• Exibir apenas o nome da disciplina e o nome do respectivo professor;
• Exibir os dados dos professores, suas respectivas disciplinas de um 
determinado sobrenome;
• Exibir apenas a especialidade1 e o nome da disciplina, de um determinado 
professor, ordenado de forma crescente pela especialidade1;*/


USE sprint1;

CREATE TABLE Professor (
idProfessor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
sobrenome VARCHAR (30),
especialidade1 VARCHAR (40),
especialidade2 VARCHAR (40));

INSERT INTO Professor VALUES
(NULL, 'Pedro', 'Ortiz', 'Algoritmo', 'Banco De Dados'),
(NULL, 'Guilherme', 'Santiago', 'Java', 'CSS'),
(NULL,'Beatriz', 'Brandao', 'JavaScript', 'Segurança Da Informação'),
(NULL, 'Carlos', 'Eduardo', 'Adm', 'Cinema'),
(NULL, 'Ian', 'Silva', 'Modelagem Lógica', 'WebDesigner'),
(NULL, 'Leonardo', 'Arakaki', 'Aviação', 'Veterinário');

CREATE TABLE Disciplina (
idDisc INT PRIMARY KEY AUTO_INCREMENT,
nomeDisc VARCHAR(45));

ALTER TABLE Disciplina ADD COLUMN fkProfessor INT;
ALTER TABLE Disciplina ADD CONSTRAINT fkProf FOREIGN KEY (fkProfessor)
REFERENCES Professor (idProfessor);

INSERT INTO Disciplina(nomeDisc,fkProfessor) VALUES
('Medicina', 2),
('Engenharia De Software', 6),
('Ciencia De Dados', 3);


SELECT * FROM Professor JOIN Disciplina ON fkProfessor = idProfessor;

SELECT Disciplina.nomeDisc, Professor.nome FROM Professor JOIN Disciplina ON fkProfessor = idProfessor;

SELECT Professor.*, Disciplina.nomeDisc FROM Professor JOIN Disciplina ON fkProfessor = idProfessor
	WHERE Professor.sobrenome = 'Brandão';
    
SELECT Professor.especialidade1, Disciplina.nomeDisc FROM Professor JOIN Disciplina ON fkProfessor = idProfessor
	WHERE Professor.nome = 'Guilherme' ORDER BY Professor.especialidade1;