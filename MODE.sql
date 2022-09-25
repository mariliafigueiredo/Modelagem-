-- Criação do banco de dados para o cenário de oficina
-- drop database oficina;
create DATABASE oficina;
use oficina;

-- Criar tabela Cliente
create table cliente(
	idcliente int auto_increment primary key,
	nome varchar(10),
	CPF char(11) not null,
	constraint unique_cpf_client unique(CPF)
);
            
-- Criar tabela veiculo
create table veiculo(
	idveiculo int auto_increment primary key,
	placa varchar(10) not null,
	modelo_veiculo varchar(10)
);

-- Criar tabela Ordem de serviço
create table ordem_serviço(
	idordem_serviço int auto_increment primary key,
    descrição varchar(100),
    valor float(30),
    data_emissao date not null,
    data_conclusao date not null
);

-- Criar tabela de peça
create table peça(
	idpeça int auto_increment primary key,
    nome varchar(10),
    valor float(10)
);

-- Criar tabela serviço
create table serviço(
	idserviço int auto_increment primary key,
    descrição varchar(30)
);

-- Criar tabela mecanico
create table mecanico(
	idmecanico int auto_increment primary key,
    nome varchar(10),
    especialidade varchar(20)
);


-- Criar tabela de relação cliente/veiculo
create table cliente_veiculo(
	idveiculo int,
    idcliente int,
    primary key(idcliente, idveiculo),
    constraint fk_veiculo_cliente foreign key (idcliente) references cliente(idcliente),
    constraint fk_veiculo_veiculo foreign key (idveiculo) references veiculo(idveiculo)
);

-- Criar tabela de relacionamento entre ordem de serviço/veiculo
create table ordem_serviço_veiculo(
	idordem_serviço int,
	idveiculo int,
	PRIMARY KEY(idordem_serviço, idveiculo),
	CONSTRAINT fk_ordem_serviço_veiculo FOREIGN KEY (idordem_serviço) REFERENCES ordem_serviço(idordem_serviço),
	CONSTRAINT fk_Pveiculo_veiculo FOREIGN KEY (idveiculo) REFERENCES veiculo(idveiculo)
);

-- Criar tabela de relação mecanico/serviço
-- Criar tabela de relação cliente/veiculo
create table mecanico_serviço(
	idmecanico int,
    idserviço int,
    primary key(idmecanico, idserviço),
    constraint fk_mecanico_serviço foreign key (idmecanico) references mecanico(idmecanico)
);


-- Mostra todas as constraints utilizadas
use information_schema;
select * from referential_constraints where constraint_schema = 'oficina';

show tables;

-- inserção de dados e queries 

use oficina;
show tables;
-- Inserindo dados na tabela clientes (nome, CPF)
insert into cliente (nome, cpf)
    values('Anderson', '123456789'),
          ('Beatriz', '987654321'),
          ('Carlos', '111222333'),
          ('Denise', '02012013045' ),
          ('Everton', '95115935720'),
          ('Vinícius', '26912172182');
          
alter table cliente auto_increment=1;
          
-- Inserindo dados ma tabela veiculos

insert into veiculo (idveiculo, modelo_veiculo, placa) values
		  (1, 'Fox', 'FFD54'),
          (2,'Celta', 'HJY54'),
          (3, 'Sandero', 'LKO54'),
          (4, 'Gol', 'POLO54');

select * from cliente;
select * from veiculo;

-- Inserindo dados na tabela ordem de serviço
insert into ordem_serviço (idordem_serviço, descrição, valor, data_emissao, data_conclusao) 
    values(1, 'Aberto', '500', '2022-01-03', '2022-02-03'),
          (2, 'Em andamento', '300', '2022-01-30', '2022-02-03'),
          (3, 'Concluido', '1000', '2022-01-02', '2022-02-03'),
          (4, 'Aberto', '100', '2022-01-10', '2022-02-03'),
          (5, 'Concluido', '2000', '2022-01-25', '2022-02-03'); 
          
-- Inserindo dados ma tabela peça

insert into peça (idpeça, nome, valor) values
		  (1, 'Pneu', '300'),
          (2,'Suspensão', '500'),
          (3, 'Bateria', '250'),
          (4, 'Óleo', '75');
          
-- Inserindo dados ma tabela mecanico

insert into mecanico (nome, especialidade) values
		  ('Zé', 'reparação'),
          ('Marco', 'carros de luxo'),
          ('Bruno', 'produção'),
          ('Souza', 'supervisão');
          
-- Inserindo dados ma tabela serviço

insert into serviço (descrição) values
		  ( 'Troca Pneu'),
          ( 'Troca Suspensão'),
          ('Troca Bateria'),
          (' Troca de Óleo');
          
-- Inserindo dados na tabela mecanico/serviço

INSERT INTO mecanico_serviço
VALUES(1,5);  

INSERT INTO mecanico_serviço
VALUES(1, 1);  

INSERT INTO mecanico_serviço
VALUES(2, 1); 
