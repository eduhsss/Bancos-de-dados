
--ALUNO: Gabriel Nunes
--SÉRIE: 2º Etim
--DATA: 08/ 05 / 2017

-----------------CRIANDO MINHA TABELA-----------------------
--create database atividade

-- Cria  tabela Cliente
create table cliente(
	codcliente serial primary key,
	nomecliente varchar(80) not null,
	codsexo integer not null,
	codendereco integer not null,
	salario double precision not null default 0
);

--------------------------------------------

--Criar a tabela Endereco
create table endereco(
	codendereco serial primary key,
	codrua integer not null,
	codbairro integer not null,
	codcep integer not null,
	codcidade integer not null,
	numero varchar(6) not null
);
	
--------------------------------------------

create table rua(
	codrua serial primary key,
	nomerua varchar(100) not null unique
);

insert into rua(nomerua)values('PASSEIO GOIANIA');
insert into rua(nomerua)values('PASSEIO TERESINA');
insert into rua(nomerua)values('RUA XV DE OUTUBRO');
insert into rua(nomerua)values('PASSEIO OLINDA');

select * from rua;
---------------------------------------------
create table bairro(
	codbairro serial primary key,
	nomebairro varchar(100) not null unique
);

insert into bairro(nomebairro) values('CENTRO');
insert into bairro(nomebairro) values('SUL');
insert into bairro(nomebairro) values('JARDIM AEROPORTO');
insert into bairro(nomebairro) values('ILHA BELA');
insert into bairro(nomebairro) values('NOVA ILHA');

select * from bairro;


----------------------------------------
create table cep(
	codcep serial primary key,
	numerocep char(9) not null unique
);
insert into cep(numerocep)values('15385-000');

select * from cep;

-----------------------------------------
create table cidade(
	codcidade serial primary key,
	nomecidade varchar(100) not null unique,
	codestado integer not null
);

insert into cidade(nomecidade,codestado) values('ILHA SOLTEIRA',1);
	
----------------------------------------
create table estado(
	codestado serial primary key,
	nomeestado varchar(100) not null unique,
	sigla varchar(2) not null unique
);

insert into estado(nomeestado,sigla) values('MINAS GERAIS','MG');
select * from estado

--Cadastrando endereco {codendereco, codrua, codbairro, codcep, 
--codcidade, numero} 
insert into endereco(codrua,codbairro,codcep,codcidade,numero)values(
4, 2, 1, 2, 412);

select * from cliente;

insert into sexo(nomesexo)values('FEMININO');

insert into cliente(nomecliente,codsexo,codendereco,salario) values(
'PALOMA VELOZA', 1, 3, 250.45);

---------------------------------------

create table sexo(
	codsexo serial primary key,
	nomesexo varchar(9) not null unique
);

---------------------------------------


create table telefone(
	codtelefone serial primary key,
	numerotelefone varchar(14) not null,
	codoperadora integer not null
);
---------------------------------------


create table operadora(
	codoperadora serial primary key,
	nomeoperadora varchar(100) not null unique
);

---------------------------------------


create table itenstelcliente(
	codcliente integer not null,         
	codtelefone integer not null,
	codtipotel integer not null 
);

	alter table itenstelcliente add constraint pk_itenstelcliente primary key 
	(codcliente, codtelefone); 

--------------------------------------


create table tipotel(
	codtipotel serial primary key,
	nometipotel varchar(100) not null unique
);


--------------------------------------



create table produto(
	codproduto serial primary key,
	nomeproduto varchar(100) not null unique,
	quantidade double precision not null default 0,
	valor double precision not null default 0,
	codmarca integer not null,
	codtipoproduto integer not null
);	
------------------------------------


create table marca(
	codmarca serial primary key,
	nomemarca varchar(100) not null unique
);

--------------------------------------------

create table tipoproduto(
	codtipoproduto serial primary key,
	nometipoproduto varchar(100) not null unique
);


-------------------------------------------
create table venda(
	codvenda serial primary key,
	datavenda char(10) not null,
	codcliente integer not null
);
	
------------------------------------------



create table itensvenda(
	codvenda integer not null,
	codproduto integer not null,
	quantidade double precision not null default 0,
	valor double precision not null default 0
);

	alter table itensvenda add constraint pk_itensvenda primary key 
	(codvenda, codproduto);

-----------------------------------------

create table fornecedor(
	codfornecedor serial primary key,
	nomefornecedor varchar(100) not null,
	codendereco integer not null
);
-----------------------------------------



create table compra(
	codcompra serial primary key,
	datacompra char(10) not null,
	codfornecedor integer not null
);
	
----------------------------------------



