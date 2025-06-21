create database Estudante;

alter database Estudante modify name = Colegial;
--Exemplo 1 para mudar de nome o DB

create database Departamento;
alter database Departamento modify name = Companhia;
--Exemplo 2 para mudar de nome o DB

select name from master.sys.databases order by name;
--Ordenar por nome os DB


/*WE FIRST TABELA*/
use Colegial;

create table AlunoOrigin (
	id int not null,
	nome varchar(20) not null,
	idade int not null,
	endereco varchar(25),
	primary key (id)
);
/*Alteramos os nomes, pois nome de tabela é sempre SINGULAR
EXEC sp_rename 'antinoNome', 'NewNome';*/
EXEC sp_rename 'alunos', 'Aluno';
exec sp_help alunos; --Traz as colunas criadas
drop table Aluno;

create table FuncionarioOrigin (
	idFuncionario int not null,
	nomeCompleto varchar (255),
	email varchar(100) not null,
	endereco varchar(255) not null,
	cidade varchar(255) not null,
	primary key(idFuncionario)
);
exec sp_help funcionarios;
/*Alteramos os nomes, pois nome de tabela é sempre SINGULAR
EXEC sp_rename 'antinoNome', 'NewNome';*/
EXEC sp_rename 'funcionarios', 'Funcionario';

SELECT email, nomeCompleto, endereco --Campos selecionados
INTO Gerente --Criando uma nova tabela
FROM Funcionario; --de onde vem/retirou

create table InstrutorOrigin (
	idProfessor int not null,
	nomeCompletoProfessor varchar(255) not null,
	enderecoProfessor varchar(255) not null,
	materiaProfessor varchar(255) not null,
	salaResponsavelProfessor varchar(255) not null,
	emailProfessor varchar(255) not null,
	salarioProfessor varchar(255) not null, --Melhor numérico/decimal
	constraint PK_Professor primary key (idProfessor, nomeCompletoProfessor)
);
exec sp_help Professor;
exec sp_rename 'Professor','Instrutor'; --Renomear
drop table Instrutor; --Excluir tabela

create table EmpregadoOrigin (
	idEmpregado int not null,
	nomeCompletoEmpregado varchar(255) not null,
	salarioEmpregado float not null,
	cepEmpreado char(8) not null, --A nível BR
	cpfEmpregado char(11) not null, --A nível BR
	primary key(idEmpregado)
);

--Inserção de Exemplo
insert into Instrutor (idProfessor,nomeCompletoProfessor,enderecoProfessor,materiaProfessor,
emailProfessor,salaResponsavelProfessor,salarioProfessor) values (1,'Jailson Santos','Rua Benedito Moraes - 176 SP', 'Matematica','jsantos@senacsp.edu.br',39,3.600);
select * from Instrutor;

--Mais seis (6) inserções para fixação - ATIVIDADES 1
insert into Instrutor (idProfessor,nomeCompletoProfessor,enderecoProfessor,materiaProfessor,
emailProfessor,salaResponsavelProfessor,salarioProfessor) values (2,'Breno Alves','Jardim Brasília - 76 SP', 'LPLCP','brenoAlves@senacsp.edu.br',43,2.400);

insert into Instrutor (idProfessor,nomeCompletoProfessor,enderecoProfessor,materiaProfessor,
emailProfessor,salaResponsavelProfessor,salarioProfessor) values (3,'Felipe Souza','Avenida Marcha - 11 SP', 'Ciencias','flSouza@senacsp.edu.br',11,1.900);

--Unico na mão dos seis é o do Felipe Negreiros
insert into Instrutor (idProfessor,nomeCompletoProfessor,enderecoProfessor,materiaProfessor,
emailProfessor,salaResponsavelProfessor,salarioProfessor) values (4,'Felipe Negreiros', 'Santo André Vila Soinco - 33 SP', 'Historia', 'flNegreiros@senacsp.edu.br',33, 2.000);

insert into Instrutor (idProfessor,nomeCompletoProfessor,enderecoProfessor,materiaProfessor,
emailProfessor,salaResponsavelProfessor,salarioProfessor) values (5,'Laura Gomes','Avenida Oliveira - 16 SP', 'Biologia','LauraG@senacsp.edu.br',16,2.670);

