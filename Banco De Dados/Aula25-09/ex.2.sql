/*No MySQL Workbench, utilizando o banco de dados ‘sprint2’:
Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), 
sigla (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.
Inserir dados na tabela, procure inserir pelo menos 3 cursos.
Crie uma regra de negócio com uma nova tabela a sua escolha. Relacione a tabela 
que você criou com a tabela curso e insira ou atualize os dados;
Execute os comandos para:
a) Crie a Modelagem Lógica;
b) Faça um JOIN entre as duas tabelas;
c) Faça um JOIN com WHERE entre as duas tabelas;
d) Crie um campo com a restrição (constraint) de CHECK*/

USE sprint2;

CREATE TABLE curso(
idCurso INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50),
sigla VARCHAR (3),
coordenador VARCHAR (40));

insert into curso(nome, sigla, coordenador) values
('Banco de dados', 'BD', 'Vivian'),
('Pesquisa e Inovação', 'PI', 'Fernanda'),
('Arq Comp', 'AC', 'Marise');

create table aluno (
idAluno int primary key auto_increment,
nome varchar(40),
semestre varchar(45));

insert into aluno(nome, semestre) values
('Guilherme', 'Primeiro'),
('Pedro', 'Segundo'),
('Marcos', 'Terceiro');


alter table aluno add column fkcurso int;
alter table aluno add constraint fkcur
	foreign key (fkcurso) references curso(idCurso);
    
update aluno set fkcurso = '1' 
    where idAluno = 1;

update aluno set fkcurso = '2' 
	where idAluno = 2;

update aluno set fkcurso = '3' 
	where idAluno = 3;
    
select curso.*, aluno.* from curso join aluno on fkcurso = idcurso;

select aluno.*, curso.nome from curso join aluno on fkcurso = idcurso
	where coordenador = 'Vivian';
    
alter table curso add column funcao varchar(35),
	add constraint chkFuncao
		check (funcao in('Empregado', 'Desligado'));
        
update curso set funcao = 'Empregado' 
	where idCurso = 1;
update curso set funcao = 'Desligado' 
	where idCurso = 2;
update curso set funcao = 'Desligado' 
	where  idCurso = 3;
    
select*from curso;


