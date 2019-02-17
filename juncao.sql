--Tabela cidade
CREATE TABLE 'public'.'cidade' ( 
'codigo_cidade' SERIAL, 
'nome_cidade' VARCHAR(50), 
'codigo_subregiao' INTEGER,
CONSTRAINT 'cidade_pkey' PRIMARY KEY('codigo_cidade') 
) WITH OIDS;


--Tabela subregiao
CREATE TABLE 'public'.'subregiao' ( 
'codigo_subregiao' SERIAL,
'nome_subregiao' VARCHAR(50),
'codigo_pais' INTEGER, 
CONSTRAINT 'subregiao_pkey' PRIMARY KEY('codigo_subregiao')
) WITH OIDS;

--Tabela país
CREATE TABLE 'public'.'pais' ( 
'codigo_pais' SERIAL,
 'nome_pais' VARCHAR(50), 
 CONSTRAINT 'pais_pkey' PRIMARY KEY('codigo_pais') 
 ) WITH OIDS;



INSERT INTO pais (nome_pais) VALUES 
('Brasil'); 
INSERT INTO pais (nome_pais) VALUES 
('Argentina'); 
INSERT INTO pais (nome_pais) VALUES 
('Estados Unidos'); 
INSERT INTO pais (nome_pais) VALUES 
('Italia'); 
INSERT INTO pais (nome_pais) VALUES 
('Franca'); 
INSERT INTO pais (nome_pais) VALUES 
('Noruega');
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'Parana', 1); 
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'Sao Paulo', 1); 
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'Rio Grande do Sul', 1); 
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'Buenos Aires', 2); 
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'Cordoba', 2); 
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'California', 3); 
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'Florida', 3); 
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'Toscana', 4); 
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'Lombardia', 4); 
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'Aquitania', 5); 
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'Borgonha', 5); 
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES
('Calabria', 5); 
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'Massachussetts', 3);
INSERT INTO subregiao ( nome_subregiao, codigo_pais) VALUES 
( 'Chiapas', NULL);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('Curitiba', 1);
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('Sao Paulo', 2); 
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('Guarulhos', 2); 
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('Buenos Aires', 4); 
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('La Plata', 4); 
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('Cordoba', 5); 
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('Los Angeles', 6); 
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('San Francisco', 6); 
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('Orlando', 7); 
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('Miami', 7); 
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('Siena', 8); 
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('Florenca', 8); 
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('Milao', 9); 
INSERT INTO cidade (nome_cidade, codigo_subregiao) VALUES 
('Yokohama', NULL);







SELECT * FROM pais  CROSS JOIN subregiao;
.