insert into Instrutor (idProfessor,nomeCompletoProfessor,enderecoProfessor,materiaProfessor,
emailProfessor,salaResponsavelProfessor,salarioProfessor) values (6,'Gustavo Henrique','Rua Franscisco Mota - 55 SP', 'Fisica','GustHenrique@senacsp.edu.br',17,2.690);

insert into Instrutor (idProfessor,nomeCompletoProfessor,enderecoProfessor,materiaProfessor,
emailProfessor,salaResponsavelProfessor,salarioProfessor) values (7,'Luccas Fernandes','Rua Paulo Freire - 77 SP', 'Sociologia','LuccasFe@senacsp.edu.br',7,2.777);
select * from Instrutor;

--Mais inserções para fixação, agora outra forma/Juntos - ATIVIDADES 2
insert into Empregado (idEmpregado, nomeCompletoEmpregado,salarioEmpregado,cepEmpreado,cpfEmpregado) 
values (1, 'Caio Garcia', 1.980, 08571044, 45678945789),
(2, 'Yan Marques', 2.200, 08571499, 64578913256),
(3, 'Lucas Pereira', 2.800, 08571244, 65896523154),
(4, 'Marcelo Matos', 3.100, 08571288, 54621543215),
(5, 'José Garcia', 2.800, 08571244, 61253245621);
select * from Empregado;

select * from Aluno;

/*FOI O CADERNO DA OUR CLASS 22/05
NOT NULL - Com ele não pode ser nulo, já sem ele é opcional.

SELECT email, primeiroNome, sobrenome
INTO Gerente
FROM Funcionario;

Dá truncate pelo não especificação do varchar por exemplo 'varchar(255)'
No date não terceirize para a máquina, faça no padrão deles EN*/

/*Aula Sexta 23/05/25
CRUD*/
create table Cliente (
	idCliente int not null,
	nomeCliente varchar(255) not null, 
	telefoneCliente varchar(20) not null,
	cepCliente char(8) not null,
	cpfCliente char(13) not null
	primary key(idCliente)
);

insert into Cliente (idCliente,nomeCliente,telefoneCliente,cepCliente,cpfCliente) 
values (1, 'João da Silva', '12456852578','54219875','12345245215'),
(2, 'Maria Oliveira', '21987654321', '20040010', '23456789012'),
(3, 'Carlos Souza', '31986543210', '30130110', '34567890123'),
(4, 'Ana Pereira', '41985432109', '80010000', '45678901234'),
(5, 'Bruno Costa', '51984321098', '90010320', '56789012345'),
(6, 'Fernanda Lima', '62983210987', '74000010', '67890123456'),
(7, 'Lucas Almeida', '71982109876', '40010000', '78901234567'),
(8, 'Juliana Rocha', '81981098765', '50010000', '89012345678'),
(9, 'Rafael Martins', '11980012345', '06010020', '90123456789'),
(10, 'Camila Duarte', '21978901234', '20270002', '01234567890');
select * from Cliente;

update Cliente
set 

--Alterar o número aceitável no cpfCliente
Alter table Cliente
alter column cpfCliente
char(11);

alter table Cliente
add constraint UQ_Cliente_CPF unique (cpfCliente);

exec sp_help Cliente;

--Inserimos para deletar especificadamente
insert into Cliente (idCliente, nomeCliente,telefoneCliente, cepCliente, cpfCliente) values (11, 'Alexandre Gomes', 24513652461,25425285,41524513652);

delete from Cliente
where idCliente = 11;
select * from Cliente;

truncate table Cliente; --Apaga os dados, mantém a estrutura.

--Selecionando *especificamente
create table Produto(
idProduto int not null,
nomeProduto varchar(100) not null,
preco decimal (10,2) not null,
tamanho varchar(50) not null,
cor varchar(50) not null,
quantidade int not null
primary key (idProduto)
);

insert into Produto (idProduto, nomeProduto, preco, tamanho, cor, quantidade)
values (2, 'Calça', 200, 'Medio', 'Azul', 7),
(3, 'Relogio', 150, 'Padrao medio', 'Preto', 3),
(4, 'Oculos', 50, 'Pequeno', 'Marrom', 9),
(5, 'Blusa', 170, 'Grande - G', 'Azul Escuro', 1),
(6, 'Chinelo', 100, '44-43', 'Verde', 8),
(7, 'Livro', 350, 'Padrao', 'amarelo', 2);
select * from Produto;

