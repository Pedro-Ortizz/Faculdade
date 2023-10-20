CREATE DATABASE gastos;

USE gastos;

CREATE TABLE pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
dtNasc date,
profissao varchar(45));

create table gasto (
idGasto int primary key auto_increment,
dta date,
valor decimal (7,2),
descricao varchar (45));

alter table gasto add column fkPessoa int;

insert into pessoa values
(null, 'pedro', '2005-10-29', 'artista'),
(null, 'guilherme', '2005-06-01', 'jogador'),
(null, 'cadu', '2005-07-19', 'analista'),
(null, 'italo', '2004-04-08', 'cozinheiro');

insert into gasto values
(null, '2023-10-05', '50000.00', 'carro', 1),
(null, '2023-10-10', '800.00', 'aluguel', 2),
(null, '2023-09-05', '1500.00', 'fatura', 3),
(null, '2023-01-10', '2500.00', 'viagem', 4);

select * from pessoa;

select * from gasto;

select * from pessoa where
nome like 'p%';

select * from gasto where
descricao like 'v%';

select * from pessoa join gasto on fkPessoa = idPessoa;

select * from pessoa join gasto on fkPessoa = idPessoa
where descricao = 'carro';

update gasto set valor = '90000.00' where idGasto = 1;

update pessoa set profissao = 'jardineiro' where idPessoa = 4;

delete from pessoa  where idPessoa = 4;
