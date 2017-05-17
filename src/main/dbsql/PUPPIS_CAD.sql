create table cad_pais (
	id integer not null,
	descricao varchar(60) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkcad_pais primary key(id),
	constraint ukcad_pais01 unique(descricao)
);

create table cad_estado (
	id integer not null,
	descricao varchar(60) not null,
	uf char(2) not null,
	idpais integer not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkcad_estado primary key(id),
	constraint fkcad_estado01 foreign key(idpais) references cad_pais(id),
	constraint ukcad_estado01 unique(descricao),
	constraint ukcad_estado02 unique(uf)
);

create table cad_cidade (
	id integer not null,
	descricao varchar(60) not null,
	idestado integer not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkcad_cidade primary key(id),
	constraint fkcad_cidade01 foreign key(idestado) references cad_estado(id)
);

create sequence sqcad_centrocusto start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table cad_centrocusto (
	id integer not null default nextval('sqcad_centrocusto'),
	idcentrocustomaster integer not null,
	descricao varchar(60) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkcad_centrocusto primary key(id),
	constraint fkcad_centrocusto01 foreign key(idcentrocustomaster) references cad_centrocusto(id),
	constraint ukcad_centrocusto01 unique(id, idcentrocustomaster),
	constraint ukcad_centrocusto02 unique(descricao)	
);