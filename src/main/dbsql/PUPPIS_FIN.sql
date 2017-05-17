create sequence sqfin_banco start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table fin_banco (
	id integer not null default nextval('sqfin_banco'),
	codigo varchar(10) not null,
	descricao varchar(30) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkfin_banco primary key(id),
	constraint ukfin_banco01 unique(descricao),
	constraint ukfin_banco02 unique(codigo)
);

create sequence sqfin_formapagamento start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table fin_formapagamento (
	id integer not null default nextval('sqfin_formapagamento'),
	descricao varchar(30) not null,
	quantidadeparcela integer not null,
	intervalo integer not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkfin_formapagamento primary key(id),
	constraint ukfin_formapagamento01 unique(descricao)
);

create sequence sqfin_tipocontabancaria start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table fin_tipocontabancaria (
	id integer not null default nextval('sqfin_tipocontabancaria'),
	descricao varchar(10) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkfin_tipocontabancaria primary key(id),
	constraint ukfin_tipocontabancaria01 unique(descricao)
);

create sequence sqfin_contabancaria start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table fin_contabancaria (
	id integer not null default nextval('sqfin_contabancaria'),
	idbanco integer not null,
	idtipocontabancaria integer not null,
	agencia varchar(10) not null,
	numeroconta varchar(10) not  null,
	nometitular varchar(60) not null,
	inativo boolean not null default false,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkfin_contabancaria primary key(id),
	constraint fkfin_contabancaria01 foreign key(idbanco) references fin_banco(id),
	constraint fkfin_contabancaria02 foreign key(idtipocontabancaria) references fin_tipocontabancaria(id)
);

create sequence sqfin_tipodocumento start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table fin_tipodocumento (
	id integer not null default nextval('sqfin_tipodocumento'),
	descricao varchar(30) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkfin_tipodocumento primary key(id),
	constraint ukfin_tipodocumento01 unique(descricao)
);

create sequence sqfin_historico start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table fin_historico (
	id integer not null default nextval('sqfin_historico'),
	descricao text not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkfin_historico primary key(id),
	constraint ukfin_historico01 unique(descricao)
);

create sequence sqfin_documento start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table fin_documento (
	id bigint not null default nextval('sqfin_documento'),
	idcontabancaria integer not null,
	iddefinicao bigint not null,
	iddocumento bigint,
	idtipooperacao integer not null,
	numero bigint not null,
	serie integer,
	codigobarra varchar(120),
	idtipodocumento  integer not null,
	dataemissao date not null,
	datapagamento date,
	datavencimento date not null,
	idhistorico integer,
	idformapagamento integer not null,
	desdobramento varchar(7) not null,	
	valortotal numeric(10, 2) not null,
	valordesconto numeric(10, 2) not null,
	valorjuros numeric(10, 2) not null,
	saldo numeric(10, 2) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkfin_documento primary key(id),
	constraint fkfin_documento01 foreign key(idcontabancaria) references fin_contabancaria(id),
	constraint fkfin_documento02 foreign key(iddefinicao) references pes_definicao(id),
	constraint fkfin_documento03 foreign key(iddocumento) references fin_documento(id),
	constraint fkfin_documento04 foreign key(idtipodocumento) references fin_tipodocumento(id),
	constraint fkfin_documento05 foreign key(idhistorico) references fin_historico(id),
	constraint fkfin_documento06 foreign key(idtipooperacao) references sys_tipooperacao(id),
	constraint fkfin_documento07 foreign key(idformapagamento) references fin_formapagamento(id),
	constraint ckfin_documento01 check((extract(year from dataemissao)) > 2000),
	constraint ckfin_documento02 check(valortotal >= 0),
	constraint ckfin_documento03 check(valordesconto >= 0),
	constraint ckfin_documento04 check(valorjuros >= 0),
	constraint ckfin_documento05 check(saldo >= 0),
	constraint ckfin_documento06 check((extract(year from datavencimento)) > 2000)
);

create sequence sqfin_documentocentrocusto start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table fin_documentocentrocusto (
	id integer not null default nextval('sqfin_documentocentrocusto'),
	iddocumento bigint not null,
	idcentrocusto integer not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkfin_documentocentrocusto primary key(id),
	constraint fkfin_documentocentrocusto01 foreign key(iddocumento) references fin_documento(id),
	constraint fkfin_documentocentrocusto02 foreign key(idcentrocusto) references cad_centrocusto(id),
	constraint ukfin_documentocentrocusto01 unique(iddocumento)
);

create sequence sqfin_extrato start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table fin_extrato (
	id bigint not null default nextval('sqfin_extrato'),
	numerodocumento bigint,
	iddefinicao integer,
	idcontabancaria integer not null,
	idtipooperacao integer not null,
	valor numeric(10, 2) not null,
	creditodebito char(1) not null,
	historico text,	
	datacreate date not null,
	constraint pkfin_extrato primary key(id),
	constraint fkfin_extrato01 foreign key(iddefinicao) references pes_definicao(id),
	constraint fkfin_extrato02 foreign key(idtipooperacao) references sys_tipooperacao(id),
	constraint fkfin_extrato03 foreign key(idcontabancaria) references fin_contabancaria(id),
	constraint ckfin_extrato01 check(valor > 0)
);