insert into EstoqueProduto (idProdutoEst,)

--Segundo exemplo de inserção a partir de outra tabela, de forma específica
create table Carro (
idCarro int primary key not null, 
marcaCarro varchar(50) not null, 
quantidadeCarro int not null, 
corCarro  varchar(50) not null, 
tipoCarro varchar(50) not null, 
placaCarro varchar(50) unique not null, 
renavamCarro varchar(50) unique not null,
modeloCarro varchar(50)
);

create table EstoqueCarro(
idEstoqueCarro int primary key not null, 
modeloCarro varchar(20) not null, 
quantidadeCarro int not null, 
corCarro varchar(50) not null
);

INSERT INTO Carro (idCarro, marcaCarro, quantidadeCarro, corCarro, tipoCarro, placaCarro, renavamCarro, modeloCarro) 
VALUES (1, 'Toyota', 3, 'Prata', 'Sedan', 'ABC1D23', '12345678901', 'Corolla'),
(2, 'Honda', 2, 'Preto', 'SUV', 'DEF4G56', '23456789012', 'HR-V'),
(3, 'Chevrolet', 4, 'Branco', 'Hatch', 'GHI7J89', '34567890123', 'Onix'),
(4, 'Volkswagen', 5, 'Vermelho', 'Hatch', 'JKL0M12', '45678901234', 'Gol'),
(5, 'Ford', 1, 'Azul', 'Picape', 'MNO3P45', '56789012345', 'Ranger'),
(6, 'Hyundai', 2, 'Cinza', 'SUV', 'PQR6S78', '67890123456', 'Creta'),
(7, 'Fiat', 3, 'Branco', 'Sedan', 'STU9V01', '78901234567', 'Cronos'),
(8, 'Renault', 2, 'Preto', 'SUV', 'VWX2Y34', '89012345678', 'Duster'),
(9, 'Peugeot', 1, 'Prata', 'Hatch', 'YZA5B67', '90123456789', '208'),
(10, 'Nissan', 4, 'Verde', 'SUV', 'BCD8E90', '01234567890', 'Kicks');

--Selecionando os dados que te interresam
insert into EstoqueCarro(idEstoqueCarro, modeloCarro, quantidadeCarro, corCarro)
select idCarro, modeloCarro, quantidadeCarro, corCarro
from Carro;

select * from Carro;
select * from EstoqueCarro;

create table Aluno (
	idAluno int primary key not null,
	nomeAluno varchar(50) not null,
	porcentagemAluno int not null,
	enderecoAluno varchar(255) not null,
	dataNascimentoAluno date not null,
);
exec sp_help Aluno;

alter table Aluno
add cpfAluno char(11) unique not null; --Agora inserido

select * from Aluno;

--necessita resolver o conflito HERE
insert into Aluno(idAluno, nomeAluno, porcentagemAluno,enderecoAluno, dataNascimentoAluno,cpfAluno)
values (1,'Caio Garcia',84,'Avenida Moraes 25 - SP', 2005-31-01,'25847581452');
(2,'Andre Luiz',87,'Avenida Brasil 75 - SP','2003-12-11','63452195467'),
(3,'Ana Gomes',94,'Rua Moraes Tito 65 - SP','2004-23-07','49563696356'),
(4,'Jonas Couto',77,'Avenida Moraes 25 - SP','2000-01-01','21542152415'),
(5,'Henrique Silva',91,'Rua Gabo Moraes 63 - SP','2001-01-01','87548578457'),
(6,'Lucas Martins',85,'Rua das Acácias 102 - RJ','2004-15-07','36521478901'),
(7,'Bruna Silva',78,'Alameda Santos 500 - SP','2003-28-11','85479632154'),
(8,'Tiago Souza',90,'Travessa Limoeiro 45 - MG','2006-03-09','74512369874'),
(9,'Marina Costa',88,'Rua Bela Vista 88 - PR','2005-19-12','96325874123'),
(10,'Felipe Rocha',93,'Avenida Central 100 - RS','2004-07-05','58741236589'),
(11,'Amanda Nogueira',81,'Rua São José 33 - PE','2005-30-06','47896312547'),
(12,'Renan Oliveira',87,'Praça da Paz 10 - BA','2003-22-03','69874512365');

