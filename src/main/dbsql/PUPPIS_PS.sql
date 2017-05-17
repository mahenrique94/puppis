create sequence sqps_unidademedida start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table ps_unidademedida (
	id integer not null default nextval('sqps_unidademedida'),
	descricao varchar(10) not null,
	unidade char(2) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkps_unidademedida primary key(id),
	constraint ukps_unidademedida01 unique(descricao),
	constraint ukps_unidademedida02 unique(unidade)
);

create sequence sqps_tipo start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table ps_tipo (
	id integer not null default nextval('sqps_tipo'),
	descricao varchar(8) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkps_tipo primary key(id),
	constraint ukps_tipo01 unique(descricao)
);

create sequence sqps_grupo start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table ps_grupo (
	id integer not null default nextval('sqps_grupo'),
	descricao varchar(30) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkps_grupo primary key(id),
	constraint ukps_grupo01 unique(descricao)
);

create sequence sqps_classe start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table ps_classe (
	id integer not null default nextval('sqps_classe'),
	idgrupo integer not null,
	descricao varchar(30) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkps_classe primary key(id),
	constraint fkps_classe01 foreign key(idgrupo) references ps_grupo(id),
	constraint ukps_classe01 unique(descricao)
);

create sequence sqps_produtoservico start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table ps_produtoservico (
	id bigint not null default nextval('sqps_produtoservico'),
	idclasse integer not null,
	descricao varchar(120) not null,
	aceitadesconto boolean not null default true,
	idtipo integer not null,
	idunidademedida integer not null,
	inativo boolean not null default false,
	marca varchar(30),
	codigobarra varchar(120),
	observacao text,
	pathimagem varchar(255),
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkps_produtoservico primary key(id),
	constraint fkps_produtoservico01 foreign key(idclasse) references ps_classe(id),
	constraint fkps_produtoservico02 foreign key(idtipo) references ps_tipo(id),
	constraint fkps_produtoservico03 foreign key(idunidademedida) references ps_unidademedida(id),
	constraint ukps_produtoservico01 unique(descricao),
	constraint ukps_produtoservico02 unique(codigobarra)
);

create sequence sqps_custo start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table ps_custo (
	id bigint not null default nextval('sqps_custo'),
	idprodutoservico bigint not null,
	valor numeric(10,2) not null, 
	valormin numeric(10,2),
	valormax numeric(10,2),
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkps_custo primary key(id),
	constraint fkps_custo01 foreign key(idprodutoservico) references ps_produtoservico(id),
	constraint ukps_custo01 unique(idprodutoservico),
	constraint ckps_custo01 check(valor >= 0),
	constraint ckps_custo02 check(valormin >= 0),
	constraint ckps_custo03 check(valormax >= 0)
);

create sequence sqps_estoque start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table ps_estoque (
	id bigint not null default nextval('sqps_estoque'),
	idprodutoservico bigint not null,
	quantidade numeric(10,2) not null,
	quantidademin numeric(10,2),	
	quantidademax numeric(10,2),
	datacreate date not null,
	dataupdate timestamp not null,	
	constraint pkps_estoque primary key(id),
	constraint fkps_estoque01 foreign key(idprodutoservico) references ps_produtoservico(id),
	constraint ukps_estoque01 unique(idprodutoservico),
	constraint ckps_estoque01 check(quantidade >= 0),
	constraint ckps_estoque02 check(quantidademin >= 0),
	constraint ckps_estoque03 check(quantidademax >= 0)
);

create sequence sqps_composicao start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table ps_composicao (
	id integer not null default nextval('sqps_composicao'),
	idprodutoservico bigint not null,
	idcomposicao bigint not null,
	quantidade numeric(10, 2) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkps_composicao primary key(id),
	constraint fkps_composicao01 foreign key(idprodutoservico) references ps_produtoservico(id),
	constraint fkps_composicao02 foreign key(idcomposicao) references ps_produtoservico(id),
	constraint ukps_composicao01 unique(idprodutoservico, idcomposicao),
	constraint ckps_composicao01 check(quantidade >= 0)
);

create sequence sqps_movimentotipo start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table ps_movimentotipo (
	id integer not null default nextval('sqps_movimentotipo'),
	idtipooperacao integer not null,
	descricao varchar(30) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkps_movimentotipo primary key(id),
	constraint fkps_movimentotipo01 foreign key(idtipooperacao) references sys_tipooperacao(id)
);

create sequence sqps_movimento start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table ps_movimento (
	id bigint not null default nextval('sqps_movimento'),
	idmovimentotipo integer not null,
	nrodocumento bigint,		
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkps_movimento primary key(id),
	constraint fkps_movimento01 foreign key(idmovimentotipo) references ps_movimentotipo(id)	
);

create sequence sqps_movimentoitem start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table ps_movimentoitem (
	id bigint not null default nextval('sqps_movimentoitem'),
	idmovimento integer not null,
	idprodutoservico bigint not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkps_movimentoitem primary key(id),
	constraint fkps_movimentoitem01 foreign key(idmovimento) references ps_movimento(id),
	constraint fkps_movimentoitem02 foreign key(idprodutoservico) references ps_produtoservico(id),
	constraint ukps_movimentoitem01 unique(idmovimento, idprodutoservico)	
);

create sequence sqps_movimentosaldo start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table ps_movimentosaldo (
	id bigint not null default nextval('sqps_movimentosaldo'),
	idmovimentoitem bigint not null,
	quantidade numeric(10, 2) not null,
	saldoanterior numeric(10, 2) not null,
	saldoatual numeric(10, 2) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkps_movimentosaldo primary key(id),
	constraint fkps_movimentosaldo01 foreign key(idmovimentoitem) references ps_movimentoitem(id),
	constraint ckps_movimentosaldo01 check(quantidade >= 0),
	constraint ckps_movimentosaldo02 check(saldoanterior >= 0),
	constraint ckps_movimentosaldo03 check(saldoatual >= 0)
);