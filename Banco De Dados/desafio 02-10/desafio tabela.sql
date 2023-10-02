create database desafio1;

use desafio1;

create table pessoa(
idPessoa int primary key auto_increment,
nome varchar (45),
cpf char (11),
dtNasc date);

alter table pessoa add column fkMae int;
alter table pessoa add constraint fkMae foreign key (fkMae)
	references pessoa (idPessoa);
    
insert into pessoa values
(null, 'Angela', '63867460155', '1976-05-31', null),
(null, 'Pedro', '44002153855', '2005-10-29', 1);

select * from pessoa as Filho join pessoa as Mãe on Mãe.idPessoa = Filho.fkMae;

insert into pessoa values
(null,'Ana','43987654209', '1950-12-25', null);

UPDATE pessoa SET fkMae = 4 WHERE idPessoa = '1';