--Atualizar 1 dado específico da tabela
update Aluno
set enderecoAluno = 'Rua Pao de acucar - Rocinha 123'
where idAluno = 1;

--Atualizar 2 dados específicos da tabela
update Aluno
set porcentagemAluno = 100, enderecoAluno = 'Rua Planicie Esmeralda, 17 - SP'
where idAluno = 10;

--Aqui muda/atualiza em tudo, se não tiver o where
update Aluno
set porcentagemAluno = 70; 

--Delete specific
delete from Aluno
where nomeAluno = 'Renan Oliveira';

--Apagando todos que atenderem a condição
delete from Aluno
where porcentagemAluno < 71;


--Next Exercício
create table HistoricoAluno (
	idEstudante int primary key,
	nomeEstudante varchar(255) not null,
	cepEstudante varchar(8) not null,
	dataNascimentoEstudante date not null,
	frequenciaEstudante,
	notaEstudante
);

select * from HistoricoAluno;

insert into HistoricoAluno ()
values ();

select idEstudante, nomeEstudante, cepEstudante from HistoricoAluno;

create table FuncionarioDetalhe (
	idFuncionario int primary key not null,
	nomeFuncionario varchar(50) not null,
	cidadeFuncionario varchar (50) not null,
	salarioFuncionario int not null,
	descontoFuncionario int not null
);

insert into FuncionarioDetalhe (idFuncionario, nomeFuncionario,cidadeFuncionario,salarioFuncionario,descontoFuncionario)
values (1, 'Joana Prado', 'São Paulo', 4500, 300),
(2, 'Carlos Mendes', 'Belo Horizonte', 5200, 450),
(3, 'Aline Ferreira', 'Curitiba', 4800, 320),
(4, 'Roberto Lima', 'Salvador', 5100, 400);
select * from FuncionarioDetalhe;


/* 1ª INSERÇÃO USADA DURANTE A AULA
INSERT INTO HistoricoAluno (idEstudante, nomeEstudante, cepEstudante, idadeEstudante, frequenciaEstudante, notaEstudante) VALUES
(1, 'André Luiz', '01001000', 20, 85, '8.5'),
(2, 'Beatriz Rocha', '02002000', 21, 90, '9.0'),
(3, 'Carlos Souza', '03003000', 19, 78, '7.8'),
(4, 'Daniela Lima', '04004000', 22, 88, '8.8'),
(5, 'Eduardo Martins', '05005000', 23, 92, '9.2'),
(6, 'Fernanda Alves', '06006000', 20, 80, '8.0'),
(7, 'Gabriel Santos', '07007000', 18, 75, '7.5'),
(8, 'Helena Dias', '08008000', 21, 95, '9.5'),
(9, 'Igor Ferreira', '09009000', 19, 82, '8.2'),
(10, 'Juliana Costa', '10010000', 20, 89, '8.9'); */

/* 2ª INSERÇÃO USADA DURANTE A AULA
INSERT INTO Aluno (idAluno, nomeAluno, porcentagemAluno, enderecoAluno, dataNascimentoAluno, cpfAluno) 
VALUES (1, 'Ana Silva', 85, 'Rua das Flores, 123', '2002-05-12', '12345678901'),
(2, 'Bruno Lima', 92, 'Av. Central, 456', '2001-11-23', '23456789012'),
(3, 'Carla Souza', 78, 'Rua A, 77', '2003-03-30', '34567890123'),
(4, 'Daniel Rocha', 88, 'Rua B, 88', '2000-07-14', '45678901234'),
(5, 'Eduarda Costa', 91, 'Rua C, 99', '1999-09-09', '56789012345'),
(6, 'Felipe Mendes', 75, 'Rua D, 101', '2002-01-20', '67890123456'),
(7, 'Gabriela Tavares', 84, 'Rua E, 202', '2001-06-05', '78901234567'),
(8, 'Henrique Barbosa', 89, 'Av. Sul, 303', '2003-02-17', '89012345678'),
(9, 'Isabela Martins', 94, 'Rua F, 404', '2000-12-01', '90123456789'),
(10, 'João Pedro', 80, 'Rua G, 505', '2001-04-25', '01234567890');