create table itenscompra(
	codcompra integer not null,
	codproduto integer not null,
	quantidade double precision not null default 0,
	valor double precision not null default 0
);

	alter table itenscompra add constraint pk_itenscompra primary key
	(codcompra, codproduto);
----------------------------------------

create table funcionario(
	codfuncionario serial primary key,
	nomefuncionario varchar(100) not null,
	codsexo integer not null,
	codendereco integer not null,
	codcargo integer not null,
	salario double precision not null default 0
);
----------------------------------------

create table cargo(
	codcargo serial primary key,
	nomecargo varchar(100) not null unique
);


---------------------------------------------

create table usuario(
	codlogin serial primary key,
	username varchar(100) not null unique,
	senha varchar(80) not null,
	codfuncionario integer not null
);
---------------------------------------------



create table dadoslogin(
	coddadoslogin serial primary key,
	datalogin char(10) not null,
	dataacessoentrada char(10) not null,
	dataacessoSaida char(10) not null,
	horaentrada varchar(20) not null,
	horasaida varchar(20) not null,
	codlogin integer not null

);


	alter table dadoslogin add constraint fk_codlogin foreign key(codlogin)
	references usuario (codlogin)match simple on update cascade on delete cascade; 

	alter table cliente add constraint fk_codsexo foreign key (codsexo) references
	sexo(codsexo) match simple on update cascade on delete cascade;

	alter table cliente add constraint fk_codendereco foreign key(codendereco)
	references endereco (codendereco)match simple on update cascade on delete cascade; 


	alter table endereco add constraint fk_codrua foreign key(codrua)
	references rua (codrua)match simple on update cascade on delete cascade; 

	alter table endereco add constraint fk_codbairro foreign key(codbairro)
	references bairro (codbairro)match simple on update cascade on delete cascade; 

	alter table endereco add constraint fk_codcep foreign key(codcep)
	references cep (codcep)match simple on update cascade on delete cascade; 

	alter table endereco add constraint fk_codcidade foreign key(codcidade)
	references cidade (codcidade)match simple on update cascade on delete cascade; 

alter table cidade add constraint fk_codestado foreign key(codestado)
	references estado (codestado)match simple on update cascade on delete cascade; 


	alter table telefone add constraint fk_codoperadora foreign key(codoperadora)
	references operadora (codoperadora)match simple on update cascade on delete cascade; 

	alter table itenstelcliente add constraint fk_codtelefone foreign key(codtelefone)
	references telefone (codtelefone)match simple on update cascade on delete cascade; 

	alter table itenstelcliente add constraint fk_codcliente foreign key(codcliente)
	references cliente (codcliente)match simple on update cascade on delete cascade; 

        alter table produto add constraint fk_codmarca foreign key(codmarca)
	references marca (codmarca)match simple on update cascade on delete cascade; 

	alter table produto add constraint fk_codcliente foreign key(codtipoproduto)
	references tipoproduto (codtipoproduto)match simple on update cascade on delete cascade;  

alter table venda add constraint fk_codcliente foreign key(codcliente)
	references cliente (codcliente)match simple on update cascade on delete cascade; 

	alter table itensvenda add constraint fk_codvenda foreign key (codvenda)
	references venda(codvenda) match simple on update cascade on delete cascade;

	alter table itensvenda add constraint fk_codproduto foreign key (codproduto)
	references produto(codproduto) match simple on update cascade on delete cascade;

	alter table fornecedor add constraint fk_codcliente foreign key(codendereco)
	references endereco (codendereco)match simple on update cascade on delete cascade; 


	alter table compra add constraint fk_codfornecedor foreign key(codfornecedor)
	references fornecedor (codfornecedor)match simple on update cascade on delete cascade; 

	alter table itenscompra add constraint fk_codcompra foreign key(codcompra)
	references compra (codcompra)match simple on update cascade on delete cascade; 
	
	alter table itenscompra add constraint fk_codproduto foreign key(codproduto)
	references produto (codproduto)match simple on update cascade on delete cascade; 

	alter table funcionario add constraint fk_codendereco foreign key(codendereco)
	references endereco (codendereco)match simple on update cascade on delete cascade; 

	alter table funcionario add constraint fk_codcargo foreign key(codcargo)
	references cargo (codcargo)match simple on update cascade on delete cascade; 
	
	alter table funcionario add constraint fk_codsexo foreign key(codsexo)
	references sexo (codsexo)match simple on update cascade on delete cascade; 	

	alter table usuario add constraint fk_codfuncionario foreign key(codfuncionario)
	references funcionario (codfuncionario)match simple on update cascade on delete cascade; 

	