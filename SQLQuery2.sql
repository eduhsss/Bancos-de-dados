

create table funcionarios (
codigo int not null primary key identity (1,1),
primeiroNome varchar (50) not null,
segundoNome varchar (50),
ultimoNome varchar (50) not null,
dataNascimento date,
cpf varchar (14),
rg varchar (8),
cep varchar (9),
codigoCidade int not null,
fone varchar (13),
codigoDepartamento int not null,
codigoFuncao int not null,
salario decimal (10,2),
codigoSexo int not null
)

create table departamentos (
codigo int not null primary key identity (1,1),
nome varchar (50),
localizacao varchar (50),
codigoFuncionario int not null
)

alter table funcionarios
add constraint fk_funcionarios_departamentos foreign key (codigoDepartamento) 
references departamentos (codigo)

alter table departamentos
add constraint fk_departamentos_funcionarios foreign key (codigoFuncionario) 
references funcionarios (codigo)

create table funcao (
codigo int not null primary key identity (1,1),
nome varchar (50),
codigoFuncionario int not null
)

alter table funcionarios
add constraint fk_funcionarios_funcao foreign key (codigoFuncao) 
references funcao (codigo)

alter table funcao
add constraint fk_funcao_funcionarios foreign key (codigoFuncionario) 
references funcionarios (codigo)
create 
table sexo (
codigo int not null primary key identity (1,1),
nome varchar (15)
)

alter table funcionarios
add constraint fk_funcionarios_sexo foreign key (codigoSexo) 
references sexo (codigo)



create table cidade (
codigo int not null primary key identity (1,1),
nome varchar (45) not null,
codigoEstado int not null
)

alter table funcionarios
add constraint fk_funcionarios_cidade foreign key (codigoCidade) 
references cidade (codigo)

create table estado (
codigo int not null primary key identity (1,1),
nome varchar (30) not null unique,
sigla varchar (2) not null unique,
codigoPais int not null
)

alter table cidade
add constraint fk_cidade_estado foreign key (codigoEstado) 
references estado (codigo)


create table pais (
codigo int not null primary key identity (1,1),
nome varchar (45) not null,
)

alter table estado
add constraint fk_estado_pais foreign key (codigoPais) 
references pais (codigo)