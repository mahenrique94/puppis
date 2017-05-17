create sequence sqpes_tipo start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table pes_tipo (
	id integer not null default nextval('sqpes_tipo'),
	descricao varchar(20) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkpes_tipo primary key(id),
	constraint ukpes_tipo01 unique(descricao)
);

create sequence sqpes_sexo start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table pes_sexo (
	id integer not null default nextval('sqpes_sexo'),
	descricao varchar(10) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkpes_sexo primary key(id),
	constraint ukpes_sexo01 unique(descricao)
);

create sequence sqpes_estadocivil start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table pes_estadocivil (
	id integer not null default nextval('sqpes_estadocivil'),
	descricao varchar(15) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkpes_estadocivil primary key(id),
	constraint ukpes_estadocivil01 unique(descricao)
);

create sequence sqpes_pessoa start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table pes_pessoa (
	id bigint not null default nextval('sqpes_pessoa'),
	nomerazaosocial varchar(60) not null,
	nomefantasia varchar(60),
	apelido varchar(30),
	idsexo integer not null,
	idestadocivil integer not null,
	inativo boolean not null default false,
	observacao text,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkpes_pessoa primary key(id),
	constraint fkpes_pessoa01 foreign key(idsexo) references pes_sexo(id),
	constraint fkpes_pessoa02 foreign key(idestadocivil) references pes_estadocivil(id)
);

create sequence sqpes_contato start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table pes_contato (
	id bigint not null default nextval('sqpes_contato'),
	idpessoa bigint not null,
	nome varchar(60) not null,
	ddd integer,
	telefone varchar(9),
	celular varchar(11),
	email varchar(255),
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkpes_contato primary key(id),
	constraint fkpes_contato01 foreign key(idpessoa) references pes_pessoa(id),
	constraint ukpes_contato01 unique(idpessoa, nome)
);

create sequence sqpes_definicao start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table pes_definicao (
	id bigint not null default nextval('sqpes_definicao'),
	idpessoa bigint not null,
	idtipo integer not null,
	inativo boolean not null default false,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkpes_definicao primary key(id),
	constraint fkpes_definicao01 foreign key(idpessoa) references pes_pessoa(id),
	constraint fkpes_definicao02 foreign key(idtipo) references pes_tipo(id)
);

create sequence sqpes_documento start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table pes_documento (
	id bigint not null default nextval('sqpes_documento'),
	idpessoa bigint not null,
	cpfcnpj varchar(18) not null,
	rginscricaoestadual varchar(15) not null,
	ctps integer,
	seriectps integer,
	pis varchar(15),
	cnh varchar(20),
	tipocnh varchar(5),
	dataexpedicaocnh date,
	datavencimentocnh date,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkpes_documento primary key(id),
	constraint fkpes_documento01 foreign key(idpessoa) references pes_pessoa(id),
	constraint ukpes_documento01 unique(idpessoa)
);

create sequence sqpes_endereco start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table pes_endereco (
	id bigint not null default nextval('sqpes_endereco'),
	idpessoa bigint not null,
	logradouro varchar(60) not null,
	numero varchar(10) not null,
	cep varchar(9) not null,
	complemento varchar(30),
	bairro varchar(60) not null,
	idcidade integer not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkpes_endereco primary key(id),
	constraint fkpes_endereco01 foreign key(idpessoa) references pes_pessoa(id),
	constraint fkpes_endereco02 foreign key(idcidade) references cad_cidade(id),
	constraint ukpes_endereco01 unique(idpessoa, rua, numero, cep, bairro)
);