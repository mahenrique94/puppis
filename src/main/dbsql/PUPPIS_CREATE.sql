create sequence sqsys_modulo start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table sys_modulo (
	id integer not null default nextval('sqsys_modulo'),
	descricao varchar(20) not null,
	inativo boolean not null default false,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pksys_modulo primary key(id),
	constraint uksys_modulo01 unique(descricao)
);

create sequence sqsys_tipooperacao start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table sys_tipooperacao (
	id integer not null default nextval('sqsys_modulo'),
	tipo char(1),
	descricao varchar(30) not null,
	idmodulo integer not null,
	gruporesumo varchar(30),
	datacreate date not null,
	dataupdate timestamp not null,
	primary key(id),
	constraint fksys_tipooperacao01 foreign key(idmodulo) references sys_modulo(id),
	constraint uksys_tipooperacao01 unique(descricao)
);

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
	rua varchar(60) not null,
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

create sequence sqadm_comercio start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table adm_comercio (
	id integer not null default nextval('sqadm_comercio'),
	nomerazaosocial varchar(60) not null,
	nomefantasia varchar(60),
	inativo boolean not null default false,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkadm_comercio primary key(id)
);

create sequence sqadm_contato start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table adm_contato (
	id integer not null default nextval('sqadm_contato'),
	idcomercio integer not null,
	ddd integer,
	telefone varchar(9),
	celular varchar(11),
	email varchar(255),
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkadm_contato primary key(id),
	constraint fkadm_contato01 foreign key(idcomercio) references adm_comercio(id)
);

create sequence sqadm_documento start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table adm_documento (
	id integer not null default nextval('sqadm_documento'),
	idcomercio integer not null,
	cpfcnpj varchar(18) not null,
	rginscricaoestadual varchar(15) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkadm_documento primary key(id),
	constraint fkadm_documento01 foreign key(idcomercio) references adm_comercio(id),
	constraint ukadm_documento01 unique(cpfcnpj)
);

create sequence sqadm_endereco start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table adm_endereco (
	id integer not null default nextval('sqadm_endereco'),
	idcomercio integer not null,
	rua varchar(60) not null,
	numero varchar(10) not null,
	cep varchar(9) not null,
	complemento varchar(30),
	bairro varchar(60) not null,
	idcidade integer not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkadm_endereco primary key(id),
	constraint fkadm_endereco01 foreign key(idcomercio) references adm_comercio(id),
	constraint fkadm_endereco02 foreign key(idcidade) references cad_cidade(id),
	constraint ukadm_endereco01 unique(rua, numero, cep, bairro)
);

create sequence sqadm_modulo start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table adm_modulo (
	id integer not null default nextval('sqadm_modulo'),
	idcomercio integer not null,
	idmodulo integer not null,
	datacreate date not null,
	constraint pkadm_modulo primary key(id),
	constraint fkadm_modulo01 foreign key(idcomercio) references adm_comercio(id),
	constraint fkadm_modulo02 foreign key(idmodulo) references sys_modulo(id),
	constraint ukadm_modulo01 unique(idcomercio, idmodulo)		
);

create sequence sqadm_pagamento start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table adm_pagamento (
	id integer not null default nextval('sqadm_pagamento'),
	idcomercio integer not null,
	idcontabancaria integer not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkadm_pagamento primary key(id),
	constraint fkadm_pagamento01 foreign key(idcomercio) references adm_comercio(id),
	constraint fkadm_pagamento02 foreign key(idcontabancaria) references fin_contabancaria(id)
);

create sequence sqadm_tipoacesso start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table adm_tipoacesso (
	id integer not null default nextval('sqadm_tipoacesso'),
	descricao varchar(30) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkadm_tipoacesso primary key(id),
	constraint ukadm_tipoacesso01 unique(descricao)
);

create sequence sqadm_grupo start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table adm_grupo (
	id integer not null default nextval('sqadm_grupo'),	
	descricao varchar(30) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkadm_grupo primary key(id),	
	constraint ukadm_grupo01 unique(descricao)
);

create sequence sqadm_usuario start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table adm_usuario (
	id integer not null default nextval('sqadm_usuario'),
	nome varchar(60) not null,
	usuario varchar(30) not null,
	senha varchar(8) not null,
	idgrupo integer not null,
	idtipoacesso integer not null,
	inativo boolean not null default false,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkadm_usuario primary key(id),
	constraint fkadm_usuario01 foreign key(idgrupo) references adm_grupo(id),
	constraint fkadm_usuario02 foreign key(idtipoacesso) references adm_tipoacesso(id),
	constraint ukadm_usuario01 unique(nome),
	constraint ukadm_usuario02 unique(usuario),
	constraint ckadm_usuario01 check(char_length(senha) = 8)
);

create sequence sqadm_usuariocomercio start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table adm_usuariocomercio (
	id integer not null default nextval('sqadm_usuariocomercio'),
	idusuario integer not null,
	idcomercio integer not null,
	datacreate date,
	constraint pkadm_usuariocomercio primary key(id),
	constraint fkadm_usuariocomercio01 foreign key(idusuario) references adm_usuario(id),
	constraint fkadm_usuariocomercio02 foreign key(idcomercio) references adm_comercio(id),
	constraint ukadm_usuariocomercio01 unique(idusuario, idcomercio)
);

create sequence sqadm_permissao start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table adm_permissao (
	id integer not null default nextval('sqadm_permissao'),
	idusuario integer,
	idgrupo integer,
	tabela varchar(30) not null,
	formulario boolean not null,
	salvar boolean not null,
	editar boolean not null,
	deletar boolean not null,
	listar boolean not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkadm_permissao primary key(id),
	constraint fkadm_permissao01 foreign key(idusuario) references adm_usuario(id),
	constraint fkadm_permissao02 foreign key(idgrupo) references adm_grupo(id),
	constraint ukadm_permissao01 unique (idusuario, idgrupo)
);

create sequence sqtbl_preco start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table tbl_preco (
    id bigint not null default nextval('sqtbl_preco'),
    idprodutoservico bigint not null,     
    datacreate date not null,
    dataupdate timestamp not null,
    constraint pktbl_preco primary key(id),
    constraint fktbl_preco01 foreign key(idprodutoservico) references ps_produtoservico(id)
);

create sequence sqtbl_precopessoa start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table tbl_precopessoa (
    id bigint not null default nextval('sqtbl_precopessoa'),
    idtabelapreco bigint not null,
    iddefinicao integer not null,
    datacreate date not null,
    dataupdate timestamp not null,
    constraint pktbl_precopessoa primary key(id),
    constraint fktbl_precopessoa01 foreign key(idtabelapreco) references tbl_preco(id),
    constraint fktbl_precopessoa02 foreign key(iddefinicao) references pes_definicao(id),
    constraint uktbl_precopessoa01 unique(idtabelapreco, iddefinicao)
);

create sequence sqtbl_precovalor start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table tbl_precovalor (
    id bigint not null default nextval('sqtbl_precovalor'),
    idtabelaprecopessoa bigint not null,    
    valor numeric(10,2) not null,
    valorpromocao numeric(10, 2) not null,
    valordesconto numeric(10, 2) not null,
    valorparcelamento numeric(10, 2) not null,
    valorfaturado numeric(10, 2) not null,
    inativo boolean default false,
    datavigenciainicial timestamp not null,
    datavigenciafinal timestamp not null,
    datacreate date not null,
    dataupdate timestamp not null,
    constraint pktbl_precovalor primary key(id),
    constraint fktbl_precovalor01 foreign key(idtabelaprecopessoa) references tbl_precopessoa(id),    
    constraint cktbl_precovalor01 check(valor >= 0),
    constraint cktbl_precovalor02 check(valorpromocao >= 0),
    constraint cktbl_precovalor03 check(valordesconto >= 0),
    constraint cktbl_precovalor04 check(valorparcelamento >= 0),
    constraint cktbl_precovalor05 check(valorfaturado >= 0)
);

create sequence sqtbl_precovaloroutros start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table tbl_precovaloroutros (
    id bigint not null default nextval('sqtbl_precovaloroutros'),
    idtabelaprecopessoa bigint not null,
    descricao varchar(30) not null,
    valor numeric(10, 2) not null,
    datacreate date not null,
    dataupdate timestamp not null,
    constraint pktbl_precovaloroutros primary key(id),
    constraint fktbl_precovaloroutros01 foreign key(idtabelaprecopessoa) references tbl_precopessoa(id),
    constraint cktbl_precovaloroutros01 check(valor >= 0),
    constraint uktbl_precovaloroutros01 unique(descricao)
);

create sequence sqcom_nota start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table com_nota (
	id bigint not null default nextval('sqcom_nota'),
	idcomercio integer not null,
	idusuario integer not null,
	iddefinicao bigint,	
	dataemissao date,
	dataatualizacao date,
	datacancelamento date,
	numero integer,
	serie integer,
	idtipooperacao integer not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkcom_nota primary key(id),
	constraint fkcom_nota01 foreign key(idusuario) references adm_usuario(id),
	constraint fkcom_nota02 foreign key(iddefinicao) references pes_definicao(id),	
	constraint fkcom_nota03 foreign key(idtipooperacao) references sys_tipooperacao(id),
	constraint fkcom_nota04 foreign key(idcomercio) references adm_comercio(id),	
	constraint ukcom_nota01 unique(numero, serie)
);

create sequence sqcom_notacusto start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table com_notacusto (
	id bigint not null default nextval('sqcom_notacusto'),
	idnota bigint not null,
	idformapagamento integer not null,
	valordesconto numeric(10, 2),
	valorjuros numeric(10, 2),
	valoricms numeric(10, 2),
	valoripi numeric(10, 2),
	valortotal numeric(10, 2) not null,
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkcom_notacusto primary key(id),
	constraint fkcom_notacusto01 foreign key(idnota) references com_nota(id),
	constraint fkcom_notacusto02 foreign key(idformapagamento) references fin_formapagamento(id),
	constraint ckcom_notacusto01 check(valordesconto >= 0),
	constraint ckcom_notacusto02 check(valorjuros >= 0),
	constraint ckcom_notacusto03 check(valoricms >= 0),
	constraint ckcom_notacusto04 check(valoripi >= 0),
	constraint ckcom_notacusto05 check(valortotal >= 0)
);

create sequence sqcom_notaitem start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table com_notaitem (
	id bigint not null default nextval('sqcom_notaitem'),
	idnota bigint not null,
	idprodutoservico bigint not null,
	idtabelaprecopessoa integer,
	valorunitario numeric(10, 2) not null,
	porcjuros numeric(10, 2),
	porcicms numeric(10, 2),
	porcipi numeric(10, 2),
	porcdesconto numeric(10, 2),
	quantidade numeric(10, 2),
	datacreate date not null,
	dataupdate timestamp not null,
	constraint pkcom_notaitem primary key(id),
	constraint fkcom_notaitens01 foreign key(idnota) references com_nota(id),	
	constraint fkcom_notaitens02 foreign key(idprodutoservico) references ps_produtoservico(id),
	constraint fkcom_notaitens03 foreign key(idtabelaprecopessoa) references tbl_precopessoa(id),	
	constraint ckcom_notaitens01 check(valorunitario >= 0),
	constraint ckcom_notaitens03 check(porcjuros >= 0),
	constraint ckcom_notaitens04 check(porcicms >= 0),
	constraint ckcom_notaitens05 check(porcipi >= 0),
	constraint ckcom_notaitens06 check(porcdesconto >= 0)
);

-- Função para fazer calculo da tabela de preço dos produtos no lançamento de vendas,
-- realizado cálculo via banco para caso os diferentes cálculos entre clientes sejam customizados apenas na function,
-- evitando gambiarras no sistema
create or replace function fn_calcularTabelaPreco(idNotaItem_in bigint) returns numeric(10, 2) as $$
declare
  v_idNota bigint;
  v_idProdutoServico integer;
  v_idDefinicao bigint;
  v_idDefinicaoPadrao bigint = 0;
  v_idTabelaPrecoPessoa integer;
  v_valor numeric(10, 2) = 0.0;
  v_valorPromocao numeric(10, 2) = 0.0;
  v_valorParcelamento numeric(10, 2) = 0.0;
  v_valorFaturado numeric(10, 2) = 0.0;
  v_valorDesconto numeric(10, 2) = 0.0;
  v_valorTotalOutros numeric(10, 2) = 0.0;
  v_valorProduto numeric(10, 2) = 0.0;
  v_formaPagamento varchar(30);
  v_porcDesconto numeric(10, 2) = 0.0;
  v_totalNota numeric(10, 2) = 0.0;
  v_FATOR integer = 100;
  v_rowTblValorOutros tbl_precovaloroutros%rowtype;
  v_rowNotaItens com_notaitem%rowtype;
begin
  -- Encontrando ID do produto ou servico e ID da definição utilizada na nota
  select ite.idprodutoservico, nota.iddefinicao, nota.id 
  into v_idProdutoServico, v_idDefinicao, v_idNota
  from com_notaitem ite, com_nota nota
  where ite.idnota = nota.id
    and ite.id = idNotaItem_in;

  -- Buscando tabela de preço de acordo com definição e produto
  select tblpes.id
  into v_idTabelaPrecoPessoa
  from tbl_precopessoa tblpes, tbl_preco tbl
  where tblpes.idtabelapreco = tbl.id
    and tblpes.iddefinicao = v_idDefinicao
    and tbl.idprodutoservico = v_idProdutoServico;

  -- Verificando se encontrou uma tabela para o cliente da nota,
  -- caso não tenha encontrado vou buscar o cliente padrão
  if v_idTabelaPrecoPessoa is null then
    begin
      select tblpes.id, tblpes.iddefinicao
      into v_idTabelaPrecoPessoa, v_idDefinicao
      from tbl_precopessoa tblpes, tbl_preco tbl
      where tblpes.idtabelapreco = tbl.id
        and tblpes.iddefinicao = v_idDefinicaoPadrao
        and tbl.idprodutoservico = v_idProdutoServico;
    end;
  end if;

  -- Buscando tabela de preço pelo cliente da nota ou padrão caso não tenha o cliente específico
  if v_idTabelaPrecoPessoa is not null then
    begin
      select tblvalor.valor, tblvalor.valorpromocao, tblvalor.valordesconto, tblvalor.valorparcelamento, tblvalor.valorfaturado
      into v_valor, v_valorPromocao, v_valorDesconto, v_valorParcelamento, v_valorFaturado
      from tbl_precovalor tblvalor, tbl_precopessoa tblpes, tbl_preco tbl
      where tblvalor.idtabelaprecopessoa = tblpes.id
        and tblpes.idtabelapreco = tbl.id
        and tblpes.id = v_idTabelaPrecoPessoa
        and tblvalor.datavigenciainicial <= current_timestamp
        and tblvalor.datavigenciafinal >= current_timestamp;                
    end;
  end if;

  -- Verificando qual valor pegar
  -- Regras: Se a tabela tem valor de promoção então deve-se utilizar ele,
  --         se a venda tem porcentagem de desconto então deve-se pegar o valor de desconto,
  --         se é uma venda parcelada(CREDITO) então deve-se pegar o valor de parcelamento,
  --         se é uma venda faturada(FATURADO) então deve-se pegar o valor faturado,
  --         caso a tabela não possuia nenhum desses valores então deve-se usar o valor normal para qualquer venda
  v_valorProduto = v_valor;

  -- Verificando se é para usar valor promoção
  if v_valorPromocao > 0 then
    v_valorProduto = v_valorPromocao;
  end if;

  -- Verificando se é para calcular valor de desconto
  select ite.porcdesconto
  into v_porcDesconto
  from com_notaitem ite
  where ite.id = idNotaItem_in;

  if v_porcDesconto > 0 then
    begin
      if v_valorDesconto > 0 then
        v_valorProduto = v_valorDesconto - ((v_porcDesconto / v_FATOR) * v_valorDesconto);
      else
        v_valorProduto = v_valor - ((v_porcDesconto / v_FATOR) * v_valor);
      end if;
    end;
  end if;

  -- Verificando se é para usar valor de parcelamento
  if v_valorParcelamento > 0 then
    begin
      select pag.descricao
      into v_formaPagamento
      from com_notaitem ite, com_nota nota, com_notacusto cust, fin_formapagamento pag
      where ite.idnota = nota.id
        and ite.id = idNotaItem_in
        and cust.idnota = nota.id
        and cust.idformapagamento = pag.id
        and pag.descricao like 'CREDITO%';
        
        if v_formaPagamento is not null then
          v_valorProduto = v_valorParcelamento;
        end if;
        
    end;
  end if;

  -- Verificando se é para usar valor de faturamento
  if v_valorFaturado > 0 then
    begin
      select pag.descricao
      into v_formaPagamento
      from com_notaitem ite, com_nota nota, com_notacusto cust, fin_formapagamento pag
      where ite.idnota = nota.id
        and ite.id = idNotaItem_in
        and cust.idnota = nota.id
        and cust.idformapagamento = pag.id
        and pag.descricao like 'FATURADO%';
        
        if v_formaPagamento is not null then
          v_valorProduto = v_valorFaturado;
        end if;
        
    end;
  end if;

  -- Buscando por valores adicionais informados na tabela de preço,
  -- caso exista valores será somado todos eles e adicionado no valor final do produto
  for v_rowTblValorOutros in
    select tblout.* 
    from tbl_precovaloroutros tblout, tbl_precopessoa tblpes, tbl_preco tbl
    where tblout.idtabelaprecopessoa = tblpes.id
      and tblpes.idtabelapreco = tbl.id
      and tbl.id = v_idTabelaPrecoPessoa      
  loop
    v_valorTotalOutros = v_valorTotalOutros + v_rowTblValorOutros.valor;
  end loop;

  v_valorProduto = v_valorProduto + v_valorTotalOutros;

  if v_valorProduto > 0 then
    begin
      update com_notaitem set idtabelaprecopessoa = v_idTabelaPrecoPessoa, valorunitario = v_valorProduto where id = idNotaItem_in;      
    end;
  end if;

-- Somando todos os itens para atualizar o valor total da nota
  for v_rowNotaItens in
    select ite.*
    from com_notaitem ite where ite.idnota = v_idNota
  loop
    v_totalNota = v_totalNota + (v_rowNotaItens.quantidade * v_rowNotaItens.valorunitario);
  end loop;

  if v_totalNota > 0 then
    begin
      update com_notacusto set valortotal = v_totalNota where idnota = v_idNota;
    end;
  end if;

  return v_valorProduto;
end;
$$ language plpgsql volatile returns null on null input;



--------------------------------------------- SYS_MODULO ---------------------------------------------------------------------------------------------------------------
insert into sys_modulo (id, datacreate,dataupdate,inativo,descricao) values (0, current_timestamp, current_timestamp, 'F', '');
insert into sys_modulo (id, datacreate,dataupdate,inativo,descricao) values (1, current_timestamp, current_timestamp, 'F', 'COMERCIO');
insert into sys_modulo (id, datacreate,dataupdate,inativo,descricao) values (2, current_timestamp, current_timestamp, 'F', 'FINANCEIRO');
insert into sys_modulo (id, datacreate,dataupdate,inativo,descricao) values (3, current_timestamp, current_timestamp, 'F', 'CADASTRO');
insert into sys_modulo (id, datacreate,dataupdate,inativo,descricao) values (4, current_timestamp, current_timestamp, 'F', 'ADMINISTRADOR');

--------------------------------------------- SYS_TIPOOPERACAO ---------------------------------------------------------------------------------------------------------------
insert into sys_tipooperacao (id, datacreate,dataupdate,descricao,tipo,idmodulo,gruporesumo) values (0, current_timestamp, current_timestamp, '','', 0, null);
insert into sys_tipooperacao (id, datacreate,dataupdate,descricao,tipo,idmodulo,gruporesumo) values (1, current_timestamp, current_timestamp, 'COMPRA','E',1, 'NOTA');
insert into sys_tipooperacao (id, datacreate,dataupdate,descricao,tipo,idmodulo,gruporesumo) values (2, current_timestamp, current_timestamp, 'VENDA','S',1, 'NOTA');
insert into sys_tipooperacao (id, datacreate,dataupdate,descricao,tipo,idmodulo,gruporesumo) values (3, current_timestamp, current_timestamp, 'ENTRADA','C',2,'DOCUMENTO');
insert into sys_tipooperacao (id, datacreate,dataupdate,descricao,tipo,idmodulo,gruporesumo) values (4, current_timestamp, current_timestamp, 'BAIXA',null,2,'BAIXA');
insert into sys_tipooperacao (id, datacreate,dataupdate,descricao,tipo,idmodulo,gruporesumo) values (5, current_timestamp, current_timestamp, 'ESTORNO',null,2,'BAIXA');
insert into sys_tipooperacao (id, datacreate,dataupdate,descricao,tipo,idmodulo,gruporesumo) values (6, current_timestamp, current_timestamp, 'CANCELAMENTO',null,2,'BAIXA');
insert into sys_tipooperacao (id, datacreate,dataupdate,descricao,tipo,idmodulo,gruporesumo) values (7, current_timestamp, current_timestamp, 'LANCAMENTO MANUAL',null,2,'EXTRATO');
insert into sys_tipooperacao (id, datacreate,dataupdate,descricao,tipo,idmodulo,gruporesumo) values (8, current_timestamp, current_timestamp, 'ENTRADA MANUAL','E',1, null);
insert into sys_tipooperacao (id, datacreate,dataupdate,descricao,tipo,idmodulo,gruporesumo) values (9, current_timestamp, current_timestamp, 'SAIDA MANUAL','S',1, null);

-------------------------------------------------- CAD_PAIS ----------------------------------------------------------------------------------------------------------------------
insert into cad_pais (id, datacreate, descricao, dataupdate) values (1058, current_date, 'BRASIL', current_timestamp);

-------------------------------------------------- CAD_ESTADO ----------------------------------------------------------------------------------------------------------------------
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values (0, current_date, '', '', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 11, current_date, 'RONDONIA', 'RO', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 12, current_date, 'ACRE', 'AC', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 13, current_date, 'AMAZONAS', 'AM', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 14, current_date, 'RORAIMA', 'RR', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 15, current_date, 'PARA', 'PA', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 16, current_date, 'AMAPA', 'AP', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 17, current_date, 'TOCANTINS', 'TO', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 21, current_date, 'MARANHAO', 'MA', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 22, current_date, 'PIAUI', 'PI', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 23, current_date, 'CEARA', 'CE', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 24, current_date, 'RIO GRANDE PB NORTE', 'RN', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 25, current_date, 'PARAIBA', 'PB', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 26, current_date, 'PERNAMBUCO', 'PE', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 27, current_date, 'ALAGOAS', 'AL', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 28, current_date, 'SERGIPE', 'SE', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 29, current_date, 'BAHIA', 'BA', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 31, current_date, 'MINAS GERAIS', 'MG', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 32, current_date, 'ESPIRITO SANTO', 'ES', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 33, current_date, 'RIO DE JANEIRO', 'RJ', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 35, current_date, 'SAO PAULO', 'SP', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 41, current_date, 'PARANA', 'PR', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 42, current_date, 'SANTA CATARINA', 'SC', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 43, current_date, 'RIO GRANDE DO SUL', 'RS', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 50, current_date, 'MATO GROSSO DO SUL', 'MS', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 51, current_date, 'MATO GROSSO', 'MT', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 52, current_date, 'GOIAS', 'GO', 1058, current_timestamp);
insert into cad_estado (id, datacreate, descricao, uf, idpais, dataupdate) values ( 53, current_date, 'DISTRITO FEDERAL', 'DF', 1058, current_timestamp);

-------------------------------------------------- CAD_CIDADE ----------------------------------------------------------------------------------------------------------------------
insert into cad_cidade (id,datacreate,descricao,idestado,dataupdate) values (0,current_timestamp,'',0,current_timestamp);
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100015,11,'ALTA FLORESTA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100023,11,'ARIQUEMES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100031,11,'CABIXI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100049,11,'CACOAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100056,11,'CEREJEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100064,11,'COLORADO DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100072,11,'CORUMBIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100080,11,'COSTA MARQUES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100098,11,'ESPIGAO D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100106,11,'GUAJARA-MIRIM',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100114,11,'JARU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100122,11,'JI-PARANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100130,11,'MACHADINHO D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100148,11,'NOVA BRASILANDIA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100155,11,'OURO PRETO DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100189,11,'PIMENTA BUENO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100205,11,'PORTO VELHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100254,11,'PRESIDENTE MEDICI',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100262,11,'RIO CRESPO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100288,11,'ROLIM DE MOURA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100296,11,'SANTA LUZIA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100304,11,'VILHENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100320,11,'SAO MIGUEL DO GUAPORE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100338,11,'NOVA MAMORE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100346,11,'ALVORADA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100379,11,'ALTO ALEGRE DOS PARECIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100403,11,'ALTO PARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100452,11,'BURITIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100502,11,'NOVO HORIZONTE DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100601,11,'CACAULANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100700,11,'CAMPO NOVO DE RONDONIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100809,11,'CANDEIAS DO JAMARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100908,11,'CASTANHEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100924,11,'CHUPINGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1100940,11,'CUJUBIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101005,11,'GOVERNADOR JORGE TEIXEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101104,11,'ITAPUA DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101203,11,'MINISTRO ANDREAZZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101302,11,'MIRANTE DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101401,11,'MONTE NEGRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101435,11,'NOVA UNIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101450,11,'PARECIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101468,11,'PIMENTEIRAS DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101476,11,'PRIMAVERA DE RONDONIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101484,11,'SAO FELIPE D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101492,11,'SAO FRANCISCO DO GUAPORE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101500,11,'SERINGUEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101559,11,'TEIXEIROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101609,11,'THEOBROMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101708,11,'URUPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101757,11,'VALE DO ANARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1101807,11,'VALE DO PARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200013,12,'ACRELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200054,12,'ASSIS BRASIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200104,12,'BRASILEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200138,12,'BUJARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200179,12,'CAPIXABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200203,12,'CRUZEIRO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200252,12,'EPITACIOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200302,12,'FEIJO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200328,12,'JORDAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200336,12,'MANCIO LIMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200344,12,'MANOEL URBANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200351,12,'MARECHAL THAUMATURGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200385,12,'PLACIDO DE CASTRO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200393,12,'PORTO WALTER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200401,12,'RIO BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200427,12,'RODRIGUES ALVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200435,12,'SANTA ROSA DO PURUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200450,12,'SENADOR GUIOMARD',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200500,12,'SENA MADUREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200609,12,'TARAUACA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200708,12,'XAPURI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1200807,12,'PORTO ACRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300029,13,'ALVARAES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300060,13,'AMATURA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300086,13,'ANAMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300102,13,'ANORI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300144,13,'APUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300201,13,'ATALAIA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300300,13,'AUTAZES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300409,13,'BARCELOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300508,13,'BARREIRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300607,13,'BENJAMIN CONSTANT',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300631,13,'BERURI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300680,13,'BOA VISTA DO RAMOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300706,13,'BOCA DO ACRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300805,13,'BORBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300839,13,'CAAPIRANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1300904,13,'CANUTAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301001,13,'CARAUARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301100,13,'CAREIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301159,13,'CAREIRO DA VARZEA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301209,13,'COARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301308,13,'CODAJAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301407,13,'EIRUNEPE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301506,13,'ENVIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301605,13,'FONTE BOA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301654,13,'GUAJARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301704,13,'HUMAITA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301803,13,'IPIXUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301852,13,'IRANDUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301902,13,'ITACOATIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1301951,13,'ITAMARATI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1302009,13,'ITAPIRANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1302108,13,'JAPURA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1302207,13,'JURUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1302306,13,'JUTAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1302405,13,'LABREA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1302504,13,'MANACAPURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1302553,13,'MANAQUIRI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1302603,13,'MANAUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1302702,13,'MANICORE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1302801,13,'MARAA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1302900,13,'MAUES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303007,13,'NHAMUNDA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303106,13,'NOVA OLINDA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303205,13,'NOVO AIRAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303304,13,'NOVO ARIPUANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303403,13,'PARINTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303502,13,'PAUINI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303536,13,'PRESIDENTE FIGUEIREDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303569,13,'RIO PRETO DA EVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303601,13,'SANTA ISABEL DO RIO NEGRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303700,13,'SANTO ANTONIO DO IÇA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303809,13,'SAO GABRIEL DA CACHOEIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303908,13,'SAO PAULO DE OLIVENÇA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1303957,13,'SAO SEBASTIAO DO UATUMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1304005,13,'SILVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1304062,13,'TABATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1304104,13,'TAPAUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1304203,13,'TEFE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1304237,13,'TONANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1304260,13,'UARINI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1304302,13,'URUCARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1304401,13,'URUCURITUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400027,14,'AMAJARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400050,14,'ALTO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400100,14,'BOA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400159,14,'BONFIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400175,14,'CANTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400209,14,'CARACARAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400233,14,'CAROEBE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400282,14,'IRACEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400308,14,'MUCAJAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400407,14,'NORMANDIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400456,14,'PACARAIMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400472,14,'RORAINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400506,14,'SAO JOAO DA BALIZA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400605,14,'SAO LUIZ',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1400704,14,'UIRAMUTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500107,15,'ABAETETUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500131,15,'ABEL FIGUEIREDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500206,15,'ACARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500305,15,'AFUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500347,15,'AGUA AZUL DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500404,15,'ALENQUER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500503,15,'ALMEIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500602,15,'ALTAMIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500701,15,'ANAJAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500800,15,'ANANINDEUA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500859,15,'ANAPU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500909,15,'AUGUSTO CORREA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1500958,15,'AURORA DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501006,15,'AVEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501105,15,'BAGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501204,15,'BAIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501253,15,'BANNACH',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501303,15,'BARCARENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501402,15,'BELEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501451,15,'BELTERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501501,15,'BENEVIDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501576,15,'BOM JESUS DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501600,15,'BONITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501709,15,'BRAGANÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501725,15,'BRASIL NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501758,15,'BREJO GRANDE DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501782,15,'BREU BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501808,15,'BREVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501907,15,'BUJARU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1501956,15,'CACHOEIRA DO PIRIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502004,15,'CACHOEIRA DO ARARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502103,15,'CAMETA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502152,15,'CANAA DOS CARAJAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502202,15,'CAPANEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502301,15,'CAPITAO POÇO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502400,15,'CASTANHAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502509,15,'CHAVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502608,15,'COLARES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502707,15,'CONCEIÇAO DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502756,15,'CONCORDIA DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502764,15,'CUMARU DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502772,15,'CURIONOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502806,15,'CURRALINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502855,15,'CURUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502905,15,'CURUÇA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502939,15,'DOM ELISEU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1502954,15,'ELDORADO DO CARAJAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503002,15,'FARO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503044,15,'FLORESTA DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503077,15,'GARRAFAO DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503093,15,'GOIANESIA DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503101,15,'GURUPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503200,15,'IGARAPE-AÇU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503309,15,'IGARAPE-MIRI',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503408,15,'INHANGAPI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503457,15,'IPIXUNA DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503507,15,'IRITUIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503606,15,'ITAITUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503705,15,'ITUPIRANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503754,15,'JACAREACANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503804,15,'JACUNDA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1503903,15,'JURUTI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504000,15,'LIMOEIRO DO AJURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504059,15,'MAE DO RIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504109,15,'MAGALHAES BARATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504208,15,'MARABA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504307,15,'MARACANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504406,15,'MARAPANIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504422,15,'MARITUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504455,15,'MEDICILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504505,15,'MELGAÇO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504604,15,'MOCAJUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504703,15,'MOJU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504752,15,'MOJUI DOS CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504802,15,'MONTE ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504901,15,'MUANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504950,15,'NOVA ESPERANÇA DO PIRIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1504976,15,'NOVA IPIXUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505007,15,'NOVA TIMBOTEUA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505031,15,'NOVO PROGRESSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505064,15,'NOVO REPARTIMENTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505106,15,'OBIDOS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505205,15,'OEIRAS DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505304,15,'ORIXIMINA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505403,15,'OUREM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505437,15,'OURILANDIA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505486,15,'PACAJA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505494,15,'PALESTINA DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505502,15,'PARAGOMINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505536,15,'PARAUAPEBAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505551,15,'PAU D''ARCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505601,15,'PEIXE-BOI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505635,15,'PIÇARRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505650,15,'PLACAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505700,15,'PONTA DE PEDRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505809,15,'PORTEL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1505908,15,'PORTO DE MOZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506005,15,'PRAINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506104,15,'PRIMAVERA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506112,15,'QUATIPURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506138,15,'REDENÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506161,15,'RIO MARIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506187,15,'RONDON DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506195,15,'RUROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506203,15,'SALINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506302,15,'SALVATERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506351,15,'SANTA BARBARA DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506401,15,'SANTA CRUZ DO ARARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506500,15,'SANTA IZABEL DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506559,15,'SANTA LUZIA DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506583,15,'SANTA MARIA DAS BARREIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506609,15,'SANTA MARIA DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506708,15,'SANTANA DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506807,15,'SANTAREM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1506906,15,'SANTAREM NOVO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507003,15,'SANTO ANTONIO DO TAUA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507102,15,'SAO CAETANO DE ODIVELAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507151,15,'SAO DOMINGOS DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507201,15,'SAO DOMINGOS DO CAPIM',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507300,15,'SAO FELIX DO XINGU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507409,15,'SAO FRANCISCO DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507458,15,'SAO GERALDO DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507466,15,'SAO JOAO DA PONTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507474,15,'SAO JOAO DE PIRABAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507508,15,'SAO JOAO DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507607,15,'SAO MIGUEL DO GUAMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507706,15,'SAO SEBASTIAO DA BOA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507755,15,'SAPUCAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507805,15,'SENADOR JOSE PORFIRIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507904,15,'SOURE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507953,15,'TAILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507961,15,'TERRA ALTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1507979,15,'TERRA SANTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1508001,15,'TOME-AÇU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1508035,15,'TRACUATEUA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1508050,15,'TRAIRAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1508084,15,'TUCUMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1508100,15,'TUCURUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1508126,15,'ULIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1508159,15,'URUARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1508209,15,'VIGIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1508308,15,'VISEU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1508357,15,'VITORIA DO XINGU',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1508407,15,'XINGUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600055,16,'SERRA DO NAVIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600105,16,'AMAPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600154,16,'PEDRA BRANCA DO AMAPARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600204,16,'CALÇOENE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600212,16,'CUTIAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600238,16,'FERREIRA GOMES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600253,16,'ITAUBAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600279,16,'LARANJAL DO JARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600303,16,'MACAPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600402,16,'MAZAGAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600501,16,'OIAPOQUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600535,16,'PORTO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600550,16,'PRACUUBA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600600,16,'SANTANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600709,16,'TARTARUGALZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1600808,16,'VITORIA DO JARI',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1700251,17,'ABREULANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1700301,17,'AGUIARNOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1700350,17,'ALIANÇA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1700400,17,'ALMAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1700707,17,'ALVORADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1701002,17,'ANANAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1701051,17,'ANGICO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1701101,17,'APARECIDA DO RIO NEGRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1701309,17,'ARAGOMINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1701903,17,'ARAGUACEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1702000,17,'ARAGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1702109,17,'ARAGUAINA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1702158,17,'ARAGUANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1702208,17,'ARAGUATINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1702307,17,'ARAPOEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1702406,17,'ARRAIAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1702554,17,'AUGUSTINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1702703,17,'AURORA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1702901,17,'AXIXA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703008,17,'BABAÇULANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703057,17,'BANDEIRANTES DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703073,17,'BARRA DO OURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703107,17,'BARROLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703206,17,'BERNARDO SAYAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703305,17,'BOM JESUS DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703602,17,'BRASILANDIA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703701,17,'BREJINHO DE NAZARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703800,17,'BURITI DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703826,17,'CACHOEIRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703842,17,'CAMPOS LINDOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703867,17,'CARIRI DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703883,17,'CARMOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703891,17,'CARRASCO BONITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1703909,17,'CASEARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1704105,17,'CENTENARIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1704600,17,'CHAPADA DE AREIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1705102,17,'CHAPADA DA NATIVIDADE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1705508,17,'COLINAS DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1705557,17,'COMBINADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1705607,17,'CONCEIÇAO DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1706001,17,'COUTO MAGALHAES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1706100,17,'CRISTALANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1706258,17,'CRIXAS DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1706506,17,'DARCINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1707009,17,'DIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1707108,17,'DIVINOPOLIS DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1707207,17,'DOIS IRMAOS DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1707306,17,'DUERE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1707405,17,'ESPERANTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1707553,17,'FATIMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1707652,17,'FIGUEIROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1707702,17,'FILADELFIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1708205,17,'FORMOSO DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1708254,17,'FORTALEZA DO TABOCAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1708304,17,'GOIANORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1709005,17,'GOIATINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1709302,17,'GUARAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1709500,17,'GURUPI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1709807,17,'IPUEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1710508,17,'ITACAJA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1710706,17,'ITAGUATINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1710904,17,'ITAPIRATINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1711100,17,'ITAPORA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1711506,17,'JAU DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1711803,17,'JUARINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1711902,17,'LAGOA DA CONFUSAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1711951,17,'LAGOA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1712009,17,'LAJEADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1712157,17,'LAVANDEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1712405,17,'LIZARDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1712454,17,'LUZINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1712504,17,'MARIANOPOLIS DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1712702,17,'MATEIROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1712801,17,'MAURILANDIA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1713205,17,'MIRACEMA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1713304,17,'MIRANORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1713601,17,'MONTE DO CARMO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1713700,17,'MONTE SANTO DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1713809,17,'PALMEIRAS DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1713957,17,'MURICILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1714203,17,'NATIVIDADE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1714302,17,'NAZARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1714880,17,'NOVA OLINDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1715002,17,'NOVA ROSALANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1715101,17,'NOVO ACORDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1715150,17,'NOVO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1715259,17,'NOVO JARDIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1715507,17,'OLIVEIRA DE FATIMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1715705,17,'PALMEIRANTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1715754,17,'PALMEIROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1716109,17,'PARAISO DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1716208,17,'PARANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1716307,17,'PAU D''ARCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1716505,17,'PEDRO AFONSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1716604,17,'PEIXE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1716653,17,'PEQUIZEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1716703,17,'COLMEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1717008,17,'PINDORAMA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1717206,17,'PIRAQUE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1717503,17,'PIUM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1717800,17,'PONTE ALTA DO BOM JESUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1717909,17,'PONTE ALTA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718006,17,'PORTO ALEGRE DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718204,17,'PORTO NACIONAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718303,17,'PRAIA NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718402,17,'PRESIDENTE KENNEDY',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718451,17,'PUGMIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718501,17,'RECURSOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718550,17,'RIACHINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718659,17,'RIO DA CONCEIÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718709,17,'RIO DOS BOIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718758,17,'RIO SONO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718808,17,'SAMPAIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718840,17,'SANDOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718865,17,'SANTA FE DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718881,17,'SANTA MARIA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718899,17,'SANTA RITA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1718907,17,'SANTA ROSA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1719004,17,'SANTA TEREZA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720002,17,'SANTA TEREZINHA DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720101,17,'SAO BENTO DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720150,17,'SAO FELIX DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720200,17,'SAO MIGUEL DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720259,17,'SAO SALVADOR DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720309,17,'SAO SEBASTIAO DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720499,17,'SAO VALERIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720655,17,'SILVANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720804,17,'SITIO NOVO DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720853,17,'SUCUPIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720903,17,'TAGUATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720937,17,'TAIPAS DO TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1720978,17,'TALISMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1721000,17,'PALMAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1721109,17,'TOCANTINIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1721208,17,'TOCANTINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1721257,17,'TUPIRAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1721307,17,'TUPIRATINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1722081,17,'WANDERLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (1722107,17,'XAMBIOA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100055,21,'AÇAILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100105,21,'AFONSO CUNHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100154,21,'AGUA DOCE DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100204,21,'ALCANTARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100303,21,'ALDEIAS ALTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100402,21,'ALTAMIRA DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100436,21,'ALTO ALEGRE DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100477,21,'ALTO ALEGRE DO PINDARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100501,21,'ALTO PARNAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100550,21,'AMAPA DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100600,21,'AMARANTE DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100709,21,'ANAJATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100808,21,'ANAPURUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100832,21,'APICUM-AÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100873,21,'ARAGUANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100907,21,'ARAIOSES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2100956,21,'ARAME',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101004,21,'ARARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101103,21,'AXIXA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101202,21,'BACABAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101251,21,'BACABEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101301,21,'BACURI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101350,21,'BACURITUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101400,21,'BALSAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101509,21,'BARAO DE GRAJAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101608,21,'BARRA DO CORDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101707,21,'BARREIRINHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101731,21,'BELAGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101772,21,'BELA VISTA DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101806,21,'BENEDITO LEITE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101905,21,'BEQUIMAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101939,21,'BERNARDO DO MEARIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2101970,21,'BOA VISTA DO GURUPI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102002,21,'BOM JARDIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102036,21,'BOM JESUS DAS SELVAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102077,21,'BOM LUGAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102101,21,'BREJO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102150,21,'BREJO DE AREIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102200,21,'BURITI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102309,21,'BURITI BRAVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102325,21,'BURITICUPU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102358,21,'BURITIRANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102374,21,'CACHOEIRA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102408,21,'CAJAPIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102507,21,'CAJARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102556,21,'CAMPESTRE DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102606,21,'CANDIDO MENDES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102705,21,'CANTANHEDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102754,21,'CAPINZAL DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102804,21,'CAROLINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2102903,21,'CARUTAPERA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103000,21,'CAXIAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103109,21,'CEDRAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103125,21,'CENTRAL DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103158,21,'CENTRO DO GUILHERME',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103174,21,'CENTRO NOVO DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103208,21,'CHAPADINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103257,21,'CIDELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103307,21,'CODO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103406,21,'COELHO NETO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103505,21,'COLINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103554,21,'CONCEIÇAO DO LAGO-AÇU',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103604,21,'COROATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103703,21,'CURURUPU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103752,21,'DAVINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103802,21,'DOM PEDRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2103901,21,'DUQUE BACELAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104008,21,'ESPERANTINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104057,21,'ESTREITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104073,21,'FEIRA NOVA DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104081,21,'FERNANDO FALCAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104099,21,'FORMOSA DA SERRA NEGRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104107,21,'FORTALEZA DOS NOGUEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104206,21,'FORTUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104305,21,'GODOFREDO VIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104404,21,'GONÇALVES DIAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104503,21,'GOVERNADOR ARCHER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104552,21,'GOVERNADOR EDISON LOBAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104602,21,'GOVERNADOR EUGENIO BARROS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104628,21,'GOVERNADOR LUIZ ROCHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104651,21,'GOVERNADOR NEWTON BELLO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104677,21,'GOVERNADOR NUNES FREIRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104701,21,'GRAÇA ARANHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104800,21,'GRAJAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2104909,21,'GUIMARAES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105005,21,'HUMBERTO DE CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105104,21,'ICATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105153,21,'IGARAPE DO MEIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105203,21,'IGARAPE GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105302,21,'IMPERATRIZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105351,21,'ITAIPAVA DO GRAJAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105401,21,'ITAPECURU MIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105427,21,'ITINGA DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105450,21,'JATOBA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105476,21,'JENIPAPO DOS VIEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105500,21,'JOAO LISBOA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105609,21,'JOSELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105658,21,'JUNCO DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105708,21,'LAGO DA PEDRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105807,21,'LAGO DO JUNCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105906,21,'LAGO VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105922,21,'LAGOA DO MATO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105948,21,'LAGO DOS RODRIGUES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105963,21,'LAGOA GRANDE DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2105989,21,'LAJEADO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106003,21,'LIMA CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106102,21,'LORETO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106201,21,'LUIS DOMINGUES',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106300,21,'MAGALHAES DE ALMEIDA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106326,21,'MARACAÇUME',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106359,21,'MARAJA DO SENA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106375,21,'MARANHAOZINHO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106409,21,'MATA ROMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106508,21,'MATINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106607,21,'MATOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106631,21,'MATOES DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106672,21,'MILAGRES DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106706,21,'MIRADOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106755,21,'MIRANDA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106805,21,'MIRINZAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2106904,21,'MONÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107001,21,'MONTES ALTOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107100,21,'MORROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107209,21,'NINA RODRIGUES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107258,21,'NOVA COLINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107308,21,'NOVA IORQUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107357,21,'NOVA OLINDA DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107407,21,'OLHO D''AGUA DAS CUNHAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107456,21,'OLINDA NOVA DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107506,21,'PAÇO DO LUMIAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107605,21,'PALMEIRANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107704,21,'PARAIBANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107803,21,'PARNARAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2107902,21,'PASSAGEM FRANCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108009,21,'PASTOS BONS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108058,21,'PAULINO NEVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108108,21,'PAULO RAMOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108207,21,'PEDREIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108256,21,'PEDRO DO ROSARIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108306,21,'PENALVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108405,21,'PERI MIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108454,21,'PERITORO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108504,21,'PINDARE-MIRIM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108603,21,'PINHEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108702,21,'PIO XII',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108801,21,'PIRAPEMAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2108900,21,'POÇAO DE PEDRAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109007,21,'PORTO FRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109056,21,'PORTO RICO DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109106,21,'PRESIDENTE DUTRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109205,21,'PRESIDENTE JUSCELINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109239,21,'PRESIDENTE MEDICI',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109270,21,'PRESIDENTE SARNEY',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109304,21,'PRESIDENTE VARGAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109403,21,'PRIMEIRA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109452,21,'RAPOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109502,21,'RIACHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109551,21,'RIBAMAR FIQUENE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109601,21,'ROSARIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109700,21,'SAMBAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109759,21,'SANTA FILOMENA DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109809,21,'SANTA HELENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2109908,21,'SANTA INES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110005,21,'SANTA LUZIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110039,21,'SANTA LUZIA DO PARUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110104,21,'SANTA QUITERIA DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110203,21,'SANTA RITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110237,21,'SANTANA DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110278,21,'SANTO AMARO DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110302,21,'SANTO ANTONIO DOS LOPES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110401,21,'SAO BENEDITO DO RIO PRETO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110500,21,'SAO BENTO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110609,21,'SAO BERNARDO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110658,21,'SAO DOMINGOS DO AZEITAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110708,21,'SAO DOMINGOS DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110807,21,'SAO FELIX DE BALSAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110856,21,'SAO FRANCISCO DO BREJAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2110906,21,'SAO FRANCISCO DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111003,21,'SAO JOAO BATISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111029,21,'SAO JOAO DO CARU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111052,21,'SAO JOAO DO PARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111078,21,'SAO JOAO DO SOTER',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111102,21,'SAO JOAO DOS PATOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111201,21,'SAO JOSE DE RIBAMAR',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111250,21,'SAO JOSE DOS BASILIOS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111300,21,'SAO LUIS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111409,21,'SAO LUIS GONZAGA DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111508,21,'SAO MATEUS DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111532,21,'SAO PEDRO DA AGUA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111573,21,'SAO PEDRO DOS CRENTES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111607,21,'SAO RAIMUNDO DAS MANGABEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111631,21,'SAO RAIMUNDO DO DOCA BEZERRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111672,21,'SAO ROBERTO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111706,21,'SAO VICENTE FERRER',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111722,21,'SATUBINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111748,21,'SENADOR ALEXANDRE COSTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111763,21,'SENADOR LA ROCQUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111789,21,'SERRANO DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111805,21,'SITIO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111904,21,'SUCUPIRA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2111953,21,'SUCUPIRA DO RIACHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112001,21,'TASSO FRAGOSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112100,21,'TIMBIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112209,21,'TIMON',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112233,21,'TRIZIDELA DO VALE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112274,21,'TUFILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112308,21,'TUNTUM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112407,21,'TURIAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112456,21,'TURILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112506,21,'TUTOIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112605,21,'URBANO SANTOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112704,21,'VARGEM GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112803,21,'VIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112852,21,'VILA NOVA DOS MARTIRIOS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2112902,21,'VITORIA DO MEARIM',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2113009,21,'VITORINO FREIRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2114007,21,'ZE DOCA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200053,22,'ACAUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200103,22,'AGRICOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200202,22,'AGUA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200251,22,'ALAGOINHA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200277,22,'ALEGRETE DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200301,22,'ALTO LONGA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200400,22,'ALTOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200459,22,'ALVORADA DO GURGUEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200509,22,'AMARANTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200608,22,'ANGICAL DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200707,22,'ANISIO DE ABREU',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200806,22,'ANTONIO ALMEIDA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200905,22,'AROAZES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2200954,22,'AROEIRAS DO ITAIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201002,22,'ARRAIAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201051,22,'ASSUNÇAO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201101,22,'AVELINO LOPES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201150,22,'BAIXA GRANDE DO RIBEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201176,22,'BARRA D''ALCANTARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201200,22,'BARRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201309,22,'BARREIRAS DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201408,22,'BARRO DURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201507,22,'BATALHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201556,22,'BELA VISTA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201572,22,'BELEM DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201606,22,'BENEDITINOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201705,22,'BERTOLINIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201739,22,'BETANIA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201770,22,'BOA HORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201804,22,'BOCAINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201903,22,'BOM JESUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201919,22,'BOM PRINCIPIO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201929,22,'BONFIM DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201945,22,'BOQUEIRAO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201960,22,'BRASILEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2201988,22,'BREJO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202000,22,'BURITI DOS LOPES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202026,22,'BURITI DOS MONTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202059,22,'CABECEIRAS DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202075,22,'CAJAZEIRAS DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202083,22,'CAJUEIRO DA PRAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202091,22,'CALDEIRAO GRANDE DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202109,22,'CAMPINAS DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202117,22,'CAMPO ALEGRE DO FIDALGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202133,22,'CAMPO GRANDE DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202174,22,'CAMPO LARGO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202208,22,'CAMPO MAIOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202251,22,'CANAVIEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202307,22,'CANTO DO BURITI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202406,22,'CAPITAO DE CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202455,22,'CAPITAO GERVASIO OLIVEIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202505,22,'CARACOL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202539,22,'CARAUBAS DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202554,22,'CARIDADE DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202604,22,'CASTELO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202653,22,'CAXINGO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202703,22,'COCAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202711,22,'COCAL DE TELHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202729,22,'COCAL DOS ALVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202737,22,'COIVARAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202752,22,'COLONIA DO GURGUEIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202778,22,'COLONIA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202802,22,'CONCEIÇAO DO CANINDE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202851,22,'CORONEL JOSE DIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2202901,22,'CORRENTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203008,22,'CRISTALANDIA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203107,22,'CRISTINO CASTRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203206,22,'CURIMATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203230,22,'CURRAIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203255,22,'CURRALINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203271,22,'CURRAL NOVO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203305,22,'DEMERVAL LOBAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203354,22,'DIRCEU ARCOVERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203404,22,'DOM EXPEDITO LOPES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203420,22,'DOMINGOS MOURAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203453,22,'DOM INOCENCIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203503,22,'ELESBAO VELOSO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203602,22,'ELISEU MARTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203701,22,'ESPERANTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203750,22,'FARTURA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203800,22,'FLORES DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203859,22,'FLORESTA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2203909,22,'FLORIANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204006,22,'FRANCINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204105,22,'FRANCISCO AYRES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204154,22,'FRANCISCO MACEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204204,22,'FRANCISCO SANTOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204303,22,'FRONTEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204352,22,'GEMINIANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204402,22,'GILBUES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204501,22,'GUADALUPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204550,22,'GUARIBAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204600,22,'HUGO NAPOLEAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204659,22,'ILHA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204709,22,'INHUMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204808,22,'IPIRANGA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2204907,22,'ISAIAS COELHO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205003,22,'ITAINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205102,22,'ITAUEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205151,22,'JACOBINA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205201,22,'JAICOS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205250,22,'JARDIM DO MULATO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205276,22,'JATOBA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205300,22,'JERUMENHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205359,22,'JOAO COSTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205409,22,'JOAQUIM PIRES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205458,22,'JOCA MARQUES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205508,22,'JOSE DE FREITAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205516,22,'JUAZEIRO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205524,22,'JULIO BORGES',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205532,22,'JUREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205540,22,'LAGOINHA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205557,22,'LAGOA ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205565,22,'LAGOA DO BARRO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205573,22,'LAGOA DE SAO FRANCISCO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205581,22,'LAGOA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205599,22,'LAGOA DO SITIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205607,22,'LANDRI SALES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205706,22,'LUIS CORREIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205805,22,'LUZILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205854,22,'MADEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205904,22,'MANOEL EMIDIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2205953,22,'MARCOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206001,22,'MARCOS PARENTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206050,22,'MASSAPE DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206100,22,'MATIAS OLIMPIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206209,22,'MIGUEL ALVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206308,22,'MIGUEL LEAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206357,22,'MILTON BRANDAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206407,22,'MONSENHOR GIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206506,22,'MONSENHOR HIPOLITO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206605,22,'MONTE ALEGRE DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206654,22,'MORRO CABEÇA NO TEMPO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206670,22,'MORRO DO CHAPEU DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206696,22,'MURICI DOS PORTELAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206704,22,'NAZARE DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206720,22,'NAZARIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206753,22,'NOSSA SENHORA DE NAZARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206803,22,'NOSSA SENHORA DOS REMEDIOS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206902,22,'NOVO ORIENTE DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2206951,22,'NOVO SANTO ANTONIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207009,22,'OEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207108,22,'OLHO D''AGUA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207207,22,'PADRE MARCOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207306,22,'PAES LANDIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207355,22,'PAJEU DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207405,22,'PALMEIRA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207504,22,'PALMEIRAIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207553,22,'PAQUETA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207603,22,'PARNAGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207702,22,'PARNAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207751,22,'PASSAGEM FRANCA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207777,22,'PATOS DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207793,22,'PAU D''ARCO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207801,22,'PAULISTANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207850,22,'PAVUSSU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207900,22,'PEDRO II',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207934,22,'PEDRO LAURENTINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2207959,22,'NOVA SANTA RITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208007,22,'PICOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208106,22,'PIMENTEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208205,22,'PIO IX',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208304,22,'PIRACURUCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208403,22,'PIRIPIRI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208502,22,'PORTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208551,22,'PORTO ALEGRE DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208601,22,'PRATA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208650,22,'QUEIMADA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208700,22,'REDENÇAO DO GURGUEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208809,22,'REGENERAÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208858,22,'RIACHO FRIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208874,22,'RIBEIRA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2208908,22,'RIBEIRO GONÇALVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209005,22,'RIO GRANDE DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209104,22,'SANTA CRUZ DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209153,22,'SANTA CRUZ DOS MILAGRES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209203,22,'SANTA FILOMENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209302,22,'SANTA LUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209351,22,'SANTANA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209377,22,'SANTA ROSA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209401,22,'SANTO ANTONIO DE LISBOA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209450,22,'SANTO ANTONIO DOS MILAGRES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209500,22,'SANTO INACIO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209559,22,'SAO BRAZ DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209609,22,'SAO FELIX DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209658,22,'SAO FRANCISCO DE ASSIS DO PIAU',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209708,22,'SAO FRANCISCO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209757,22,'SAO GONÇALO DO GURGUEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209807,22,'SAO GONÇALO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209856,22,'SAO JOAO DA CANABRAVA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209872,22,'SAO JOAO DA FRONTEIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209906,22,'SAO JOAO DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209955,22,'SAO JOAO DA VARJOTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2209971,22,'SAO JOAO DO ARRAIAL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210003,22,'SAO JOAO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210052,22,'SAO JOSE DO DIVINO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210102,22,'SAO JOSE DO PEIXE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210201,22,'SAO JOSE DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210300,22,'SAO JULIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210359,22,'SAO LOURENÇO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210375,22,'SAO LUIS DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210383,22,'SAO MIGUEL DA BAIXA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210391,22,'SAO MIGUEL DO FIDALGO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210409,22,'SAO MIGUEL DO TAPUIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210508,22,'SAO PEDRO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210607,22,'SAO RAIMUNDO NONATO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210623,22,'SEBASTIAO BARROS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210631,22,'SEBASTIAO LEAL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210656,22,'SIGEFREDO PACHECO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210706,22,'SIMOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210805,22,'SIMPLICIO MENDES',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210904,22,'SOCORRO DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210938,22,'SUSSUAPARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210953,22,'TAMBORIL DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2210979,22,'TANQUE DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2211001,22,'TERESINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2211100,22,'UNIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2211209,22,'URUÇUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2211308,22,'VALENÇA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2211357,22,'VARZEA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2211407,22,'VARZEA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2211506,22,'VERA MENDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2211605,22,'VILA NOVA DO PIAUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2211704,22,'WALL FERRAZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2300101,23,'ABAIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2300150,23,'ACARAPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2300200,23,'ACARAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2300309,23,'ACOPIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2300408,23,'AIUABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2300507,23,'ALCANTARAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2300606,23,'ALTANEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2300705,23,'ALTO SANTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2300754,23,'AMONTADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2300804,23,'ANTONINA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2300903,23,'APUIARES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301000,23,'AQUIRAZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301109,23,'ARACATI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301208,23,'ARACOIABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301257,23,'ARARENDA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301307,23,'ARARIPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301406,23,'ARATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301505,23,'ARNEIROZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301604,23,'ASSARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301703,23,'AURORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301802,23,'BAIXIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301851,23,'BANABUIU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301901,23,'BARBALHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2301950,23,'BARREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2302008,23,'BARRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2302057,23,'BARROQUINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2302107,23,'BATURITE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2302206,23,'BEBERIBE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2302305,23,'BELA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2302404,23,'BOA VIAGEM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2302503,23,'BREJO SANTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2302602,23,'CAMOCIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2302701,23,'CAMPOS SALES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2302800,23,'CANINDE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2302909,23,'CAPISTRANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303006,23,'CARIDADE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303105,23,'CARIRE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303204,23,'CARIRIAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303303,23,'CARIUS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303402,23,'CARNAUBAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303501,23,'CASCAVEL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303600,23,'CATARINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303659,23,'CATUNDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303709,23,'CAUCAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303808,23,'CEDRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303907,23,'CHAVAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303931,23,'CHORO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2303956,23,'CHOROZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304004,23,'COREAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304103,23,'CRATEUS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304202,23,'CRATO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304236,23,'CROATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304251,23,'CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304269,23,'DEPUTADO IRAPUAN PINHEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304277,23,'ERERE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304285,23,'EUSEBIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304301,23,'FARIAS BRITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304350,23,'FORQUILHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304400,23,'FORTALEZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304459,23,'FORTIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304509,23,'FRECHEIRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304608,23,'GENERAL SAMPAIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304657,23,'GRAÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304707,23,'GRANJA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304806,23,'GRANJEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304905,23,'GROAIRAS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2304954,23,'GUAIUBA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305001,23,'GUARACIABA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305100,23,'GUARAMIRANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305209,23,'HIDROLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305233,23,'HORIZONTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305266,23,'IBARETAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305308,23,'IBIAPINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305332,23,'IBICUITINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305357,23,'ICAPUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305407,23,'ICO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305506,23,'IGUATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305605,23,'INDEPENDENCIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305654,23,'IPAPORANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305704,23,'IPAUMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305803,23,'IPU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2305902,23,'IPUEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2306009,23,'IRACEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2306108,23,'IRAUÇUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2306207,23,'ITAIÇABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2306256,23,'ITAITINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2306306,23,'ITAPAGE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2306405,23,'ITAPIPOCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2306504,23,'ITAPIUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2306553,23,'ITAREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2306603,23,'ITATIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2306702,23,'JAGUARETAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2306801,23,'JAGUARIBARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2306900,23,'JAGUARIBE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307007,23,'JAGUARUANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307106,23,'JARDIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307205,23,'JATI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307254,23,'JIJOCA DE JERICOACOARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307304,23,'JUAZEIRO DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307403,23,'JUCAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307502,23,'LAVRAS DA MANGABEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307601,23,'LIMOEIRO DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307635,23,'MADALENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307650,23,'MARACANAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307700,23,'MARANGUAPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307809,23,'MARCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2307908,23,'MARTINOPOLE',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2308005,23,'MASSAPE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2308104,23,'MAURITI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2308203,23,'MERUOCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2308302,23,'MILAGRES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2308351,23,'MILHA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2308377,23,'MIRAIMA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2308401,23,'MISSAO VELHA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2308500,23,'MOMBAÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2308609,23,'MONSENHOR TABOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2308708,23,'MORADA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2308807,23,'MORAUJO',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2308906,23,'MORRINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2309003,23,'MUCAMBO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2309102,23,'MULUNGU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2309201,23,'NOVA OLINDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2309300,23,'NOVA RUSSAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2309409,23,'NOVO ORIENTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2309458,23,'OCARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2309508,23,'OROS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2309607,23,'PACAJUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2309706,23,'PACATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2309805,23,'PACOTI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2309904,23,'PACUJA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310001,23,'PALHANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310100,23,'PALMACIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310209,23,'PARACURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310258,23,'PARAIPABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310308,23,'PARAMBU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310407,23,'PARAMOTI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310506,23,'PEDRA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310605,23,'PENAFORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310704,23,'PENTECOSTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310803,23,'PEREIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310852,23,'PINDORETAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310902,23,'PIQUET CARNEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2310951,23,'PIRES FERREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311009,23,'PORANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311108,23,'PORTEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311207,23,'POTENGI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311231,23,'POTIRETAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311264,23,'QUITERIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311306,23,'QUIXADA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311355,23,'QUIXELO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311405,23,'QUIXERAMOBIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311504,23,'QUIXERE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311603,23,'REDENÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311702,23,'RERIUTABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311801,23,'RUSSAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311900,23,'SABOEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2311959,23,'SALITRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2312007,23,'SANTANA DO ACARAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2312106,23,'SANTANA DO CARIRI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2312205,23,'SANTA QUITERIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2312304,23,'SAO BENEDITO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2312403,23,'SAO GONÇALO DO AMARANTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2312502,23,'SAO JOAO DO JAGUARIBE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2312601,23,'SAO LUIS DO CURU',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2312700,23,'SENADOR POMPEU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2312809,23,'SENADOR SA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2312908,23,'SOBRAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313005,23,'SOLONOPOLE',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313104,23,'TABULEIRO DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313203,23,'TAMBORIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313252,23,'TARRAFAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313302,23,'TAUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313351,23,'TEJUÇUOCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313401,23,'TIANGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313500,23,'TRAIRI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313559,23,'TURURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313609,23,'UBAJARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313708,23,'UMARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313757,23,'UMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313807,23,'URUBURETAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313906,23,'URUOCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2313955,23,'VARJOTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2314003,23,'VARZEA ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2314102,23,'VIÇOSA DO CEARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2400109,24,'ACARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2400208,24,'AÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2400307,24,'AFONSO BEZERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2400406,24,'AGUA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2400505,24,'ALEXANDRIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2400604,24,'ALMINO AFONSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2400703,24,'ALTO DO RODRIGUES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2400802,24,'ANGICOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2400901,24,'ANTONIO MARTINS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401008,24,'APODI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401107,24,'AREIA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401206,24,'ARES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401305,24,'AUGUSTO SEVERO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401404,24,'BAIA FORMOSA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401453,24,'BARAUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401503,24,'BARCELONA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401602,24,'BENTO FERNANDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401651,24,'BODO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401701,24,'BOM JESUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401800,24,'BREJINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401859,24,'CAIÇARA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2401909,24,'CAIÇARA DO RIO DO VENTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2402006,24,'CAICO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2402105,24,'CAMPO REDONDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2402204,24,'CANGUARETAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2402303,24,'CARAUBAS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2402402,24,'CARNAUBA DOS DANTAS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2402501,24,'CARNAUBAIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2402600,24,'CEARA-MIRIM',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2402709,24,'CERRO CORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2402808,24,'CORONEL EZEQUIEL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2402907,24,'CORONEL JOAO PESSOA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2403004,24,'CRUZETA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2403103,24,'CURRAIS NOVOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2403202,24,'DOUTOR SEVERIANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2403251,24,'PARNAMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2403301,24,'ENCANTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2403400,24,'EQUADOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2403509,24,'ESPIRITO SANTO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2403608,24,'EXTREMOZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2403707,24,'FELIPE GUERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2403756,24,'FERNANDO PEDROZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2403806,24,'FLORANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2403905,24,'FRANCISCO DANTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2404002,24,'FRUTUOSO GOMES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2404101,24,'GALINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2404200,24,'GOIANINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2404309,24,'GOVERNADOR DIX-SEPT ROSADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2404408,24,'GROSSOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2404507,24,'GUAMARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2404606,24,'IELMO MARINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2404705,24,'IPANGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2404804,24,'IPUEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2404853,24,'ITAJA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2404903,24,'ITAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2405009,24,'JAÇANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2405108,24,'JANDAIRA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2405207,24,'JANDUIS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2405306,24,'JANUARIO CICCO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2405405,24,'JAPI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2405504,24,'JARDIM DE ANGICOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2405603,24,'JARDIM DE PIRANHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2405702,24,'JARDIM DO SERIDO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2405801,24,'JOAO CAMARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2405900,24,'JOAO DIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2406007,24,'JOSE DA PENHA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2406106,24,'JUCURUTU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2406155,24,'JUNDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2406205,24,'LAGOA D''ANTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2406304,24,'LAGOA DE PEDRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2406403,24,'LAGOA DE VELHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2406502,24,'LAGOA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2406601,24,'LAGOA SALGADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2406700,24,'LAJES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2406809,24,'LAJES PINTADAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2406908,24,'LUCRECIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2407005,24,'LUIS GOMES',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2407104,24,'MACAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2407203,24,'MACAU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2407252,24,'MAJOR SALES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2407302,24,'MARCELINO VIEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2407401,24,'MARTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2407500,24,'MAXARANGUAPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2407609,24,'MESSIAS TARGINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2407708,24,'MONTANHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2407807,24,'MONTE ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2407906,24,'MONTE DAS GAMELEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2408003,24,'MOSSORO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2408102,24,'NATAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2408201,24,'NISIA FLORESTA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2408300,24,'NOVA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2408409,24,'OLHO-D''AGUA DO BORGES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2408508,24,'OURO BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2408607,24,'PARANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2408706,24,'PARAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2408805,24,'PARAZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2408904,24,'PARELHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2408953,24,'RIO DO FOGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2409100,24,'PASSA E FICA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2409209,24,'PASSAGEM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2409308,24,'PATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2409332,24,'SANTA MARIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2409407,24,'PAU DOS FERROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2409506,24,'PEDRA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2409605,24,'PEDRA PRETA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2409704,24,'PEDRO AVELINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2409803,24,'PEDRO VELHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2409902,24,'PENDENCIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2410009,24,'PILOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2410108,24,'POÇO BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2410207,24,'PORTALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2410256,24,'PORTO DO MANGUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2410306,24,'SERRA CAIADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2410405,24,'PUREZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2410504,24,'RAFAEL FERNANDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2410603,24,'RAFAEL GODEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2410702,24,'RIACHO DA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2410801,24,'RIACHO DE SANTANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2410900,24,'RIACHUELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2411007,24,'RODOLFO FERNANDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2411056,24,'TIBAU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2411106,24,'RUY BARBOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2411205,24,'SANTA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2411403,24,'SANTANA DO MATOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2411429,24,'SANTANA DO SERIDO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2411502,24,'SANTO ANTONIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2411601,24,'SAO BENTO DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2411700,24,'SAO BENTO DO TRAIRI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2411809,24,'SAO FERNANDO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2411908,24,'SAO FRANCISCO DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2412005,24,'SAO GONÇALO DO AMARANTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2412104,24,'SAO JOAO DO SABUGI',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2412203,24,'SAO JOSE DE MIPIBU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2412302,24,'SAO JOSE DO CAMPESTRE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2412401,24,'SAO JOSE DO SERIDO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2412500,24,'SAO MIGUEL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2412559,24,'SAO MIGUEL DO GOSTOSO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2412609,24,'SAO PAULO DO POTENGI',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2412708,24,'SAO PEDRO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2412807,24,'SAO RAFAEL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2412906,24,'SAO TOME',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2413003,24,'SAO VICENTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2413102,24,'SENADOR ELOI DE SOUZA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2413201,24,'SENADOR GEORGINO AVELINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2413300,24,'SERRA DE SAO BENTO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2413359,24,'SERRA DO MEL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2413409,24,'SERRA NEGRA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2413508,24,'SERRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2413557,24,'SERRINHA DOS PINTOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2413607,24,'SEVERIANO MELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2413706,24,'SITIO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2413805,24,'TABOLEIRO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2413904,24,'TAIPU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414001,24,'TANGARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414100,24,'TENENTE ANANIAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414159,24,'TENENTE LAURENTINO CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414209,24,'TIBAU DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414308,24,'TIMBAUBA DOS BATISTAS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414407,24,'TOUROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414456,24,'TRIUNFO POTIGUAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414506,24,'UMARIZAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414605,24,'UPANEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414704,24,'VARZEA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414753,24,'VENHA-VER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414803,24,'VERA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2414902,24,'VIÇOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2415008,24,'VILA FLOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500106,25,'AGUA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500205,25,'AGUIAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500304,25,'ALAGOA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500403,25,'ALAGOA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500502,25,'ALAGOINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500536,25,'ALCANTIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500577,25,'ALGODAO DE JANDAIRA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500601,25,'ALHANDRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500700,25,'SAO JOAO DO RIO DO PEIXE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500734,25,'AMPARO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500775,25,'APARECIDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500809,25,'ARAÇAGI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2500908,25,'ARARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501005,25,'ARARUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501104,25,'AREIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501153,25,'AREIA DE BARAUNAS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501203,25,'AREIAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501302,25,'AROEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501351,25,'ASSUNÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501401,25,'BAIA DA TRAIÇAO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501500,25,'BANANEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501534,25,'BARAUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501575,25,'BARRA DE SANTANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501609,25,'BARRA DE SANTA ROSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501708,25,'BARRA DE SAO MIGUEL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501807,25,'BAYEUX',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2501906,25,'BELEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2502003,25,'BELEM DO BREJO DO CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2502052,25,'BERNARDINO BATISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2502102,25,'BOA VENTURA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2502151,25,'BOA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2502201,25,'BOM JESUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2502300,25,'BOM SUCESSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2502409,25,'BONITO DE SANTA FE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2502508,25,'BOQUEIRAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2502607,25,'IGARACY',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2502706,25,'BORBOREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2502805,25,'BREJO DO CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2502904,25,'BREJO DOS SANTOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2503001,25,'CAAPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2503100,25,'CABACEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2503209,25,'CABEDELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2503308,25,'CACHOEIRA DOS INDIOS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2503407,25,'CACIMBA DE AREIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2503506,25,'CACIMBA DE DENTRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2503555,25,'CACIMBAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2503605,25,'CAIÇARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2503704,25,'CAJAZEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2503753,25,'CAJAZEIRINHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2503803,25,'CALDAS BRANDAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2503902,25,'CAMALAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504009,25,'CAMPINA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504033,25,'CAPIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504074,25,'CARAUBAS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504108,25,'CARRAPATEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504157,25,'CASSERENGUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504207,25,'CATINGUEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504306,25,'CATOLE DO ROCHA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504355,25,'CATURITE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504405,25,'CONCEIÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504504,25,'CONDADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504603,25,'CONDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504702,25,'CONGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504801,25,'COREMAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504850,25,'COXIXOLA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2504900,25,'CRUZ DO ESPIRITO SANTO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505006,25,'CUBATI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505105,25,'CUITE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505204,25,'CUITEGI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505238,25,'CUITE DE MAMANGUAPE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505279,25,'CURRAL DE CIMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505303,25,'CURRAL VELHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505352,25,'DAMIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505402,25,'DESTERRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505501,25,'VISTA SERRANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505600,25,'DIAMANTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505709,25,'DONA INES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505808,25,'DUAS ESTRADAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2505907,25,'EMAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2506004,25,'ESPERANÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2506103,25,'FAGUNDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2506202,25,'FREI MARTINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2506251,25,'GADO BRAVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2506301,25,'GUARABIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2506400,25,'GURINHEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2506509,25,'GURJAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2506608,25,'IBIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2506707,25,'IMACULADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2506806,25,'INGA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2506905,25,'ITABAIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2507002,25,'ITAPORANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2507101,25,'ITAPOROROCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2507200,25,'ITATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2507309,25,'JACARAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2507408,25,'JERICO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2507507,25,'JOAO PESSOA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2507606,25,'JUAREZ TAVORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2507705,25,'JUAZEIRINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2507804,25,'JUNCO DO SERIDO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2507903,25,'JURIPIRANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2508000,25,'JURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2508109,25,'LAGOA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2508208,25,'LAGOA DE DENTRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2508307,25,'LAGOA SECA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2508406,25,'LASTRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2508505,25,'LIVRAMENTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2508554,25,'LOGRADOURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2508604,25,'LUCENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2508703,25,'MAE D''AGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2508802,25,'MALTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2508901,25,'MAMANGUAPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509008,25,'MANAIRA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509057,25,'MARCAÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509107,25,'MARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509156,25,'MARIZOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509206,25,'MASSARANDUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509305,25,'MATARACA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509339,25,'MATINHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509370,25,'MATO GROSSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509396,25,'MATUREIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509404,25,'MOGEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509503,25,'MONTADAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509602,25,'MONTE HOREBE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509701,25,'MONTEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509800,25,'MULUNGU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2509909,25,'NATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2510006,25,'NAZAREZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2510105,25,'NOVA FLORESTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2510204,25,'NOVA OLINDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2510303,25,'NOVA PALMEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2510402,25,'OLHO D''AGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2510501,25,'OLIVEDOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2510600,25,'OURO VELHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2510659,25,'PARARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2510709,25,'PASSAGEM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2510808,25,'PATOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2510907,25,'PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2511004,25,'PEDRA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2511103,25,'PEDRA LAVRADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2511202,25,'PEDRAS DE FOGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2511301,25,'PIANCO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2511400,25,'PICUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2511509,25,'PILAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2511608,25,'PILOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2511707,25,'PILOEZINHOS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2511806,25,'PIRPIRITUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2511905,25,'PITIMBU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512002,25,'POCINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512036,25,'POÇO DANTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512077,25,'POÇO DE JOSE DE MOURA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512101,25,'POMBAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512200,25,'PRATA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512309,25,'PRINCESA ISABEL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512408,25,'PUXINANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512507,25,'QUEIMADAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512606,25,'QUIXABA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512705,25,'REMIGIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512721,25,'PEDRO REGIS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512747,25,'RIACHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512754,25,'RIACHAO DO BACAMARTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512762,25,'RIACHAO DO POÇO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512788,25,'RIACHO DE SANTO ANTONIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512804,25,'RIACHO DOS CAVALOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2512903,25,'RIO TINTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513000,25,'SALGADINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513109,25,'SALGADO DE SAO FELIX',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513158,25,'SANTA CECILIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513208,25,'SANTA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513307,25,'SANTA HELENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513356,25,'SANTA INES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513406,25,'SANTA LUZIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513505,25,'SANTANA DE MANGUEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513604,25,'SANTANA DOS GARROTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513653,25,'JOCA CLAUDINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513703,25,'SANTA RITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513802,25,'SANTA TERESINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513851,25,'SANTO ANDRE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513901,25,'SAO BENTO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513927,25,'SAO BENTINHO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513943,25,'SAO DOMINGOS DO CARIRI',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513968,25,'SAO DOMINGOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2513984,25,'SAO FRANCISCO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514008,25,'SAO JOAO DO CARIRI',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514107,25,'SAO JOAO DO TIGRE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514206,25,'SAO JOSE DA LAGOA TAPADA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514305,25,'SAO JOSE DE CAIANA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514404,25,'SAO JOSE DE ESPINHARAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514453,25,'SAO JOSE DOS RAMOS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514503,25,'SAO JOSE DE PIRANHAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514552,25,'SAO JOSE DE PRINCESA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514602,25,'SAO JOSE DO BONFIM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514651,25,'SAO JOSE DO BREJO DO CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514701,25,'SAO JOSE DO SABUGI',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514800,25,'SAO JOSE DOS CORDEIROS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2514909,25,'SAO MAMEDE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2515005,25,'SAO MIGUEL DE TAIPU',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2515104,25,'SAO SEBASTIAO DE LAGOA DE ROÇA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2515203,25,'SAO SEBASTIAO DO UMBUZEIRO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2515302,25,'SAPE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2515401,25,'SAO VICENTE DO SERIDO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2515500,25,'SERRA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2515609,25,'SERRA DA RAIZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2515708,25,'SERRA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2515807,25,'SERRA REDONDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2515906,25,'SERRARIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2515930,25,'SERTAOZINHO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2515971,25,'SOBRADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2516003,25,'SOLANEA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2516102,25,'SOLEDADE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2516151,25,'SOSSEGO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2516201,25,'SOUSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2516300,25,'SUME',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2516409,25,'TACIMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2516508,25,'TAPEROA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2516607,25,'TAVARES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2516706,25,'TEIXEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2516755,25,'TENORIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2516805,25,'TRIUNFO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2516904,25,'UIRAUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2517001,25,'UMBUZEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2517100,25,'VARZEA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2517209,25,'VIEIROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2517407,25,'ZABELE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2600054,26,'ABREU E LIMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2600104,26,'AFOGADOS DA INGAZEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2600203,26,'AFRANIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2600302,26,'AGRESTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2600401,26,'AGUA PRETA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2600500,26,'AGUAS BELAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2600609,26,'ALAGOINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2600708,26,'ALIANÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2600807,26,'ALTINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2600906,26,'AMARAJI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2601003,26,'ANGELIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2601052,26,'ARAÇOIABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2601102,26,'ARARIPINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2601201,26,'ARCOVERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2601300,26,'BARRA DE GUABIRABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2601409,26,'BARREIROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2601508,26,'BELEM DE MARIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2601607,26,'BELEM DO SAO FRANCISCO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2601706,26,'BELO JARDIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2601805,26,'BETANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2601904,26,'BEZERROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2602001,26,'BODOCO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2602100,26,'BOM CONSELHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2602209,26,'BOM JARDIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2602308,26,'BONITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2602407,26,'BREJAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2602506,26,'BREJINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2602605,26,'BREJO DA MADRE DE DEUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2602704,26,'BUENOS AIRES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2602803,26,'BUIQUE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2602902,26,'CABO DE SANTO AGOSTINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2603009,26,'CABROBO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2603108,26,'CACHOEIRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2603207,26,'CAETES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2603306,26,'CALÇADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2603405,26,'CALUMBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2603454,26,'CAMARAGIBE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2603504,26,'CAMOCIM DE SAO FELIX',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2603603,26,'CAMUTANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2603702,26,'CANHOTINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2603801,26,'CAPOEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2603900,26,'CARNAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2603926,26,'CARNAUBEIRA DA PENHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2604007,26,'CARPINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2604106,26,'CARUARU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2604155,26,'CASINHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2604205,26,'CATENDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2604304,26,'CEDRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2604403,26,'CHA DE ALEGRIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2604502,26,'CHA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2604601,26,'CONDADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2604700,26,'CORRENTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2604809,26,'CORTES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2604908,26,'CUMARU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2605004,26,'CUPIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2605103,26,'CUSTODIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2605152,26,'DORMENTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2605202,26,'ESCADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2605301,26,'EXU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2605400,26,'FEIRA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2605459,26,'FERNANDO DE NORONHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2605509,26,'FERREIROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2605608,26,'FLORES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2605707,26,'FLORESTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2605806,26,'FREI MIGUELINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2605905,26,'GAMELEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2606002,26,'GARANHUNS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2606101,26,'GLORIA DO GOITA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2606200,26,'GOIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2606309,26,'GRANITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2606408,26,'GRAVATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2606507,26,'IATI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2606606,26,'IBIMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2606705,26,'IBIRAJUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2606804,26,'IGARASSU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2606903,26,'IGUARACY',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607000,26,'INAJA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607109,26,'INGAZEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607208,26,'IPOJUCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607307,26,'IPUBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607406,26,'ITACURUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607505,26,'ITAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607604,26,'ILHA DE ITAMARACA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607653,26,'ITAMBE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607703,26,'ITAPETIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607752,26,'ITAPISSUMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607802,26,'ITAQUITINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607901,26,'JABOATAO DOS GUARARAPES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2607950,26,'JAQUEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608008,26,'JATAUBA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608057,26,'JATOBA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608107,26,'JOAO ALFREDO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608206,26,'JOAQUIM NABUCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608255,26,'JUCATI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608305,26,'JUPI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608404,26,'JUREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608453,26,'LAGOA DO CARRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608503,26,'LAGOA DE ITAENGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608602,26,'LAGOA DO OURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608701,26,'LAGOA DOS GATOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608750,26,'LAGOA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608800,26,'LAJEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2608909,26,'LIMOEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2609006,26,'MACAPARANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2609105,26,'MACHADOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2609154,26,'MANARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2609204,26,'MARAIAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2609303,26,'MIRANDIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2609402,26,'MORENO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2609501,26,'NAZARE DA MATA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2609600,26,'OLINDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2609709,26,'OROBO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2609808,26,'OROCO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2609907,26,'OURICURI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2610004,26,'PALMARES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2610103,26,'PALMEIRINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2610202,26,'PANELAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2610301,26,'PARANATAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2610400,26,'PARNAMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2610509,26,'PASSIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2610608,26,'PAUDALHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2610707,26,'PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2610806,26,'PEDRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2610905,26,'PESQUEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2611002,26,'PETROLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2611101,26,'PETROLINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2611200,26,'POÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2611309,26,'POMBOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2611408,26,'PRIMAVERA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2611507,26,'QUIPAPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2611533,26,'QUIXABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2611606,26,'RECIFE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2611705,26,'RIACHO DAS ALMAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2611804,26,'RIBEIRAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2611903,26,'RIO FORMOSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612000,26,'SAIRE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612109,26,'SALGADINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612208,26,'SALGUEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612307,26,'SALOA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612406,26,'SANHARO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612455,26,'SANTA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612471,26,'SANTA CRUZ DA BAIXA VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612505,26,'SANTA CRUZ DO CAPIBARIBE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612554,26,'SANTA FILOMENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612604,26,'SANTA MARIA DA BOA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612703,26,'SANTA MARIA DO CAMBUCA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612802,26,'SANTA TEREZINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2612901,26,'SAO BENEDITO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2613008,26,'SAO BENTO DO UNA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2613107,26,'SAO CAITANO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2613206,26,'SAO JOAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2613305,26,'SAO JOAQUIM DO MONTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2613404,26,'SAO JOSE DA COROA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2613503,26,'SAO JOSE DO BELMONTE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2613602,26,'SAO JOSE DO EGITO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2613701,26,'SAO LOURENÇO DA MATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2613800,26,'SAO VICENTE FERRER',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2613909,26,'SERRA TALHADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2614006,26,'SERRITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2614105,26,'SERTANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2614204,26,'SIRINHAEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2614303,26,'MOREILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2614402,26,'SOLIDAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2614501,26,'SURUBIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2614600,26,'TABIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2614709,26,'TACAIMBO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2614808,26,'TACARATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2614857,26,'TAMANDARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2615003,26,'TAQUARITINGA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2615102,26,'TEREZINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2615201,26,'TERRA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2615300,26,'TIMBAUBA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2615409,26,'TORITAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2615508,26,'TRACUNHAEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2615607,26,'TRINDADE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2615706,26,'TRIUNFO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2615805,26,'TUPANATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2615904,26,'TUPARETAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2616001,26,'VENTUROSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2616100,26,'VERDEJANTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2616183,26,'VERTENTE DO LERIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2616209,26,'VERTENTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2616308,26,'VICENCIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2616407,26,'VITORIA DE SANTO ANTAO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2616506,26,'XEXEU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2700102,27,'AGUA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2700201,27,'ANADIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2700300,27,'ARAPIRACA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2700409,27,'ATALAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2700508,27,'BARRA DE SANTO ANTONIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2700607,27,'BARRA DE SAO MIGUEL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2700706,27,'BATALHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2700805,27,'BELEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2700904,27,'BELO MONTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2701001,27,'BOCA DA MATA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2701100,27,'BRANQUINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2701209,27,'CACIMBINHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2701308,27,'CAJUEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2701357,27,'CAMPESTRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2701407,27,'CAMPO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2701506,27,'CAMPO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2701605,27,'CANAPI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2701704,27,'CAPELA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2701803,27,'CARNEIROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2701902,27,'CHA PRETA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2702009,27,'COITE DO NOIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2702108,27,'COLONIA LEOPOLDINA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2702207,27,'COQUEIRO SECO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2702306,27,'CORURIPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2702355,27,'CRAIBAS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2702405,27,'DELMIRO GOUVEIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2702504,27,'DOIS RIACHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2702553,27,'ESTRELA DE ALAGOAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2702603,27,'FEIRA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2702702,27,'FELIZ DESERTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2702801,27,'FLEXEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2702900,27,'GIRAU DO PONCIANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2703007,27,'IBATEGUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2703106,27,'IGACI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2703205,27,'IGREJA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2703304,27,'INHAPI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2703403,27,'JACARE DOS HOMENS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2703502,27,'JACUIPE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2703601,27,'JAPARATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2703700,27,'JARAMATAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2703759,27,'JEQUIA DA PRAIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2703809,27,'JOAQUIM GOMES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2703908,27,'JUNDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2704005,27,'JUNQUEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2704104,27,'LAGOA DA CANOA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2704203,27,'LIMOEIRO DE ANADIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2704302,27,'MACEIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2704401,27,'MAJOR ISIDORO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2704500,27,'MARAGOGI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2704609,27,'MARAVILHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2704708,27,'MARECHAL DEODORO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2704807,27,'MARIBONDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2704906,27,'MAR VERMELHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2705002,27,'MATA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2705101,27,'MATRIZ DE CAMARAGIBE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2705200,27,'MESSIAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2705309,27,'MINADOR DO NEGRAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2705408,27,'MONTEIROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2705507,27,'MURICI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2705606,27,'NOVO LINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2705705,27,'OLHO D''AGUA DAS FLORES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2705804,27,'OLHO D''AGUA DO CASADO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2705903,27,'OLHO D''AGUA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2706000,27,'OLIVENÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2706109,27,'OURO BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2706208,27,'PALESTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2706307,27,'PALMEIRA DOS INDIOS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2706406,27,'PAO DE AÇUCAR',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2706422,27,'PARICONHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2706448,27,'PARIPUEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2706505,27,'PASSO DE CAMARAGIBE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2706604,27,'PAULO JACINTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2706703,27,'PENEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2706802,27,'PIAÇABUÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2706901,27,'PILAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2707008,27,'PINDOBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2707107,27,'PIRANHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2707206,27,'POÇO DAS TRINCHEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2707305,27,'PORTO CALVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2707404,27,'PORTO DE PEDRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2707503,27,'PORTO REAL DO COLEGIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2707602,27,'QUEBRANGULO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2707701,27,'RIO LARGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2707800,27,'ROTEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2707909,27,'SANTA LUZIA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2708006,27,'SANTANA DO IPANEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2708105,27,'SANTANA DO MUNDAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2708204,27,'SAO BRAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2708303,27,'SAO JOSE DA LAJE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2708402,27,'SAO JOSE DA TAPERA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2708501,27,'SAO LUIS DO QUITUNDE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2708600,27,'SAO MIGUEL DOS CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2708709,27,'SAO MIGUEL DOS MILAGRES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2708808,27,'SAO SEBASTIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2708907,27,'SATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2708956,27,'SENADOR RUI PALMEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2709004,27,'TANQUE D''ARCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2709103,27,'TAQUARANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2709152,27,'TEOTONIO VILELA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2709202,27,'TRAIPU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2709301,27,'UNIAO DOS PALMARES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2709400,27,'VIÇOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2800100,28,'AMPARO DE SAO FRANCISCO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2800209,28,'AQUIDABA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2800308,28,'ARACAJU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2800407,28,'ARAUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2800506,28,'AREIA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2800605,28,'BARRA DOS COQUEIROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2800670,28,'BOQUIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2800704,28,'BREJO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2801009,28,'CAMPO DO BRITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2801108,28,'CANHOBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2801207,28,'CANINDE DE SAO FRANCISCO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2801306,28,'CAPELA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2801405,28,'CARIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2801504,28,'CARMOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2801603,28,'CEDRO DE SAO JOAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2801702,28,'CRISTINAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2801900,28,'CUMBE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2802007,28,'DIVINA PASTORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2802106,28,'ESTANCIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2802205,28,'FEIRA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2802304,28,'FREI PAULO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2802403,28,'GARARU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2802502,28,'GENERAL MAYNARD',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2802601,28,'GRACHO CARDOSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2802700,28,'ILHA DAS FLORES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2802809,28,'INDIAROBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2802908,28,'ITABAIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2803005,28,'ITABAIANINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2803104,28,'ITABI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2803203,28,'ITAPORANGA D''AJUDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2803302,28,'JAPARATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2803401,28,'JAPOATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2803500,28,'LAGARTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2803609,28,'LARANJEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2803708,28,'MACAMBIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2803807,28,'MALHADA DOS BOIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2803906,28,'MALHADOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2804003,28,'MARUIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2804102,28,'MOITA BONITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2804201,28,'MONTE ALEGRE DE SERGIPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2804300,28,'MURIBECA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2804409,28,'NEOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2804458,28,'NOSSA SENHORA APARECIDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2804508,28,'NOSSA SENHORA DA GLORIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2804607,28,'NOSSA SENHORA DAS DORES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2804706,28,'NOSSA SENHORA DE LOURDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2804805,28,'NOSSA SENHORA DO SOCORRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2804904,28,'PACATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2805000,28,'PEDRA MOLE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2805109,28,'PEDRINHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2805208,28,'PINHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2805307,28,'PIRAMBU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2805406,28,'POÇO REDONDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2805505,28,'POÇO VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2805604,28,'PORTO DA FOLHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2805703,28,'PROPRIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2805802,28,'RIACHAO DO DANTAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2805901,28,'RIACHUELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2806008,28,'RIBEIROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2806107,28,'ROSARIO DO CATETE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2806206,28,'SALGADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2806305,28,'SANTA LUZIA DO ITANHY',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2806404,28,'SANTANA DO SAO FRANCISCO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2806503,28,'SANTA ROSA DE LIMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2806602,28,'SANTO AMARO DAS BROTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2806701,28,'SAO CRISTOVAO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2806800,28,'SAO DOMINGOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2806909,28,'SAO FRANCISCO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2807006,28,'SAO MIGUEL DO ALEIXO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2807105,28,'SIMAO DIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2807204,28,'SIRIRI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2807303,28,'TELHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2807402,28,'TOBIAS BARRETO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2807501,28,'TOMAR DO GERU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2807600,28,'UMBAUBA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2900108,29,'ABAIRA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2900207,29,'ABARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2900306,29,'ACAJUTIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2900355,29,'ADUSTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2900405,29,'AGUA FRIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2900504,29,'ERICO CARDOSO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2900603,29,'AIQUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2900702,29,'ALAGOINHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2900801,29,'ALCOBAÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2900900,29,'ALMADINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901007,29,'AMARGOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901106,29,'AMELIA RODRIGUES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901155,29,'AMERICA DOURADA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901205,29,'ANAGE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901304,29,'ANDARAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901353,29,'ANDORINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901403,29,'ANGICAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901502,29,'ANGUERA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901601,29,'ANTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901700,29,'ANTONIO CARDOSO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901809,29,'ANTONIO GONÇALVES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901908,29,'APORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2901957,29,'APUAREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902005,29,'ARACATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902054,29,'ARAÇAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902104,29,'ARACI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902203,29,'ARAMARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902252,29,'ARATACA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902302,29,'ARATUIPE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902401,29,'AURELINO LEAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902500,29,'BAIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902609,29,'BAIXA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902658,29,'BANZAE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902708,29,'BARRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902807,29,'BARRA DA ESTIVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2902906,29,'BARRA DO CHOÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903003,29,'BARRA DO MENDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903102,29,'BARRA DO ROCHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903201,29,'BARREIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903235,29,'BARRO ALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903276,29,'BARROCAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903300,29,'BARRO PRETO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903409,29,'BELMONTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903508,29,'BELO CAMPO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903607,29,'BIRITINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903706,29,'BOA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903805,29,'BOA VISTA DO TUPIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903904,29,'BOM JESUS DA LAPA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2903953,29,'BOM JESUS DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904001,29,'BONINAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904050,29,'BONITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904100,29,'BOQUIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904209,29,'BOTUPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904308,29,'BREJOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904407,29,'BREJOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904506,29,'BROTAS DE MACAUBAS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904605,29,'BRUMADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904704,29,'BUERAREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904753,29,'BURITIRAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904803,29,'CAATIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904852,29,'CABACEIRAS DO PARAGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2904902,29,'CACHOEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2905008,29,'CACULE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2905107,29,'CAEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2905156,29,'CAETANOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2905206,29,'CAETITE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2905305,29,'CAFARNAUM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2905404,29,'CAIRU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2905503,29,'CALDEIRAO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2905602,29,'CAMACAN',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2905701,29,'CAMAÇARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2905800,29,'CAMAMU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2905909,29,'CAMPO ALEGRE DE LOURDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906006,29,'CAMPO FORMOSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906105,29,'CANAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906204,29,'CANARANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906303,29,'CANAVIEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906402,29,'CANDEAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906501,29,'CANDEIAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906600,29,'CANDIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906709,29,'CANDIDO SALES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906808,29,'CANSANÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906824,29,'CANUDOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906857,29,'CAPELA DO ALTO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906873,29,'CAPIM GROSSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906899,29,'CARAIBAS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2906907,29,'CARAVELAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2907004,29,'CARDEAL DA SILVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2907103,29,'CARINHANHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2907202,29,'CASA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2907301,29,'CASTRO ALVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2907400,29,'CATOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2907509,29,'CATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2907558,29,'CATURAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2907608,29,'CENTRAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2907707,29,'CHORROCHO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2907806,29,'CICERO DANTAS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2907905,29,'CIPO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2908002,29,'COARACI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2908101,29,'COCOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2908200,29,'CONCEIÇAO DA FEIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2908309,29,'CONCEIÇAO DO ALMEIDA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2908408,29,'CONCEIÇAO DO COITE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2908507,29,'CONCEIÇAO DO JACUIPE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2908606,29,'CONDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2908705,29,'CONDEUBA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2908804,29,'CONTENDAS DO SINCORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2908903,29,'CORAÇAO DE MARIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2909000,29,'CORDEIROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2909109,29,'CORIBE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2909208,29,'CORONEL JOAO SA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2909307,29,'CORRENTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2909406,29,'COTEGIPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2909505,29,'CRAVOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2909604,29,'CRISOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2909703,29,'CRISTOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2909802,29,'CRUZ DAS ALMAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2909901,29,'CURAÇA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910008,29,'DARIO MEIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910057,29,'DIAS D''AVILA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910107,29,'DOM BASILIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910206,29,'DOM MACEDO COSTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910305,29,'ELISIO MEDRADO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910404,29,'ENCRUZILHADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910503,29,'ENTRE RIOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910602,29,'ESPLANADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910701,29,'EUCLIDES DA CUNHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910727,29,'EUNAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910750,29,'FATIMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910776,29,'FEIRA DA MATA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910800,29,'FEIRA DE SANTANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910859,29,'FILADELFIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2910909,29,'FIRMINO ALVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911006,29,'FLORESTA AZUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911105,29,'FORMOSA DO RIO PRETO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911204,29,'GANDU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911253,29,'GAVIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911303,29,'GENTIO DO OURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911402,29,'GLORIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911501,29,'GONGOGI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911600,29,'GOVERNADOR MANGABEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911659,29,'GUAJERU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911709,29,'GUANAMBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911808,29,'GUARATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911857,29,'HELIOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2911907,29,'IAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2912004,29,'IBIASSUCE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2912103,29,'IBICARAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2912202,29,'IBICOARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2912301,29,'IBICUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2912400,29,'IBIPEBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2912509,29,'IBIPITANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2912608,29,'IBIQUERA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2912707,29,'IBIRAPITANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2912806,29,'IBIRAPUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2912905,29,'IBIRATAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2913002,29,'IBITIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2913101,29,'IBITITA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2913200,29,'IBOTIRAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2913309,29,'ICHU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2913408,29,'IGAPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2913457,29,'IGRAPIUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2913507,29,'IGUAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2913606,29,'ILHEUS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2913705,29,'INHAMBUPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2913804,29,'IPECAETA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2913903,29,'IPIAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2914000,29,'IPIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2914109,29,'IPUPIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2914208,29,'IRAJUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2914307,29,'IRAMAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2914406,29,'IRAQUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2914505,29,'IRARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2914604,29,'IRECE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2914653,29,'ITABELA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2914703,29,'ITABERABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2914802,29,'ITABUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2914901,29,'ITACARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2915007,29,'ITAETE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2915106,29,'ITAGI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2915205,29,'ITAGIBA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2915304,29,'ITAGIMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2915353,29,'ITAGUAÇU DA BAHIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2915403,29,'ITAJU DO COLONIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2915502,29,'ITAJUIPE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2915601,29,'ITAMARAJU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2915700,29,'ITAMARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2915809,29,'ITAMBE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2915908,29,'ITANAGRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2916005,29,'ITANHEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2916104,29,'ITAPARICA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2916203,29,'ITAPE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2916302,29,'ITAPEBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2916401,29,'ITAPETINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2916500,29,'ITAPICURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2916609,29,'ITAPITANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2916708,29,'ITAQUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2916807,29,'ITARANTIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2916856,29,'ITATIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2916906,29,'ITIRUÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2917003,29,'ITIUBA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2917102,29,'ITORORO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2917201,29,'ITUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2917300,29,'ITUBERA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2917334,29,'IUIU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2917359,29,'JABORANDI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2917409,29,'JACARACI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2917508,29,'JACOBINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2917607,29,'JAGUAQUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2917706,29,'JAGUARARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2917805,29,'JAGUARIPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2917904,29,'JANDAIRA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918001,29,'JEQUIE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918100,29,'JEREMOABO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918209,29,'JIQUIRIÇA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918308,29,'JITAUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918357,29,'JOAO DOURADO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918407,29,'JUAZEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918456,29,'JUCURUÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918506,29,'JUSSARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918555,29,'JUSSARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918605,29,'JUSSIAPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918704,29,'LAFAIETE COUTINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918753,29,'LAGOA REAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918803,29,'LAJE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2918902,29,'LAJEDAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919009,29,'LAJEDINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919058,29,'LAJEDO DO TABOCAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919108,29,'LAMARAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919157,29,'LAPAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919207,29,'LAURO DE FREITAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919306,29,'LENÇOIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919405,29,'LICINIO DE ALMEIDA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919504,29,'LIVRAMENTO DE NOSSA SENHORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919553,29,'LUIS EDUARDO MAGALHAES',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919603,29,'MACAJUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919702,29,'MACARANI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919801,29,'MACAUBAS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919900,29,'MACURURE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919926,29,'MADRE DE DEUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2919959,29,'MAETINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2920007,29,'MAIQUINIQUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2920106,29,'MAIRI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2920205,29,'MALHADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2920304,29,'MALHADA DE PEDRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2920403,29,'MANOEL VITORINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2920452,29,'MANSIDAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2920502,29,'MARACAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2920601,29,'MARAGOGIPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2920700,29,'MARAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2920809,29,'MARCIONILIO SOUZA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2920908,29,'MASCOTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2921005,29,'MATA DE SAO JOAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2921054,29,'MATINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2921104,29,'MEDEIROS NETO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2921203,29,'MIGUEL CALMON',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2921302,29,'MILAGRES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2921401,29,'MIRANGABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2921450,29,'MIRANTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2921500,29,'MONTE SANTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2921609,29,'MORPARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2921708,29,'MORRO DO CHAPEU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2921807,29,'MORTUGABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2921906,29,'MUCUGE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922003,29,'MUCURI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922052,29,'MULUNGU DO MORRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922102,29,'MUNDO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922201,29,'MUNIZ FERREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922250,29,'MUQUEM DE SAO FRANCISCO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922300,29,'MURITIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922409,29,'MUTUIPE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922508,29,'NAZARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922607,29,'NILO PEÇANHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922656,29,'NORDESTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922706,29,'NOVA CANAA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922730,29,'NOVA FATIMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922755,29,'NOVA IBIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922805,29,'NOVA ITARANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922854,29,'NOVA REDENÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2922904,29,'NOVA SOURE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923001,29,'NOVA VIÇOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923035,29,'NOVO HORIZONTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923050,29,'NOVO TRIUNFO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923100,29,'OLINDINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923209,29,'OLIVEIRA DOS BREJINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923308,29,'OURIÇANGAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923357,29,'OUROLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923407,29,'PALMAS DE MONTE ALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923506,29,'PALMEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923605,29,'PARAMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923704,29,'PARATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923803,29,'PARIPIRANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2923902,29,'PAU BRASIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924009,29,'PAULO AFONSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924058,29,'PE DE SERRA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924108,29,'PEDRAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924207,29,'PEDRO ALEXANDRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924306,29,'PIATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924405,29,'PILAO ARCADO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924504,29,'PINDAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924603,29,'PINDOBAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924652,29,'PINTADAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924678,29,'PIRAI DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924702,29,'PIRIPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924801,29,'PIRITIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2924900,29,'PLANALTINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925006,29,'PLANALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925105,29,'POÇOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925204,29,'POJUCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925253,29,'PONTO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925303,29,'PORTO SEGURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925402,29,'POTIRAGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925501,29,'PRADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925600,29,'PRESIDENTE DUTRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925709,29,'PRESIDENTE JANIO QUADROS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925758,29,'PRESIDENTE TANCREDO NEVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925808,29,'QUEIMADAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925907,29,'QUIJINGUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925931,29,'QUIXABEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2925956,29,'RAFAEL JAMBEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2926004,29,'REMANSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2926103,29,'RETIROLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2926202,29,'RIACHAO DAS NEVES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2926301,29,'RIACHAO DO JACUIPE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2926400,29,'RIACHO DE SANTANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2926509,29,'RIBEIRA DO AMPARO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2926608,29,'RIBEIRA DO POMBAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2926657,29,'RIBEIRAO DO LARGO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2926707,29,'RIO DE CONTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2926806,29,'RIO DO ANTONIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2926905,29,'RIO DO PIRES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2927002,29,'RIO REAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2927101,29,'RODELAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2927200,29,'RUY BARBOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2927309,29,'SALINAS DA MARGARIDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2927408,29,'SALVADOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2927507,29,'SANTA BARBARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2927606,29,'SANTA BRIGIDA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2927705,29,'SANTA CRUZ CABRALIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2927804,29,'SANTA CRUZ DA VITORIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2927903,29,'SANTA INES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2928000,29,'SANTALUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2928059,29,'SANTA LUZIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2928109,29,'SANTA MARIA DA VITORIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2928208,29,'SANTANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2928307,29,'SANTANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2928406,29,'SANTA RITA DE CASSIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2928505,29,'SANTA TERESINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2928604,29,'SANTO AMARO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2928703,29,'SANTO ANTONIO DE JESUS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2928802,29,'SANTO ESTEVAO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2928901,29,'SAO DESIDERIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2928950,29,'SAO DOMINGOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929008,29,'SAO FELIX',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929057,29,'SAO FELIX DO CORIBE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929107,29,'SAO FELIPE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929206,29,'SAO FRANCISCO DO CONDE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929255,29,'SAO GABRIEL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929305,29,'SAO GONÇALO DOS CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929354,29,'SAO JOSE DA VITORIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929370,29,'SAO JOSE DO JACUIPE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929404,29,'SAO MIGUEL DAS MATAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929503,29,'SAO SEBASTIAO DO PASSE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929602,29,'SAPEAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929701,29,'SATIRO DIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929750,29,'SAUBARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929800,29,'SAUDE',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2929909,29,'SEABRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930006,29,'SEBASTIAO LARANJEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930105,29,'SENHOR DO BONFIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930154,29,'SERRA DO RAMALHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930204,29,'SENTO SE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930303,29,'SERRA DOURADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930402,29,'SERRA PRETA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930501,29,'SERRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930600,29,'SERROLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930709,29,'SIMOES FILHO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930758,29,'SITIO DO MATO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930766,29,'SITIO DO QUINTO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930774,29,'SOBRADINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930808,29,'SOUTO SOARES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2930907,29,'TABOCAS DO BREJO VELHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2931004,29,'TANHAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2931053,29,'TANQUE NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2931103,29,'TANQUINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2931202,29,'TAPEROA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2931301,29,'TAPIRAMUTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2931350,29,'TEIXEIRA DE FREITAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2931400,29,'TEODORO SAMPAIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2931509,29,'TEOFILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2931608,29,'TEOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2931707,29,'TERRA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2931806,29,'TREMEDAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2931905,29,'TUCANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2932002,29,'UAUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2932101,29,'UBAIRA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2932200,29,'UBAITABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2932309,29,'UBATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2932408,29,'UIBAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2932457,29,'UMBURANAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2932507,29,'UNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2932606,29,'URANDI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2932705,29,'URUÇUCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2932804,29,'UTINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2932903,29,'VALENÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2933000,29,'VALENTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2933059,29,'VARZEA DA ROÇA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2933109,29,'VARZEA DO POÇO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2933158,29,'VARZEA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2933174,29,'VARZEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2933208,29,'VERA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2933257,29,'VEREDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2933307,29,'VITORIA DA CONQUISTA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2933406,29,'WAGNER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2933455,29,'WANDERLEY',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2933505,29,'WENCESLAU GUIMARAES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (2933604,29,'XIQUE-XIQUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3100104,31,'ABADIA DOS DOURADOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3100203,31,'ABAETE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3100302,31,'ABRE CAMPO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3100401,31,'ACAIACA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3100500,31,'AÇUCENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3100609,31,'AGUA BOA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3100708,31,'AGUA COMPRIDA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3100807,31,'AGUANIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3100906,31,'AGUAS FORMOSAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3101003,31,'AGUAS VERMELHAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3101102,31,'AIMORES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3101201,31,'AIURUOCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3101300,31,'ALAGOA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3101409,31,'ALBERTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3101508,31,'ALEM PARAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3101607,31,'ALFENAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3101631,31,'ALFREDO VASCONCELOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3101706,31,'ALMENARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3101805,31,'ALPERCATA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3101904,31,'ALPINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3102001,31,'ALTEROSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3102050,31,'ALTO CAPARAO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3102100,31,'ALTO RIO DOCE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3102209,31,'ALVARENGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3102308,31,'ALVINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3102407,31,'ALVORADA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3102506,31,'AMPARO DO SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3102605,31,'ANDRADAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3102704,31,'CACHOEIRA DE PAJEU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3102803,31,'ANDRELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3102852,31,'ANGELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3102902,31,'ANTONIO CARLOS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3103009,31,'ANTONIO DIAS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3103108,31,'ANTONIO PRADO DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3103207,31,'ARAÇAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3103306,31,'ARACITABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3103405,31,'ARAÇUAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3103504,31,'ARAGUARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3103603,31,'ARANTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3103702,31,'ARAPONGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3103751,31,'ARAPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3103801,31,'ARAPUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3103900,31,'ARAUJOS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3104007,31,'ARAXA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3104106,31,'ARCEBURGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3104205,31,'ARCOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3104304,31,'AREADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3104403,31,'ARGIRITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3104452,31,'ARICANDUVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3104502,31,'ARINOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3104601,31,'ASTOLFO DUTRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3104700,31,'ATALEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3104809,31,'AUGUSTO DE LIMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3104908,31,'BAEPENDI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3105004,31,'BALDIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3105103,31,'BAMBUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3105202,31,'BANDEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3105301,31,'BANDEIRA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3105400,31,'BARAO DE COCAIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3105509,31,'BARAO DE MONTE ALTO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3105608,31,'BARBACENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3105707,31,'BARRA LONGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3105905,31,'BARROSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3106002,31,'BELA VISTA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3106101,31,'BELMIRO BRAGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3106200,31,'BELO HORIZONTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3106309,31,'BELO ORIENTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3106408,31,'BELO VALE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3106507,31,'BERILO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3106606,31,'BERTOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3106655,31,'BERIZAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3106705,31,'BETIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3106804,31,'BIAS FORTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3106903,31,'BICAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3107000,31,'BIQUINHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3107109,31,'BOA ESPERANÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3107208,31,'BOCAINA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3107307,31,'BOCAIUVA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3107406,31,'BOM DESPACHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3107505,31,'BOM JARDIM DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3107604,31,'BOM JESUS DA PENHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3107703,31,'BOM JESUS DO AMPARO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3107802,31,'BOM JESUS DO GALHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3107901,31,'BOM REPOUSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3108008,31,'BOM SUCESSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3108107,31,'BONFIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3108206,31,'BONFINOPOLIS DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3108255,31,'BONITO DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3108305,31,'BORDA DA MATA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3108404,31,'BOTELHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3108503,31,'BOTUMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3108552,31,'BRASILANDIA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3108602,31,'BRASILIA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3108701,31,'BRAS PIRES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3108800,31,'BRAUNAS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3108909,31,'BRAZOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3109006,31,'BRUMADINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3109105,31,'BUENO BRANDAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3109204,31,'BUENOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3109253,31,'BUGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3109303,31,'BURITIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3109402,31,'BURITIZEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3109451,31,'CABECEIRA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3109501,31,'CABO VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3109600,31,'CACHOEIRA DA PRATA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3109709,31,'CACHOEIRA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3109808,31,'CACHOEIRA DOURADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3109907,31,'CAETANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3110004,31,'CAETE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3110103,31,'CAIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3110202,31,'CAJURI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3110301,31,'CALDAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3110400,31,'CAMACHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3110509,31,'CAMANDUCAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3110608,31,'CAMBUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3110707,31,'CAMBUQUIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3110806,31,'CAMPANARIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3110905,31,'CAMPANHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3111002,31,'CAMPESTRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3111101,31,'CAMPINA VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3111150,31,'CAMPO AZUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3111200,31,'CAMPO BELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3111309,31,'CAMPO DO MEIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3111408,31,'CAMPO FLORIDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3111507,31,'CAMPOS ALTOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3111606,31,'CAMPOS GERAIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3111705,31,'CANAA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3111804,31,'CANAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3111903,31,'CANA VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3112000,31,'CANDEIAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3112059,31,'CANTAGALO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3112109,31,'CAPARAO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3112208,31,'CAPELA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3112307,31,'CAPELINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3112406,31,'CAPETINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3112505,31,'CAPIM BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3112604,31,'CAPINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3112653,31,'CAPITAO ANDRADE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3112703,31,'CAPITAO ENEAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3112802,31,'CAPITOLIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3112901,31,'CAPUTIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3113008,31,'CARAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3113107,31,'CARANAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3113206,31,'CARANDAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3113305,31,'CARANGOLA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3113404,31,'CARATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3113503,31,'CARBONITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3113602,31,'CAREAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3113701,31,'CARLOS CHAGAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3113800,31,'CARMESIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3113909,31,'CARMO DA CACHOEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3114006,31,'CARMO DA MATA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3114105,31,'CARMO DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3114204,31,'CARMO DO CAJURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3114303,31,'CARMO DO PARANAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3114402,31,'CARMO DO RIO CLARO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3114501,31,'CARMOPOLIS DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3114550,31,'CARNEIRINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3114600,31,'CARRANCAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3114709,31,'CARVALHOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3114808,31,'CARVALHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3114907,31,'CASA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115003,31,'CASCALHO RICO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115102,31,'CASSIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115201,31,'CONCEIÇAO DA BARRA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115300,31,'CATAGUASES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115359,31,'CATAS ALTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115409,31,'CATAS ALTAS DA NORUEGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115458,31,'CATUJI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115474,31,'CATUTI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115508,31,'CAXAMBU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115607,31,'CEDRO DO ABAETE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115706,31,'CENTRAL DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115805,31,'CENTRALINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3115904,31,'CHACARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3116001,31,'CHALE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3116100,31,'CHAPADA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3116159,31,'CHAPADA GAUCHA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3116209,31,'CHIADOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3116308,31,'CIPOTANEA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3116407,31,'CLARAVAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3116506,31,'CLARO DOS POÇOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3116605,31,'CLAUDIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3116704,31,'COIMBRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3116803,31,'COLUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3116902,31,'COMENDADOR GOMES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3117009,31,'COMERCINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3117108,31,'CONCEIÇAO DA APARECIDA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3117207,31,'CONCEIÇAO DAS PEDRAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3117306,31,'CONCEIÇAO DAS ALAGOAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3117405,31,'CONCEIÇAO DE IPANEMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3117504,31,'CONCEIÇAO DO MATO DENTRO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3117603,31,'CONCEIÇAO DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3117702,31,'CONCEIÇAO DO RIO VERDE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3117801,31,'CONCEIÇAO DOS OUROS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3117836,31,'CONEGO MARINHO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3117876,31,'CONFINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3117900,31,'CONGONHAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3118007,31,'CONGONHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3118106,31,'CONGONHAS DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3118205,31,'CONQUISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3118304,31,'CONSELHEIRO LAFAIETE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3118403,31,'CONSELHEIRO PENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3118502,31,'CONSOLAÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3118601,31,'CONTAGEM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3118700,31,'COQUEIRAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3118809,31,'CORAÇAO DE JESUS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3118908,31,'CORDISBURGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3119005,31,'CORDISLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3119104,31,'CORINTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3119203,31,'COROACI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3119302,31,'COROMANDEL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3119401,31,'CORONEL FABRICIANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3119500,31,'CORONEL MURTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3119609,31,'CORONEL PACHECO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3119708,31,'CORONEL XAVIER CHAVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3119807,31,'CORREGO DANTA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3119906,31,'CORREGO DO BOM JESUS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3119955,31,'CORREGO FUNDO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120003,31,'CORREGO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120102,31,'COUTO DE MAGALHAES DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120151,31,'CRISOLITA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120201,31,'CRISTAIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120300,31,'CRISTALIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120409,31,'CRISTIANO OTONI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120508,31,'CRISTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120607,31,'CRUCILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120706,31,'CRUZEIRO DA FORTALEZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120805,31,'CRUZILIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120839,31,'CUPARAQUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120870,31,'CURRAL DE DENTRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3120904,31,'CURVELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3121001,31,'DATAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3121100,31,'DELFIM MOREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3121209,31,'DELFINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3121258,31,'DELTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3121308,31,'DESCOBERTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3121407,31,'DESTERRO DE ENTRE RIOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3121506,31,'DESTERRO DO MELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3121605,31,'DIAMANTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3121704,31,'DIOGO DE VASCONCELOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3121803,31,'DIONISIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3121902,31,'DIVINESIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122009,31,'DIVINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122108,31,'DIVINO DAS LARANJEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122207,31,'DIVINOLANDIA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122306,31,'DIVINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122355,31,'DIVISA ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122405,31,'DIVISA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122454,31,'DIVISOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122470,31,'DOM BOSCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122504,31,'DOM CAVATI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122603,31,'DOM JOAQUIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122702,31,'DOM SILVERIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122801,31,'DOM VIÇOSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3122900,31,'DONA EUSEBIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3123007,31,'DORES DE CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3123106,31,'DORES DE GUANHAES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3123205,31,'DORES DO INDAIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3123304,31,'DORES DO TURVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3123403,31,'DORESOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3123502,31,'DOURADOQUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3123528,31,'DURANDE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3123601,31,'ELOI MENDES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3123700,31,'ENGENHEIRO CALDAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3123809,31,'ENGENHEIRO NAVARRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3123858,31,'ENTRE FOLHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3123908,31,'ENTRE RIOS DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3124005,31,'ERVALIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3124104,31,'ESMERALDAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3124203,31,'ESPERA FELIZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3124302,31,'ESPINOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3124401,31,'ESPIRITO SANTO DO DOURADO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3124500,31,'ESTIVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3124609,31,'ESTRELA DALVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3124708,31,'ESTRELA DO INDAIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3124807,31,'ESTRELA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3124906,31,'EUGENOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3125002,31,'EWBANK DA CAMARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3125101,31,'EXTREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3125200,31,'FAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3125309,31,'FARIA LEMOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3125408,31,'FELICIO DOS SANTOS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3125507,31,'SAO GONÇALO DO RIO PRETO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3125606,31,'FELISBURGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3125705,31,'FELIXLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3125804,31,'FERNANDES TOURINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3125903,31,'FERROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3125952,31,'FERVEDOURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3126000,31,'FLORESTAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3126109,31,'FORMIGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3126208,31,'FORMOSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3126307,31,'FORTALEZA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3126406,31,'FORTUNA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3126505,31,'FRANCISCO BADARO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3126604,31,'FRANCISCO DUMONT',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3126703,31,'FRANCISCO SA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3126752,31,'FRANCISCOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3126802,31,'FREI GASPAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3126901,31,'FREI INOCENCIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3126950,31,'FREI LAGONEGRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127008,31,'FRONTEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127057,31,'FRONTEIRA DOS VALES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127073,31,'FRUTA DE LEITE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127107,31,'FRUTAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127206,31,'FUNILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127305,31,'GALILEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127339,31,'GAMELEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127354,31,'GLAUCILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127370,31,'GOIABEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127388,31,'GOIANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127404,31,'GONÇALVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127503,31,'GONZAGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127602,31,'GOUVEIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127701,31,'GOVERNADOR VALADARES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127800,31,'GRAO MOGOL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3127909,31,'GRUPIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3128006,31,'GUANHAES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3128105,31,'GUAPE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3128204,31,'GUARACIABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3128253,31,'GUARACIAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3128303,31,'GUARANESIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3128402,31,'GUARANI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3128501,31,'GUARARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3128600,31,'GUARDA-MOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3128709,31,'GUAXUPE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3128808,31,'GUIDOVAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3128907,31,'GUIMARANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3129004,31,'GUIRICEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3129103,31,'GURINHATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3129202,31,'HELIODORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3129301,31,'IAPU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3129400,31,'IBERTIOGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3129509,31,'IBIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3129608,31,'IBIAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3129657,31,'IBIRACATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3129707,31,'IBIRACI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3129806,31,'IBIRITE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3129905,31,'IBITIURA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130002,31,'IBITURUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130051,31,'ICARAI DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130101,31,'IGARAPE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130200,31,'IGARATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130309,31,'IGUATAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130408,31,'IJACI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130507,31,'ILICINEA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130556,31,'IMBE DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130606,31,'INCONFIDENTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130655,31,'INDAIABIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130705,31,'INDIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130804,31,'INGAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3130903,31,'INHAPIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3131000,31,'INHAUMA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3131109,31,'INIMUTABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3131158,31,'IPABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3131208,31,'IPANEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3131307,31,'IPATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3131406,31,'IPIAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3131505,31,'IPUIUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3131604,31,'IRAI DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3131703,31,'ITABIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3131802,31,'ITABIRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3131901,31,'ITABIRITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3132008,31,'ITACAMBIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3132107,31,'ITACARAMBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3132206,31,'ITAGUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3132305,31,'ITAIPE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3132404,31,'ITAJUBA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3132503,31,'ITAMARANDIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3132602,31,'ITAMARATI DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3132701,31,'ITAMBACURI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3132800,31,'ITAMBE DO MATO DENTRO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3132909,31,'ITAMOGI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3133006,31,'ITAMONTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3133105,31,'ITANHANDU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3133204,31,'ITANHOMI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3133303,31,'ITAOBIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3133402,31,'ITAPAGIPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3133501,31,'ITAPECERICA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3133600,31,'ITAPEVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3133709,31,'ITATIAIUÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3133758,31,'ITAU DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3133808,31,'ITAUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3133907,31,'ITAVERAVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3134004,31,'ITINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3134103,31,'ITUETA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3134202,31,'ITUIUTABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3134301,31,'ITUMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3134400,31,'ITURAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3134509,31,'ITUTINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3134608,31,'JABOTICATUBAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3134707,31,'JACINTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3134806,31,'JACUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3134905,31,'JACUTINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135001,31,'JAGUARAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135050,31,'JAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135076,31,'JAMPRUCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135100,31,'JANAUBA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135209,31,'JANUARIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135308,31,'JAPARAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135357,31,'JAPONVAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135407,31,'JECEABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135456,31,'JENIPAPO DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135506,31,'JEQUERI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135605,31,'JEQUITAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135704,31,'JEQUITIBA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135803,31,'JEQUITINHONHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3135902,31,'JESUANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136009,31,'JOAIMA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136108,31,'JOANESIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136207,31,'JOAO MONLEVADE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136306,31,'JOAO PINHEIRO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136405,31,'JOAQUIM FELICIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136504,31,'JORDANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136520,31,'JOSE GONÇALVES DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136553,31,'JOSE RAYDAN',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136579,31,'JOSENOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136603,31,'NOVA UNIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136652,31,'JUATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136702,31,'JUIZ DE FORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136801,31,'JURAMENTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136900,31,'JURUAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3136959,31,'JUVENILIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3137007,31,'LADAINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3137106,31,'LAGAMAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3137205,31,'LAGOA DA PRATA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3137304,31,'LAGOA DOS PATOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3137403,31,'LAGOA DOURADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3137502,31,'LAGOA FORMOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3137536,31,'LAGOA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3137601,31,'LAGOA SANTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3137700,31,'LAJINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3137809,31,'LAMBARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3137908,31,'LAMIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138005,31,'LARANJAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138104,31,'LASSANCE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138203,31,'LAVRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138302,31,'LEANDRO FERREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138351,31,'LEME DO PRADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138401,31,'LEOPOLDINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138500,31,'LIBERDADE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138609,31,'LIMA DUARTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138625,31,'LIMEIRA DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138658,31,'LONTRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138674,31,'LUISBURGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138682,31,'LUISLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138708,31,'LUMINARIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138807,31,'LUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3138906,31,'MACHACALIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3139003,31,'MACHADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3139102,31,'MADRE DE DEUS DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3139201,31,'MALACACHETA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3139250,31,'MAMONAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3139300,31,'MANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3139409,31,'MANHUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3139508,31,'MANHUMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3139607,31,'MANTENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3139706,31,'MARAVILHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3139805,31,'MAR DE ESPANHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3139904,31,'MARIA DA FE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140001,31,'MARIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140100,31,'MARILAC',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140159,31,'MARIO CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140209,31,'MARIPA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140308,31,'MARLIERIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140407,31,'MARMELOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140506,31,'MARTINHO CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140530,31,'MARTINS SOARES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140555,31,'MATA VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140605,31,'MATERLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140704,31,'MATEUS LEME',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140803,31,'MATIAS BARBOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140852,31,'MATIAS CARDOSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3140902,31,'MATIPO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3141009,31,'MATO VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3141108,31,'MATOZINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3141207,31,'MATUTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3141306,31,'MEDEIROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3141405,31,'MEDINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3141504,31,'MENDES PIMENTEL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3141603,31,'MERCES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3141702,31,'MESQUITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3141801,31,'MINAS NOVAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3141900,31,'MINDURI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3142007,31,'MIRABELA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3142106,31,'MIRADOURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3142205,31,'MIRAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3142254,31,'MIRAVANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3142304,31,'MOEDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3142403,31,'MOEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3142502,31,'MONJOLOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3142601,31,'MONSENHOR PAULO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3142700,31,'MONTALVANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3142809,31,'MONTE ALEGRE DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3142908,31,'MONTE AZUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3143005,31,'MONTE BELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3143104,31,'MONTE CARMELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3143153,31,'MONTE FORMOSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3143203,31,'MONTE SANTO DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3143302,31,'MONTES CLAROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3143401,31,'MONTE SIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3143450,31,'MONTEZUMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3143500,31,'MORADA NOVA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3143609,31,'MORRO DA GARÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3143708,31,'MORRO DO PILAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3143807,31,'MUNHOZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3143906,31,'MURIAE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144003,31,'MUTUM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144102,31,'MUZAMBINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144201,31,'NACIP RAYDAN',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144300,31,'NANUQUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144359,31,'NAQUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144375,31,'NATALANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144409,31,'NATERCIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144508,31,'NAZARENO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144607,31,'NEPOMUCENO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144656,31,'NINHEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144672,31,'NOVA BELEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144706,31,'NOVA ERA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144805,31,'NOVA LIMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3144904,31,'NOVA MODICA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145000,31,'NOVA PONTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145059,31,'NOVA PORTEIRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145109,31,'NOVA RESENDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145208,31,'NOVA SERRANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145307,31,'NOVO CRUZEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145356,31,'NOVO ORIENTE DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145372,31,'NOVORIZONTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145406,31,'OLARIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145455,31,'OLHOS-D''AGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145505,31,'OLIMPIO NORONHA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145604,31,'OLIVEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145703,31,'OLIVEIRA FORTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145802,31,'ONÇA DE PITANGUI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145851,31,'ORATORIOS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145877,31,'ORIZANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3145901,31,'OURO BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3146008,31,'OURO FINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3146107,31,'OURO PRETO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3146206,31,'OURO VERDE DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3146255,31,'PADRE CARVALHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3146305,31,'PADRE PARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3146404,31,'PAINEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3146503,31,'PAINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3146552,31,'PAI PEDRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3146602,31,'PAIVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3146701,31,'PALMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3146750,31,'PALMOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3146909,31,'PAPAGAIOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3147006,31,'PARACATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3147105,31,'PARA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3147204,31,'PARAGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3147303,31,'PARAISOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3147402,31,'PARAOPEBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3147501,31,'PASSABEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3147600,31,'PASSA QUATRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3147709,31,'PASSA TEMPO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3147808,31,'PASSA-VINTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3147907,31,'PASSOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3147956,31,'PATIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3148004,31,'PATOS DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3148103,31,'PATROCINIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3148202,31,'PATROCINIO DO MURIAE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3148301,31,'PAULA CANDIDO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3148400,31,'PAULISTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3148509,31,'PAVAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3148608,31,'PEÇANHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3148707,31,'PEDRA AZUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3148756,31,'PEDRA BONITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3148806,31,'PEDRA DO ANTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3148905,31,'PEDRA DO INDAIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3149002,31,'PEDRA DOURADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3149101,31,'PEDRALVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3149150,31,'PEDRAS DE MARIA DA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3149200,31,'PEDRINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3149309,31,'PEDRO LEOPOLDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3149408,31,'PEDRO TEIXEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3149507,31,'PEQUERI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3149606,31,'PEQUI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3149705,31,'PERDIGAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3149804,31,'PERDIZES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3149903,31,'PERDOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3149952,31,'PERIQUITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150000,31,'PESCADOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150109,31,'PIAU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150158,31,'PIEDADE DE CARATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150208,31,'PIEDADE DE PONTE NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150307,31,'PIEDADE DO RIO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150406,31,'PIEDADE DOS GERAIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150505,31,'PIMENTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150539,31,'PINGO-D''AGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150570,31,'PINTOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150604,31,'PIRACEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150703,31,'PIRAJUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150802,31,'PIRANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3150901,31,'PIRANGUÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3151008,31,'PIRANGUINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3151107,31,'PIRAPETINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3151206,31,'PIRAPORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3151305,31,'PIRAUBA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3151404,31,'PITANGUI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3151503,31,'PIUMHI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3151602,31,'PLANURA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3151701,31,'POÇO FUNDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3151800,31,'POÇOS DE CALDAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3151909,31,'POCRANE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3152006,31,'POMPEU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3152105,31,'PONTE NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3152131,31,'PONTO CHIQUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3152170,31,'PONTO DOS VOLANTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3152204,31,'PORTEIRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3152303,31,'PORTO FIRME',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3152402,31,'POTE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3152501,31,'POUSO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3152600,31,'POUSO ALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3152709,31,'PRADOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3152808,31,'PRATA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3152907,31,'PRATAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3153004,31,'PRATINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3153103,31,'PRESIDENTE BERNARDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3153202,31,'PRESIDENTE JUSCELINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3153301,31,'PRESIDENTE KUBITSCHEK',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3153400,31,'PRESIDENTE OLEGARIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3153509,31,'ALTO JEQUITIBA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3153608,31,'PRUDENTE DE MORAIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3153707,31,'QUARTEL GERAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3153806,31,'QUELUZITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3153905,31,'RAPOSOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3154002,31,'RAUL SOARES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3154101,31,'RECREIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3154150,31,'REDUTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3154200,31,'RESENDE COSTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3154309,31,'RESPLENDOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3154408,31,'RESSAQUINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3154457,31,'RIACHINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3154507,31,'RIACHO DOS MACHADOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3154606,31,'RIBEIRAO DAS NEVES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3154705,31,'RIBEIRAO VERMELHO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3154804,31,'RIO ACIMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3154903,31,'RIO CASCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3155009,31,'RIO DOCE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3155108,31,'RIO DO PRADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3155207,31,'RIO ESPERA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3155306,31,'RIO MANSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3155405,31,'RIO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3155504,31,'RIO PARANAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3155603,31,'RIO PARDO DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3155702,31,'RIO PIRACICABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3155801,31,'RIO POMBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3155900,31,'RIO PRETO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3156007,31,'RIO VERMELHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3156106,31,'RITAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3156205,31,'ROCHEDO DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3156304,31,'RODEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3156403,31,'ROMARIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3156452,31,'ROSARIO DA LIMEIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3156502,31,'RUBELITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3156601,31,'RUBIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3156700,31,'SABARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3156809,31,'SABINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3156908,31,'SACRAMENTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157005,31,'SALINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157104,31,'SALTO DA DIVISA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157203,31,'SANTA BARBARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157252,31,'SANTA BARBARA DO LESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157278,31,'SANTA BARBARA DO MONTE VERDE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157302,31,'SANTA BARBARA DO TUGURIO',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157336,31,'SANTA CRUZ DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157377,31,'SANTA CRUZ DE SALINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157401,31,'SANTA CRUZ DO ESCALVADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157500,31,'SANTA EFIGENIA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157609,31,'SANTA FE DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157658,31,'SANTA HELENA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157708,31,'SANTA JULIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157807,31,'SANTA LUZIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3157906,31,'SANTA MARGARIDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3158003,31,'SANTA MARIA DE ITABIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3158102,31,'SANTA MARIA DO SALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3158201,31,'SANTA MARIA DO SUAÇUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3158300,31,'SANTANA DA VARGEM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3158409,31,'SANTANA DE CATAGUASES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3158508,31,'SANTANA DE PIRAPAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3158607,31,'SANTANA DO DESERTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3158706,31,'SANTANA DO GARAMBEU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3158805,31,'SANTANA DO JACARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3158904,31,'SANTANA DO MANHUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3158953,31,'SANTANA DO PARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3159001,31,'SANTANA DO RIACHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3159100,31,'SANTANA DOS MONTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3159209,31,'SANTA RITA DE CALDAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3159308,31,'SANTA RITA DE JACUTINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3159357,31,'SANTA RITA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3159407,31,'SANTA RITA DE IBITIPOCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3159506,31,'SANTA RITA DO ITUETO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3159605,31,'SANTA RITA DO SAPUCAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3159704,31,'SANTA ROSA DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3159803,31,'SANTA VITORIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3159902,31,'SANTO ANTONIO DO AMPARO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3160009,31,'SANTO ANTONIO DO AVENTUREIRO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3160108,31,'SANTO ANTONIO DO GRAMA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3160207,31,'SANTO ANTONIO DO ITAMBE',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3160306,31,'SANTO ANTONIO DO JACINTO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3160405,31,'SANTO ANTONIO DO MONTE',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3160454,31,'SANTO ANTONIO DO RETIRO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3160504,31,'SANTO ANTONIO DO RIO ABAIXO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3160603,31,'SANTO HIPOLITO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3160702,31,'SANTOS DUMONT',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3160801,31,'SAO BENTO ABADE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3160900,31,'SAO BRAS DO SUAÇUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3160959,31,'SAO DOMINGOS DAS DORES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3161007,31,'SAO DOMINGOS DO PRATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3161056,31,'SAO FELIX DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3161106,31,'SAO FRANCISCO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3161205,31,'SAO FRANCISCO DE PAULA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3161304,31,'SAO FRANCISCO DE SALES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3161403,31,'SAO FRANCISCO DO GLORIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3161502,31,'SAO GERALDO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3161601,31,'SAO GERALDO DA PIEDADE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3161650,31,'SAO GERALDO DO BAIXIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3161700,31,'SAO GONÇALO DO ABAETE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3161809,31,'SAO GONÇALO DO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3161908,31,'SAO GONÇALO DO RIO ABAIXO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162005,31,'SAO GONÇALO DO SAPUCAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162104,31,'SAO GOTARDO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162203,31,'SAO JOAO BATISTA DO GLORIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162252,31,'SAO JOAO DA LAGOA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162302,31,'SAO JOAO DA MATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162401,31,'SAO JOAO DA PONTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162450,31,'SAO JOAO DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162500,31,'SAO JOAO DEL REI',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162559,31,'SAO JOAO DO MANHUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162575,31,'SAO JOAO DO MANTENINHA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162609,31,'SAO JOAO DO ORIENTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162658,31,'SAO JOAO DO PACUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162708,31,'SAO JOAO DO PARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162807,31,'SAO JOAO EVANGELISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162906,31,'SAO JOAO NEPOMUCENO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162922,31,'SAO JOAQUIM DE BICAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162948,31,'SAO JOSE DA BARRA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3162955,31,'SAO JOSE DA LAPA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3163003,31,'SAO JOSE DA SAFIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3163102,31,'SAO JOSE DA VARGINHA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3163201,31,'SAO JOSE DO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3163300,31,'SAO JOSE DO DIVINO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3163409,31,'SAO JOSE DO GOIABAL',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3163508,31,'SAO JOSE DO JACURI',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3163607,31,'SAO JOSE DO MANTIMENTO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3163706,31,'SAO LOURENÇO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3163805,31,'SAO MIGUEL DO ANTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3163904,31,'SAO PEDRO DA UNIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3164001,31,'SAO PEDRO DOS FERROS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3164100,31,'SAO PEDRO DO SUAÇUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3164209,31,'SAO ROMAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3164308,31,'SAO ROQUE DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3164407,31,'SAO SEBASTIAO DA BELA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3164431,31,'SAO SEBASTIAO DA VARGEM ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3164472,31,'SAO SEBASTIAO DO ANTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3164506,31,'SAO SEBASTIAO DO MARANHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3164605,31,'SAO SEBASTIAO DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3164704,31,'SAO SEBASTIAO DO PARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3164803,31,'SAO SEBASTIAO DO RIO PRETO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3164902,31,'SAO SEBASTIAO DO RIO VERDE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165008,31,'SAO TIAGO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165107,31,'SAO TOMAS DE AQUINO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165206,31,'SAO THOME DAS LETRAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165305,31,'SAO VICENTE DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165404,31,'SAPUCAI-MIRIM',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165503,31,'SARDOA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165537,31,'SARZEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165552,31,'SETUBINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165560,31,'SEM-PEIXE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165578,31,'SENADOR AMARAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165602,31,'SENADOR CORTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165701,31,'SENADOR FIRMINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165800,31,'SENADOR JOSE BENTO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3165909,31,'SENADOR MODESTINO GONÇALVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3166006,31,'SENHORA DE OLIVEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3166105,31,'SENHORA DO PORTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3166204,31,'SENHORA DOS REMEDIOS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3166303,31,'SERICITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3166402,31,'SERITINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3166501,31,'SERRA AZUL DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3166600,31,'SERRA DA SAUDADE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3166709,31,'SERRA DOS AIMORES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3166808,31,'SERRA DO SALITRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3166907,31,'SERRANIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3166956,31,'SERRANOPOLIS DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3167004,31,'SERRANOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3167103,31,'SERRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3167202,31,'SETE LAGOAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3167301,31,'SILVEIRANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3167400,31,'SILVIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3167509,31,'SIMAO PEREIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3167608,31,'SIMONESIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3167707,31,'SOBRALIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3167806,31,'SOLEDADE DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3167905,31,'TABULEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3168002,31,'TAIOBEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3168051,31,'TAPARUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3168101,31,'TAPIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3168200,31,'TAPIRAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3168309,31,'TAQUARAÇU DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3168408,31,'TARUMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3168507,31,'TEIXEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3168606,31,'TEOFILO OTONI',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3168705,31,'TIMOTEO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3168804,31,'TIRADENTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3168903,31,'TIROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3169000,31,'TOCANTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3169059,31,'TOCOS DO MOJI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3169109,31,'TOLEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3169208,31,'TOMBOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3169307,31,'TRES CORAÇOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3169356,31,'TRES MARIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3169406,31,'TRES PONTAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3169505,31,'TUMIRITINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3169604,31,'TUPACIGUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3169703,31,'TURMALINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3169802,31,'TURVOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3169901,31,'UBA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170008,31,'UBAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170057,31,'UBAPORANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170107,31,'UBERABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170206,31,'UBERLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170305,31,'UMBURATIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170404,31,'UNAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170438,31,'UNIAO DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170479,31,'URUANA DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170503,31,'URUCANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170529,31,'URUCUIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170578,31,'VARGEM ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170602,31,'VARGEM BONITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170651,31,'VARGEM GRANDE DO RIO PARDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170701,31,'VARGINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170750,31,'VARJAO DE MINAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170800,31,'VARZEA DA PALMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3170909,31,'VARZELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171006,31,'VAZANTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171030,31,'VERDELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171071,31,'VEREDINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171105,31,'VERISSIMO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171154,31,'VERMELHO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171204,31,'VESPASIANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171303,31,'VIÇOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171402,31,'VIEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171501,31,'MATHIAS LOBATO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171600,31,'VIRGEM DA LAPA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171709,31,'VIRGINIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171808,31,'VIRGINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3171907,31,'VIRGOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3172004,31,'VISCONDE DO RIO BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3172103,31,'VOLTA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3172202,31,'WENCESLAU BRAZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3200102,32,'AFONSO CLAUDIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3200136,32,'AGUIA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3200169,32,'AGUA DOCE DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3200201,32,'ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3200300,32,'ALFREDO CHAVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3200359,32,'ALTO RIO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3200409,32,'ANCHIETA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3200508,32,'APIACA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3200607,32,'ARACRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3200706,32,'ATILIO VIVACQUA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3200805,32,'BAIXO GUANDU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3200904,32,'BARRA DE SAO FRANCISCO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3201001,32,'BOA ESPERANÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3201100,32,'BOM JESUS DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3201159,32,'BREJETUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3201209,32,'CACHOEIRO DE ITAPEMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3201308,32,'CARIACICA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3201407,32,'CASTELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3201506,32,'COLATINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3201605,32,'CONCEIÇAO DA BARRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3201704,32,'CONCEIÇAO DO CASTELO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3201803,32,'DIVINO DE SAO LOURENÇO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3201902,32,'DOMINGOS MARTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202009,32,'DORES DO RIO PRETO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202108,32,'ECOPORANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202207,32,'FUNDAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202256,32,'GOVERNADOR LINDENBERG',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202306,32,'GUAÇUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202405,32,'GUARAPARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202454,32,'IBATIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202504,32,'IBIRAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202553,32,'IBITIRAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202603,32,'ICONHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202652,32,'IRUPI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202702,32,'ITAGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202801,32,'ITAPEMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3202900,32,'ITARANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203007,32,'IUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203056,32,'JAGUARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203106,32,'JERONIMO MONTEIRO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203130,32,'JOAO NEIVA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203163,32,'LARANJA DA TERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203205,32,'LINHARES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203304,32,'MANTENOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203320,32,'MARATAIZES',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203346,32,'MARECHAL FLORIANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203353,32,'MARILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203403,32,'MIMOSO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203502,32,'MONTANHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203601,32,'MUCURICI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203700,32,'MUNIZ FREIRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203809,32,'MUQUI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3203908,32,'NOVA VENECIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204005,32,'PANCAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204054,32,'PEDRO CANARIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204104,32,'PINHEIROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204203,32,'PIUMA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204252,32,'PONTO BELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204302,32,'PRESIDENTE KENNEDY',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204351,32,'RIO BANANAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204401,32,'RIO NOVO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204500,32,'SANTA LEOPOLDINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204559,32,'SANTA MARIA DE JETIBA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204609,32,'SANTA TERESA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204658,32,'SAO DOMINGOS DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204708,32,'SAO GABRIEL DA PALHA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204807,32,'SAO JOSE DO CALÇADO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204906,32,'SAO MATEUS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3204955,32,'SAO ROQUE DO CANAA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3205002,32,'SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3205010,32,'SOORETAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3205036,32,'VARGEM ALTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3205069,32,'VENDA NOVA DO IMIGRANTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3205101,32,'VIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3205150,32,'VILA PAVAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3205176,32,'VILA VALERIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3205200,32,'VILA VELHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3205309,32,'VITORIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300100,33,'ANGRA DOS REIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300159,33,'APERIBE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300209,33,'ARARUAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300225,33,'AREAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300233,33,'ARMAÇAO DOS BUZIOS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300258,33,'ARRAIAL DO CABO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300308,33,'BARRA DO PIRAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300407,33,'BARRA MANSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300456,33,'BELFORD ROXO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300506,33,'BOM JARDIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300605,33,'BOM JESUS DO ITABAPOANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300704,33,'CABO FRIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300803,33,'CACHOEIRAS DE MACACU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300902,33,'CAMBUCI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300936,33,'CARAPEBUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3300951,33,'COMENDADOR LEVY GASPARIAN',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301009,33,'CAMPOS DOS GOYTACAZES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301108,33,'CANTAGALO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301157,33,'CARDOSO MOREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301207,33,'CARMO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301306,33,'CASIMIRO DE ABREU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301405,33,'CONCEIÇAO DE MACABU',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301504,33,'CORDEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301603,33,'DUAS BARRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301702,33,'DUQUE DE CAXIAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301801,33,'ENGENHEIRO PAULO DE FRONTIN',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301850,33,'GUAPIMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301876,33,'IGUABA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3301900,33,'ITABORAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302007,33,'ITAGUAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302056,33,'ITALVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302106,33,'ITAOCARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302205,33,'ITAPERUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302254,33,'ITATIAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302270,33,'JAPERI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302304,33,'LAJE DO MURIAE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302403,33,'MACAE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302452,33,'MACUCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302502,33,'MAGE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302601,33,'MANGARATIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302700,33,'MARICA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302809,33,'MENDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302858,33,'MESQUITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3302908,33,'MIGUEL PEREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3303005,33,'MIRACEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3303104,33,'NATIVIDADE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3303203,33,'NILOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3303302,33,'NITEROI',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3303401,33,'NOVA FRIBURGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3303500,33,'NOVA IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3303609,33,'PARACAMBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3303708,33,'PARAIBA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3303807,33,'PARATY',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3303856,33,'PATY DO ALFERES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3303906,33,'PETROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3303955,33,'PINHEIRAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304003,33,'PIRAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304102,33,'PORCIUNCULA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304110,33,'PORTO REAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304128,33,'QUATIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304144,33,'QUEIMADOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304151,33,'QUISSAMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304201,33,'RESENDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304300,33,'RIO BONITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304409,33,'RIO CLARO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304508,33,'RIO DAS FLORES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304524,33,'RIO DAS OSTRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304557,33,'RIO DE JANEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304607,33,'SANTA MARIA MADALENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304706,33,'SANTO ANTONIO DE PADUA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304755,33,'SAO FRANCISCO DE ITABAPOANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304805,33,'SAO FIDELIS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3304904,33,'SAO GONÇALO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305000,33,'SAO JOAO DA BARRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305109,33,'SAO JOAO DE MERITI',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305133,33,'SAO JOSE DE UBA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305158,33,'SAO JOSE DO VALE DO RIO PRETO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305208,33,'SAO PEDRO DA ALDEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305307,33,'SAO SEBASTIAO DO ALTO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305406,33,'SAPUCAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305505,33,'SAQUAREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305554,33,'SEROPEDICA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305604,33,'SILVA JARDIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305703,33,'SUMIDOURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305752,33,'TANGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305802,33,'TERESOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3305901,33,'TRAJANO DE MORAES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3306008,33,'TRES RIOS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3306107,33,'VALENÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3306156,33,'VARRE-SAI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3306206,33,'VASSOURAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3306305,33,'VOLTA REDONDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3500105,35,'ADAMANTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3500204,35,'ADOLFO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3500303,35,'AGUAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3500402,35,'AGUAS DA PRATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3500501,35,'AGUAS DE LINDOIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3500550,35,'AGUAS DE SANTA BARBARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3500600,35,'AGUAS DE SAO PEDRO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3500709,35,'AGUDOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3500758,35,'ALAMBARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3500808,35,'ALFREDO MARCONDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3500907,35,'ALTAIR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3501004,35,'ALTINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3501103,35,'ALTO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3501152,35,'ALUMINIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3501202,35,'ALVARES FLORENCE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3501301,35,'ALVARES MACHADO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3501400,35,'ALVARO DE CARVALHO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3501509,35,'ALVINLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3501608,35,'AMERICANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3501707,35,'AMERICO BRASILIENSE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3501806,35,'AMERICO DE CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3501905,35,'AMPARO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3502002,35,'ANALANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3502101,35,'ANDRADINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3502200,35,'ANGATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3502309,35,'ANHEMBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3502408,35,'ANHUMAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3502507,35,'APARECIDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3502606,35,'APARECIDA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3502705,35,'APIAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3502754,35,'ARAÇARIGUAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3502804,35,'ARAÇATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3502903,35,'ARAÇOIABA DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503000,35,'ARAMINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503109,35,'ARANDU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503158,35,'ARAPEI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503208,35,'ARARAQUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503307,35,'ARARAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503356,35,'ARCO-IRIS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503406,35,'AREALVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503505,35,'AREIAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503604,35,'AREIOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503703,35,'ARIRANHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503802,35,'ARTUR NOGUEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503901,35,'ARUJA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3503950,35,'ASPASIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3504008,35,'ASSIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3504107,35,'ATIBAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3504206,35,'AURIFLAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3504305,35,'AVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3504404,35,'AVANHANDAVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3504503,35,'AVARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3504602,35,'BADY BASSITT',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3504701,35,'BALBINOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3504800,35,'BALSAMO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3504909,35,'BANANAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3505005,35,'BARAO DE ANTONINA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3505104,35,'BARBOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3505203,35,'BARIRI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3505302,35,'BARRA BONITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3505351,35,'BARRA DO CHAPEU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3505401,35,'BARRA DO TURVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3505500,35,'BARRETOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3505609,35,'BARRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3505708,35,'BARUERI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3505807,35,'BASTOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3505906,35,'BATATAIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3506003,35,'BAURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3506102,35,'BEBEDOURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3506201,35,'BENTO DE ABREU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3506300,35,'BERNARDINO DE CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3506359,35,'BERTIOGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3506409,35,'BILAC',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3506508,35,'BIRIGUI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3506607,35,'BIRITIBA-MIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3506706,35,'BOA ESPERANÇA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3506805,35,'BOCAINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3506904,35,'BOFETE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507001,35,'BOITUVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507100,35,'BOM JESUS DOS PERDOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507159,35,'BOM SUCESSO DE ITARARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507209,35,'BORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507308,35,'BORACEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507407,35,'BORBOREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507456,35,'BOREBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507506,35,'BOTUCATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507605,35,'BRAGANÇA PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507704,35,'BRAUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507753,35,'BREJO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507803,35,'BRODOWSKI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3507902,35,'BROTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3508009,35,'BURI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3508108,35,'BURITAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3508207,35,'BURITIZAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3508306,35,'CABRALIA PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3508405,35,'CABREUVA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3508504,35,'CAÇAPAVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3508603,35,'CACHOEIRA PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3508702,35,'CACONDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3508801,35,'CAFELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3508900,35,'CAIABU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509007,35,'CAIEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509106,35,'CAIUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509205,35,'CAJAMAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509254,35,'CAJATI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509304,35,'CAJOBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509403,35,'CAJURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509452,35,'CAMPINA DO MONTE ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509502,35,'CAMPINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509601,35,'CAMPO LIMPO PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509700,35,'CAMPOS DO JORDAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509809,35,'CAMPOS NOVOS PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509908,35,'CANANEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3509957,35,'CANAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3510005,35,'CANDIDO MOTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3510104,35,'CANDIDO RODRIGUES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3510153,35,'CANITAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3510203,35,'CAPAO BONITO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3510302,35,'CAPELA DO ALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3510401,35,'CAPIVARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3510500,35,'CARAGUATATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3510609,35,'CARAPICUIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3510708,35,'CARDOSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3510807,35,'CASA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3510906,35,'CASSIA DOS COQUEIROS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3511003,35,'CASTILHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3511102,35,'CATANDUVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3511201,35,'CATIGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3511300,35,'CEDRAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3511409,35,'CERQUEIRA CESAR',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3511508,35,'CERQUILHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3511607,35,'CESARIO LANGE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3511706,35,'CHARQUEADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3511904,35,'CLEMENTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3512001,35,'COLINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3512100,35,'COLOMBIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3512209,35,'CONCHAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3512308,35,'CONCHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3512407,35,'CORDEIROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3512506,35,'COROADOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3512605,35,'CORONEL MACEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3512704,35,'CORUMBATAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3512803,35,'COSMOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3512902,35,'COSMORAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3513009,35,'COTIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3513108,35,'CRAVINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3513207,35,'CRISTAIS PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3513306,35,'CRUZALIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3513405,35,'CRUZEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3513504,35,'CUBATAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3513603,35,'CUNHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3513702,35,'DESCALVADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3513801,35,'DIADEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3513850,35,'DIRCE REIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3513900,35,'DIVINOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3514007,35,'DOBRADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3514106,35,'DOIS CORREGOS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3514205,35,'DOLCINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3514304,35,'DOURADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3514403,35,'DRACENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3514502,35,'DUARTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3514601,35,'DUMONT',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3514700,35,'ECHAPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3514809,35,'ELDORADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3514908,35,'ELIAS FAUSTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3514924,35,'ELISIARIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3514957,35,'EMBAUBA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515004,35,'EMBU DAS ARTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515103,35,'EMBU-GUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515129,35,'EMILIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515152,35,'ENGENHEIRO COELHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515186,35,'ESPIRITO SANTO DO PINHAL',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515194,35,'ESPIRITO SANTO DO TURVO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515202,35,'ESTRELA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515301,35,'ESTRELA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515350,35,'EUCLIDES DA CUNHA PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515400,35,'FARTURA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515509,35,'FERNANDOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515608,35,'FERNANDO PRESTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515657,35,'FERNAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515707,35,'FERRAZ DE VASCONCELOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515806,35,'FLORA RICA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3515905,35,'FLOREAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3516002,35,'FLORIDA PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3516101,35,'FLORINIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3516200,35,'FRANCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3516309,35,'FRANCISCO MORATO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3516408,35,'FRANCO DA ROCHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3516507,35,'GABRIEL MONTEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3516606,35,'GALIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3516705,35,'GARÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3516804,35,'GASTAO VIDIGAL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3516853,35,'GAVIAO PEIXOTO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3516903,35,'GENERAL SALGADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3517000,35,'GETULINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3517109,35,'GLICERIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3517208,35,'GUAIÇARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3517307,35,'GUAIMBE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3517406,35,'GUAIRA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3517505,35,'GUAPIAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3517604,35,'GUAPIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3517703,35,'GUARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3517802,35,'GUARAÇAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3517901,35,'GUARACI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3518008,35,'GUARANI D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3518107,35,'GUARANTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3518206,35,'GUARARAPES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3518305,35,'GUARAREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3518404,35,'GUARATINGUETA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3518503,35,'GUAREI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3518602,35,'GUARIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3518701,35,'GUARUJA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3518800,35,'GUARULHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3518859,35,'GUATAPARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3518909,35,'GUZOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519006,35,'HERCULANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519055,35,'HOLAMBRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519071,35,'HORTOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519105,35,'IACANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519204,35,'IACRI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519253,35,'IARAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519303,35,'IBATE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519402,35,'IBIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519501,35,'IBIRAREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519600,35,'IBITINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519709,35,'IBIUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519808,35,'ICEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3519907,35,'IEPE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3520004,35,'IGARAÇU DO TIETE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3520103,35,'IGARAPAVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3520202,35,'IGARATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3520301,35,'IGUAPE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3520400,35,'ILHABELA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3520426,35,'ILHA COMPRIDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3520442,35,'ILHA SOLTEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3520509,35,'INDAIATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3520608,35,'INDIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3520707,35,'INDIAPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3520806,35,'INUBIA PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3520905,35,'IPAUSSU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3521002,35,'IPERO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3521101,35,'IPEUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3521150,35,'IPIGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3521200,35,'IPORANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3521309,35,'IPUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3521408,35,'IRACEMAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3521507,35,'IRAPUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3521606,35,'IRAPURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3521705,35,'ITABERA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3521804,35,'ITAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3521903,35,'ITAJOBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3522000,35,'ITAJU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3522109,35,'ITANHAEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3522158,35,'ITAOCA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3522208,35,'ITAPECERICA DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3522307,35,'ITAPETININGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3522406,35,'ITAPEVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3522505,35,'ITAPEVI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3522604,35,'ITAPIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3522653,35,'ITAPIRAPUA PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3522703,35,'ITAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3522802,35,'ITAPORANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3522901,35,'ITAPUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3523008,35,'ITAPURA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3523107,35,'ITAQUAQUECETUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3523206,35,'ITARARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3523305,35,'ITARIRI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3523404,35,'ITATIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3523503,35,'ITATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3523602,35,'ITIRAPINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3523701,35,'ITIRAPUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3523800,35,'ITOBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3523909,35,'ITU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3524006,35,'ITUPEVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3524105,35,'ITUVERAVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3524204,35,'JABORANDI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3524303,35,'JABOTICABAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3524402,35,'JACAREI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3524501,35,'JACI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3524600,35,'JACUPIRANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3524709,35,'JAGUARIUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3524808,35,'JALES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3524907,35,'JAMBEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3525003,35,'JANDIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3525102,35,'JARDINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3525201,35,'JARINU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3525300,35,'JAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3525409,35,'JERIQUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3525508,35,'JOANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3525607,35,'JOAO RAMALHO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3525706,35,'JOSE BONIFACIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3525805,35,'JULIO MESQUITA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3525854,35,'JUMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3525904,35,'JUNDIAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3526001,35,'JUNQUEIROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3526100,35,'JUQUIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3526209,35,'JUQUITIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3526308,35,'LAGOINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3526407,35,'LARANJAL PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3526506,35,'LAVINIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3526605,35,'LAVRINHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3526704,35,'LEME',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3526803,35,'LENÇOIS PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3526902,35,'LIMEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3527009,35,'LINDOIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3527108,35,'LINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3527207,35,'LORENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3527256,35,'LOURDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3527306,35,'LOUVEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3527405,35,'LUCELIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3527504,35,'LUCIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3527603,35,'LUIS ANTONIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3527702,35,'LUIZIANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3527801,35,'LUPERCIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3527900,35,'LUTECIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3528007,35,'MACATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3528106,35,'MACAUBAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3528205,35,'MACEDONIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3528304,35,'MAGDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3528403,35,'MAIRINQUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3528502,35,'MAIRIPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3528601,35,'MANDURI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3528700,35,'MARABA PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3528809,35,'MARACAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3528858,35,'MARAPOAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3528908,35,'MARIAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3529005,35,'MARILIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3529104,35,'MARINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3529203,35,'MARTINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3529302,35,'MATAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3529401,35,'MAUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3529500,35,'MENDONÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3529609,35,'MERIDIANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3529658,35,'MESOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3529708,35,'MIGUELOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3529807,35,'MINEIROS DO TIETE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3529906,35,'MIRACATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3530003,35,'MIRA ESTRELA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3530102,35,'MIRANDOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3530201,35,'MIRANTE DO PARANAPANEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3530300,35,'MIRASSOL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3530409,35,'MIRASSOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3530508,35,'MOCOCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3530607,35,'MOGI DAS CRUZES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3530706,35,'MOGI GUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3530805,35,'MOGI MIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3530904,35,'MOMBUCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3531001,35,'MONÇOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3531100,35,'MONGAGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3531209,35,'MONTE ALEGRE DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3531308,35,'MONTE ALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3531407,35,'MONTE APRAZIVEL',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3531506,35,'MONTE AZUL PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3531605,35,'MONTE CASTELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3531704,35,'MONTEIRO LOBATO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3531803,35,'MONTE MOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3531902,35,'MORRO AGUDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532009,35,'MORUNGABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532058,35,'MOTUCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532108,35,'MURUTINGA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532157,35,'NANTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532207,35,'NARANDIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532306,35,'NATIVIDADE DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532405,35,'NAZARE PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532504,35,'NEVES PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532603,35,'NHANDEARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532702,35,'NIPOA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532801,35,'NOVA ALIANÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532827,35,'NOVA CAMPINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532843,35,'NOVA CANAA PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532868,35,'NOVA CASTILHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3532900,35,'NOVA EUROPA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3533007,35,'NOVA GRANADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3533106,35,'NOVA GUATAPORANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3533205,35,'NOVA INDEPENDENCIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3533254,35,'NOVAIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3533304,35,'NOVA LUZITANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3533403,35,'NOVA ODESSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3533502,35,'NOVO HORIZONTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3533601,35,'NUPORANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3533700,35,'OCAUÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3533809,35,'OLEO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3533908,35,'OLIMPIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3534005,35,'ONDA VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3534104,35,'ORIENTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3534203,35,'ORINDIUVA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3534302,35,'ORLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3534401,35,'OSASCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3534500,35,'OSCAR BRESSANE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3534609,35,'OSVALDO CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3534708,35,'OURINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3534757,35,'OUROESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3534807,35,'OURO VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3534906,35,'PACAEMBU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3535002,35,'PALESTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3535101,35,'PALMARES PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3535200,35,'PALMEIRA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3535309,35,'PALMITAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3535408,35,'PANORAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3535507,35,'PARAGUAÇU PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3535606,35,'PARAIBUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3535705,35,'PARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3535804,35,'PARANAPANEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3535903,35,'PARANAPUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3536000,35,'PARAPUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3536109,35,'PARDINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3536208,35,'PARIQUERA-AÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3536257,35,'PARISI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3536307,35,'PATROCINIO PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3536406,35,'PAULICEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3536505,35,'PAULINIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3536570,35,'PAULISTANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3536604,35,'PAULO DE FARIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3536703,35,'PEDERNEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3536802,35,'PEDRA BELA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3536901,35,'PEDRANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3537008,35,'PEDREGULHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3537107,35,'PEDREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3537156,35,'PEDRINHAS PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3537206,35,'PEDRO DE TOLEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3537305,35,'PENAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3537404,35,'PEREIRA BARRETO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3537503,35,'PEREIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3537602,35,'PERUIBE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3537701,35,'PIACATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3537800,35,'PIEDADE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3537909,35,'PILAR DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3538006,35,'PINDAMONHANGABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3538105,35,'PINDORAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3538204,35,'PINHALZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3538303,35,'PIQUEROBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3538501,35,'PIQUETE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3538600,35,'PIRACAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3538709,35,'PIRACICABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3538808,35,'PIRAJU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3538907,35,'PIRAJUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3539004,35,'PIRANGI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3539103,35,'PIRAPORA DO BOM JESUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3539202,35,'PIRAPOZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3539301,35,'PIRASSUNUNGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3539400,35,'PIRATININGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3539509,35,'PITANGUEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3539608,35,'PLANALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3539707,35,'PLATINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3539806,35,'POA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3539905,35,'POLONI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540002,35,'POMPEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540101,35,'PONGAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540200,35,'PONTAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540259,35,'PONTALINDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540309,35,'PONTES GESTAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540408,35,'POPULINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540507,35,'PORANGABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540606,35,'PORTO FELIZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540705,35,'PORTO FERREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540754,35,'POTIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540804,35,'POTIRENDABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540853,35,'PRACINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3540903,35,'PRADOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3541000,35,'PRAIA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3541059,35,'PRATANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3541109,35,'PRESIDENTE ALVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3541208,35,'PRESIDENTE BERNARDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3541307,35,'PRESIDENTE EPITACIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3541406,35,'PRESIDENTE PRUDENTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3541505,35,'PRESIDENTE VENCESLAU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3541604,35,'PROMISSAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3541653,35,'QUADRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3541703,35,'QUATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3541802,35,'QUEIROZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3541901,35,'QUELUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3542008,35,'QUINTANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3542107,35,'RAFARD',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3542206,35,'RANCHARIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3542305,35,'REDENÇAO DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3542404,35,'REGENTE FEIJO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3542503,35,'REGINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3542602,35,'REGISTRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3542701,35,'RESTINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3542800,35,'RIBEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3542909,35,'RIBEIRAO BONITO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3543006,35,'RIBEIRAO BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3543105,35,'RIBEIRAO CORRENTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3543204,35,'RIBEIRAO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3543238,35,'RIBEIRAO DOS INDIOS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3543253,35,'RIBEIRAO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3543303,35,'RIBEIRAO PIRES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3543402,35,'RIBEIRAO PRETO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3543501,35,'RIVERSUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3543600,35,'RIFAINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3543709,35,'RINCAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3543808,35,'RINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3543907,35,'RIO CLARO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3544004,35,'RIO DAS PEDRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3544103,35,'RIO GRANDE DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3544202,35,'RIOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3544251,35,'ROSANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3544301,35,'ROSEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3544400,35,'RUBIACEA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3544509,35,'RUBINEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3544608,35,'SABINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3544707,35,'SAGRES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3544806,35,'SALES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3544905,35,'SALES OLIVEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3545001,35,'SALESOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3545100,35,'SALMOURAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3545159,35,'SALTINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3545209,35,'SALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3545308,35,'SALTO DE PIRAPORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3545407,35,'SALTO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3545506,35,'SANDOVALINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3545605,35,'SANTA ADELIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3545704,35,'SANTA ALBERTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3545803,35,'SANTA BARBARA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3546009,35,'SANTA BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3546108,35,'SANTA CLARA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3546207,35,'SANTA CRUZ DA CONCEIÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3546256,35,'SANTA CRUZ DA ESPERANÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3546306,35,'SANTA CRUZ DAS PALMEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3546405,35,'SANTA CRUZ DO RIO PARDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3546504,35,'SANTA ERNESTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3546603,35,'SANTA FE DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3546702,35,'SANTA GERTRUDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3546801,35,'SANTA ISABEL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3546900,35,'SANTA LUCIA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3547007,35,'SANTA MARIA DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3547106,35,'SANTA MERCEDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3547205,35,'SANTANA DA PONTE PENSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3547304,35,'SANTANA DE PARNAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3547403,35,'SANTA RITA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3547502,35,'SANTA RITA DO PASSA QUATRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3547601,35,'SANTA ROSA DE VITERBO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3547650,35,'SANTA SALETE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3547700,35,'SANTO ANASTACIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3547809,35,'SANTO ANDRE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3547908,35,'SANTO ANTONIO DA ALEGRIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3548005,35,'SANTO ANTONIO DE POSSE',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3548054,35,'SANTO ANTONIO DO ARACANGUA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3548104,35,'SANTO ANTONIO DO JARDIM',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3548203,35,'SANTO ANTONIO DO PINHAL',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3548302,35,'SANTO EXPEDITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3548401,35,'SANTOPOLIS DO AGUAPEI',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3548500,35,'SANTOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3548609,35,'SAO BENTO DO SAPUCAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3548708,35,'SAO BERNARDO DO CAMPO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3548807,35,'SAO CAETANO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3548906,35,'SAO CARLOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3549003,35,'SAO FRANCISCO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3549102,35,'SAO JOAO DA BOA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3549201,35,'SAO JOAO DAS DUAS PONTES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3549250,35,'SAO JOAO DE IRACEMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3549300,35,'SAO JOAO DO PAU D''ALHO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3549409,35,'SAO JOAQUIM DA BARRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3549508,35,'SAO JOSE DA BELA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3549607,35,'SAO JOSE DO BARREIRO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3549706,35,'SAO JOSE DO RIO PARDO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3549805,35,'SAO JOSE DO RIO PRETO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3549904,35,'SAO JOSE DOS CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3549953,35,'SAO LOURENÇO DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3550001,35,'SAO LUIS DO PARAITINGA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3550100,35,'SAO MANUEL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3550209,35,'SAO MIGUEL ARCANJO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3550308,35,'SAO PAULO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3550407,35,'SAO PEDRO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3550506,35,'SAO PEDRO DO TURVO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3550605,35,'SAO ROQUE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3550704,35,'SAO SEBASTIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3550803,35,'SAO SEBASTIAO DA GRAMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3550902,35,'SAO SIMAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3551009,35,'SAO VICENTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3551108,35,'SARAPUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3551207,35,'SARUTAIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3551306,35,'SEBASTIANOPOLIS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3551405,35,'SERRA AZUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3551504,35,'SERRANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3551603,35,'SERRA NEGRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3551702,35,'SERTAOZINHO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3551801,35,'SETE BARRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3551900,35,'SEVERINIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3552007,35,'SILVEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3552106,35,'SOCORRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3552205,35,'SOROCABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3552304,35,'SUD MENNUCCI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3552403,35,'SUMARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3552502,35,'SUZANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3552551,35,'SUZANAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3552601,35,'TABAPUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3552700,35,'TABATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3552809,35,'TABOAO DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3552908,35,'TACIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553005,35,'TAGUAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553104,35,'TAIAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553203,35,'TAIUVA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553302,35,'TAMBAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553401,35,'TANABI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553500,35,'TAPIRAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553609,35,'TAPIRATIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553658,35,'TAQUARAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553708,35,'TAQUARITINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553807,35,'TAQUARITUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553856,35,'TAQUARIVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553906,35,'TARABAI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3553955,35,'TARUMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554003,35,'TATUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554102,35,'TAUBATE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554201,35,'TEJUPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554300,35,'TEODORO SAMPAIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554409,35,'TERRA ROXA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554508,35,'TIETE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554607,35,'TIMBURI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554656,35,'TORRE DE PEDRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554706,35,'TORRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554755,35,'TRABIJU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554805,35,'TREMEMBE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554904,35,'TRES FRONTEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3554953,35,'TUIUTI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3555000,35,'TUPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3555109,35,'TUPI PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3555208,35,'TURIUBA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3555307,35,'TURMALINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3555356,35,'UBARANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3555406,35,'UBATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3555505,35,'UBIRAJARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3555604,35,'UCHOA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3555703,35,'UNIAO PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3555802,35,'URANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3555901,35,'URU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556008,35,'URUPES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556107,35,'VALENTIM GENTIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556206,35,'VALINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556305,35,'VALPARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556354,35,'VARGEM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556404,35,'VARGEM GRANDE DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556453,35,'VARGEM GRANDE PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556503,35,'VARZEA PAULISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556602,35,'VERA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556701,35,'VINHEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556800,35,'VIRADOURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556909,35,'VISTA ALEGRE DO ALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3556958,35,'VITORIA BRASIL',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3557006,35,'VOTORANTIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3557105,35,'VOTUPORANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3557154,35,'ZACARIAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3557204,35,'CHAVANTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (3557303,35,'ESTIVA GERBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4100103,41,'ABATIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4100202,41,'ADRIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4100301,41,'AGUDOS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4100400,41,'ALMIRANTE TAMANDARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4100459,41,'ALTAMIRA DO PARANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4100509,41,'ALTONIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4100608,41,'ALTO PARANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4100707,41,'ALTO PIQUIRI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4100806,41,'ALVORADA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4100905,41,'AMAPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101002,41,'AMPERE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101051,41,'ANAHY',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101101,41,'ANDIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101150,41,'ANGULO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101200,41,'ANTONINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101309,41,'ANTONIO OLINTO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101408,41,'APUCARANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101507,41,'ARAPONGAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101606,41,'ARAPOTI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101655,41,'ARAPUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101705,41,'ARARUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101804,41,'ARAUCARIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101853,41,'ARIRANHA DO IVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4101903,41,'ASSAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4102000,41,'ASSIS CHATEAUBRIAND',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4102109,41,'ASTORGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4102208,41,'ATALAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4102307,41,'BALSA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4102406,41,'BANDEIRANTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4102505,41,'BARBOSA FERRAZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4102604,41,'BARRACAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4102703,41,'BARRA DO JACARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4102752,41,'BELA VISTA DA CAROBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4102802,41,'BELA VISTA DO PARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4102901,41,'BITURUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103008,41,'BOA ESPERANÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103024,41,'BOA ESPERANÇA DO IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103040,41,'BOA VENTURA DE SAO ROQUE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103057,41,'BOA VISTA DA APARECIDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103107,41,'BOCAIUVA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103156,41,'BOM JESUS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103206,41,'BOM SUCESSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103222,41,'BOM SUCESSO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103305,41,'BORRAZOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103354,41,'BRAGANEY',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103370,41,'BRASILANDIA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103404,41,'CAFEARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103453,41,'CAFELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103479,41,'CAFEZAL DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103503,41,'CALIFORNIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103602,41,'CAMBARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103701,41,'CAMBE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103800,41,'CAMBIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103909,41,'CAMPINA DA LAGOA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4103958,41,'CAMPINA DO SIMAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104006,41,'CAMPINA GRANDE DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104055,41,'CAMPO BONITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104105,41,'CAMPO DO TENENTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104204,41,'CAMPO LARGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104253,41,'CAMPO MAGRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104303,41,'CAMPO MOURAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104402,41,'CANDIDO DE ABREU',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104428,41,'CANDOI',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104451,41,'CANTAGALO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104501,41,'CAPANEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104600,41,'CAPITAO LEONIDAS MARQUES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104659,41,'CARAMBEI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104709,41,'CARLOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104808,41,'CASCAVEL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4104907,41,'CASTRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4105003,41,'CATANDUVAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4105102,41,'CENTENARIO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4105201,41,'CERRO AZUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4105300,41,'CEU AZUL',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4105409,41,'CHOPINZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4105508,41,'CIANORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4105607,41,'CIDADE GAUCHA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4105706,41,'CLEVELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4105805,41,'COLOMBO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4105904,41,'COLORADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106001,41,'CONGONHINHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106100,41,'CONSELHEIRO MAIRINCK',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106209,41,'CONTENDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106308,41,'CORBELIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106407,41,'CORNELIO PROCOPIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106456,41,'CORONEL DOMINGOS SOARES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106506,41,'CORONEL VIVIDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106555,41,'CORUMBATAI DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106571,41,'CRUZEIRO DO IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106605,41,'CRUZEIRO DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106704,41,'CRUZEIRO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106803,41,'CRUZ MACHADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106852,41,'CRUZMALTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4106902,41,'CURITIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107009,41,'CURIUVA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107108,41,'DIAMANTE DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107124,41,'DIAMANTE DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107157,41,'DIAMANTE D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107207,41,'DOIS VIZINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107256,41,'DOURADINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107306,41,'DOUTOR CAMARGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107405,41,'ENEAS MARQUES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107504,41,'ENGENHEIRO BELTRAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107520,41,'ESPERANÇA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107538,41,'ENTRE RIOS DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107546,41,'ESPIGAO ALTO DO IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107553,41,'FAROL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107603,41,'FAXINAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107652,41,'FAZENDA RIO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107702,41,'FENIX',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107736,41,'FERNANDES PINHEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107751,41,'FIGUEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107801,41,'FLORAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107850,41,'FLOR DA SERRA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4107900,41,'FLORESTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108007,41,'FLORESTOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108106,41,'FLORIDA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108205,41,'FORMOSA DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108304,41,'FOZ DO IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108320,41,'FRANCISCO ALVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108403,41,'FRANCISCO BELTRAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108452,41,'FOZ DO JORDAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108502,41,'GENERAL CARNEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108551,41,'GODOY MOREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108601,41,'GOIOERE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108650,41,'GOIOXIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108700,41,'GRANDES RIOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108809,41,'GUAIRA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108908,41,'GUAIRAÇA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4108957,41,'GUAMIRANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4109005,41,'GUAPIRAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4109104,41,'GUAPOREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4109203,41,'GUARACI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4109302,41,'GUARANIAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4109401,41,'GUARAPUAVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4109500,41,'GUARAQUEÇABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4109609,41,'GUARATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4109658,41,'HONORIO SERPA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4109708,41,'IBAITI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4109757,41,'IBEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4109807,41,'IBIPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4109906,41,'ICARAIMA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110003,41,'IGUARAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110052,41,'IGUATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110078,41,'IMBAU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110102,41,'IMBITUVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110201,41,'INACIO MARTINS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110300,41,'INAJA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110409,41,'INDIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110508,41,'IPIRANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110607,41,'IPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110656,41,'IRACEMA DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110706,41,'IRATI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110805,41,'IRETAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110904,41,'ITAGUAJE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4110953,41,'ITAIPULANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4111001,41,'ITAMBARACA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4111100,41,'ITAMBE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4111209,41,'ITAPEJARA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4111258,41,'ITAPERUÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4111308,41,'ITAUNA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4111407,41,'IVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4111506,41,'IVAIPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4111555,41,'IVATE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4111605,41,'IVATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4111704,41,'JABOTI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4111803,41,'JACAREZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4111902,41,'JAGUAPITA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4112009,41,'JAGUARIAIVA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4112108,41,'JANDAIA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4112207,41,'JANIOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4112306,41,'JAPIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4112405,41,'JAPURA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4112504,41,'JARDIM ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4112603,41,'JARDIM OLINDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4112702,41,'JATAIZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4112751,41,'JESUITAS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4112801,41,'JOAQUIM TAVORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4112900,41,'JUNDIAI DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4112959,41,'JURANDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113007,41,'JUSSARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113106,41,'KALORE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113205,41,'LAPA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113254,41,'LARANJAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113304,41,'LARANJEIRAS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113403,41,'LEOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113429,41,'LIDIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113452,41,'LINDOESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113502,41,'LOANDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113601,41,'LOBATO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113700,41,'LONDRINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113734,41,'LUIZIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113759,41,'LUNARDELLI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113809,41,'LUPIONOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4113908,41,'MALLET',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4114005,41,'MAMBORE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4114104,41,'MANDAGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4114203,41,'MANDAGUARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4114302,41,'MANDIRITUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4114351,41,'MANFRINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4114401,41,'MANGUEIRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4114500,41,'MANOEL RIBAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4114609,41,'MARECHAL CANDIDO RONDON',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4114708,41,'MARIA HELENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4114807,41,'MARIALVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4114906,41,'MARILANDIA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115002,41,'MARILENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115101,41,'MARILUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115200,41,'MARINGA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115309,41,'MARIOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115358,41,'MARIPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115408,41,'MARMELEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115457,41,'MARQUINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115507,41,'MARUMBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115606,41,'MATELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115705,41,'MATINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115739,41,'MATO RICO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115754,41,'MAUA DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115804,41,'MEDIANEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115853,41,'MERCEDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4115903,41,'MIRADOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4116000,41,'MIRASELVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4116059,41,'MISSAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4116109,41,'MOREIRA SALES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4116208,41,'MORRETES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4116307,41,'MUNHOZ DE MELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4116406,41,'NOSSA SENHORA DAS GRAÇAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4116505,41,'NOVA ALIANÇA DO IVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4116604,41,'NOVA AMERICA DA COLINA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4116703,41,'NOVA AURORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4116802,41,'NOVA CANTU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4116901,41,'NOVA ESPERANÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4116950,41,'NOVA ESPERANÇA DO SUDOESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117008,41,'NOVA FATIMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117057,41,'NOVA LARANJEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117107,41,'NOVA LONDRINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117206,41,'NOVA OLIMPIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117214,41,'NOVA SANTA BARBARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117222,41,'NOVA SANTA ROSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117255,41,'NOVA PRATA DO IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117271,41,'NOVA TEBAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117297,41,'NOVO ITACOLOMI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117305,41,'ORTIGUEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117404,41,'OURIZONA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117453,41,'OURO VERDE DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117503,41,'PAIÇANDU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117602,41,'PALMAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117701,41,'PALMEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117800,41,'PALMITAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4117909,41,'PALOTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4118006,41,'PARAISO DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4118105,41,'PARANACITY',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4118204,41,'PARANAGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4118303,41,'PARANAPOEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4118402,41,'PARANAVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4118451,41,'PATO BRAGADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4118501,41,'PATO BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4118600,41,'PAULA FREITAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4118709,41,'PAULO FRONTIN',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4118808,41,'PEABIRU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4118857,41,'PEROBAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4118907,41,'PEROLA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119004,41,'PEROLA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119103,41,'PIEN',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119152,41,'PINHAIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119202,41,'PINHALAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119251,41,'PINHAL DE SAO BENTO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119301,41,'PINHAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119400,41,'PIRAI DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119509,41,'PIRAQUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119608,41,'PITANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119657,41,'PITANGUEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119707,41,'PLANALTINA DO PARANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119806,41,'PLANALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119905,41,'PONTA GROSSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4119954,41,'PONTAL DO PARANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120002,41,'PORECATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120101,41,'PORTO AMAZONAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120150,41,'PORTO BARREIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120200,41,'PORTO RICO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120309,41,'PORTO VITORIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120333,41,'PRADO FERREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120358,41,'PRANCHITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120408,41,'PRESIDENTE CASTELO BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120507,41,'PRIMEIRO DE MAIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120606,41,'PRUDENTOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120655,41,'QUARTO CENTENARIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120705,41,'QUATIGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120804,41,'QUATRO BARRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120853,41,'QUATRO PONTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4120903,41,'QUEDAS DO IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121000,41,'QUERENCIA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121109,41,'QUINTA DO SOL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121208,41,'QUITANDINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121257,41,'RAMILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121307,41,'RANCHO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121356,41,'RANCHO ALEGRE D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121406,41,'REALEZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121505,41,'REBOUÇAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121604,41,'RENASCENÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121703,41,'RESERVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121752,41,'RESERVA DO IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121802,41,'RIBEIRAO CLARO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4121901,41,'RIBEIRAO DO PINHAL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122008,41,'RIO AZUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122107,41,'RIO BOM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122156,41,'RIO BONITO DO IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122172,41,'RIO BRANCO DO IVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122206,41,'RIO BRANCO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122305,41,'RIO NEGRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122404,41,'ROLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122503,41,'RONCADOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122602,41,'RONDON',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122651,41,'ROSARIO DO IVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122701,41,'SABAUDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122800,41,'SALGADO FILHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4122909,41,'SALTO DO ITARARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123006,41,'SALTO DO LONTRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123105,41,'SANTA AMELIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123204,41,'SANTA CECILIA DO PAVAO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123303,41,'SANTA CRUZ DE MONTE CASTELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123402,41,'SANTA FE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123501,41,'SANTA HELENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123600,41,'SANTA INES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123709,41,'SANTA ISABEL DO IVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123808,41,'SANTA IZABEL DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123824,41,'SANTA LUCIA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123857,41,'SANTA MARIA DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123907,41,'SANTA MARIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4123956,41,'SANTA MONICA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4124004,41,'SANTANA DO ITARARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4124020,41,'SANTA TEREZA DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4124053,41,'SANTA TEREZINHA DE ITAIPU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4124103,41,'SANTO ANTONIO DA PLATINA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4124202,41,'SANTO ANTONIO DO CAIUA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4124301,41,'SANTO ANTONIO DO PARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4124400,41,'SANTO ANTONIO DO SUDOESTE',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4124509,41,'SANTO INACIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4124608,41,'SAO CARLOS DO IVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4124707,41,'SAO JERONIMO DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4124806,41,'SAO JOAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4124905,41,'SAO JOAO DO CAIUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125001,41,'SAO JOAO DO IVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125100,41,'SAO JOAO DO TRIUNFO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125209,41,'SAO JORGE D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125308,41,'SAO JORGE DO IVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125357,41,'SAO JORGE DO PATROCINIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125407,41,'SAO JOSE DA BOA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125456,41,'SAO JOSE DAS PALMEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125506,41,'SAO JOSE DOS PINHAIS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125555,41,'SAO MANOEL DO PARANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125605,41,'SAO MATEUS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125704,41,'SAO MIGUEL DO IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125753,41,'SAO PEDRO DO IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125803,41,'SAO PEDRO DO IVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4125902,41,'SAO PEDRO DO PARANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126009,41,'SAO SEBASTIAO DA AMOREIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126108,41,'SAO TOME',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126207,41,'SAPOPEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126256,41,'SARANDI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126272,41,'SAUDADE DO IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126306,41,'SENGES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126355,41,'SERRANOPOLIS DO IGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126405,41,'SERTANEJA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126504,41,'SERTANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126603,41,'SIQUEIRA CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126652,41,'SULINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126678,41,'TAMARANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126702,41,'TAMBOARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126801,41,'TAPEJARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4126900,41,'TAPIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127007,41,'TEIXEIRA SOARES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127106,41,'TELEMACO BORBA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127205,41,'TERRA BOA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127304,41,'TERRA RICA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127403,41,'TERRA ROXA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127502,41,'TIBAGI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127601,41,'TIJUCAS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127700,41,'TOLEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127809,41,'TOMAZINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127858,41,'TRES BARRAS DO PARANA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127882,41,'TUNAS DO PARANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127908,41,'TUNEIRAS DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127957,41,'TUPASSI',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4127965,41,'TURVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128005,41,'UBIRATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128104,41,'UMUARAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128203,41,'UNIAO DA VITORIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128302,41,'UNIFLOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128401,41,'URAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128500,41,'WENCESLAU BRAZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128534,41,'VENTANIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128559,41,'VERA CRUZ DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128609,41,'VERE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128625,41,'ALTO PARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128633,41,'DOUTOR ULYSSES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128658,41,'VIRMOND',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128708,41,'VITORINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4128807,41,'XAMBRE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4200051,42,'ABDON BATISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4200101,42,'ABELARDO LUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4200200,42,'AGROLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4200309,42,'AGRONOMICA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4200408,42,'AGUA DOCE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4200507,42,'AGUAS DE CHAPECO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4200556,42,'AGUAS FRIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4200606,42,'AGUAS MORNAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4200705,42,'ALFREDO WAGNER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4200754,42,'ALTO BELA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4200804,42,'ANCHIETA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4200903,42,'ANGELINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201000,42,'ANITA GARIBALDI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201109,42,'ANITAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201208,42,'ANTONIO CARLOS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201257,42,'APIUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201273,42,'ARABUTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201307,42,'ARAQUARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201406,42,'ARARANGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201505,42,'ARMAZEM',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201604,42,'ARROIO TRINTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201653,42,'ARVOREDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201703,42,'ASCURRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201802,42,'ATALANTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201901,42,'AURORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4201950,42,'BALNEARIO ARROIO DO SILVA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202008,42,'BALNEARIO CAMBORIU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202057,42,'BALNEARIO BARRA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202073,42,'BALNEARIO GAIVOTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202081,42,'BANDEIRANTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202099,42,'BARRA BONITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202107,42,'BARRA VELHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202131,42,'BELA VISTA DO TOLDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202156,42,'BELMONTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202206,42,'BENEDITO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202305,42,'BIGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202404,42,'BLUMENAU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202438,42,'BOCAINA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202453,42,'BOMBINHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202503,42,'BOM JARDIM DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202537,42,'BOM JESUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202578,42,'BOM JESUS DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202602,42,'BOM RETIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202701,42,'BOTUVERA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202800,42,'BRAÇO DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202859,42,'BRAÇO DO TROMBUDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202875,42,'BRUNOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4202909,42,'BRUSQUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203006,42,'CAÇADOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203105,42,'CAIBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203154,42,'CALMON',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203204,42,'CAMBORIU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203253,42,'CAPAO ALTO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203303,42,'CAMPO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203402,42,'CAMPO BELO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203501,42,'CAMPO ERE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203600,42,'CAMPOS NOVOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203709,42,'CANELINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203808,42,'CANOINHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203907,42,'CAPINZAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4203956,42,'CAPIVARI DE BAIXO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204004,42,'CATANDUVAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204103,42,'CAXAMBU DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204152,42,'CELSO RAMOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204178,42,'CERRO NEGRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204194,42,'CHAPADAO DO LAGEADO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204202,42,'CHAPECO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204251,42,'COCAL DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204301,42,'CONCORDIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204350,42,'CORDILHEIRA ALTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204400,42,'CORONEL FREITAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204459,42,'CORONEL MARTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204509,42,'CORUPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204558,42,'CORREIA PINTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204608,42,'CRICIUMA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204707,42,'CUNHA PORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204756,42,'CUNHATAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204806,42,'CURITIBANOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4204905,42,'DESCANSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205001,42,'DIONISIO CERQUEIRA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205100,42,'DONA EMMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205159,42,'DOUTOR PEDRINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205175,42,'ENTRE RIOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205191,42,'ERMO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205209,42,'ERVAL VELHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205308,42,'FAXINAL DOS GUEDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205357,42,'FLOR DO SERTAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205407,42,'FLORIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205431,42,'FORMOSA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205456,42,'FORQUILHINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205506,42,'FRAIBURGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205555,42,'FREI ROGERIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205605,42,'GALVAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205704,42,'GAROPABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205803,42,'GARUVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4205902,42,'GASPAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4206009,42,'GOVERNADOR CELSO RAMOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4206108,42,'GRAO PARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4206207,42,'GRAVATAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4206306,42,'GUABIRUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4206405,42,'GUARACIABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4206504,42,'GUARAMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4206603,42,'GUARUJA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4206652,42,'GUATAMBU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4206702,42,'HERVAL D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4206751,42,'IBIAM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4206801,42,'IBICARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4206900,42,'IBIRAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207007,42,'IÇARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207106,42,'ILHOTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207205,42,'IMARUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207304,42,'IMBITUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207403,42,'IMBUIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207502,42,'INDAIAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207577,42,'IOMERE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207601,42,'IPIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207650,42,'IPORA DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207684,42,'IPUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207700,42,'IPUMIRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207759,42,'IRACEMINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207809,42,'IRANI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207858,42,'IRATI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4207908,42,'IRINEOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4208005,42,'ITA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4208104,42,'ITAIOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4208203,42,'ITAJAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4208302,42,'ITAPEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4208401,42,'ITAPIRANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4208450,42,'ITAPOA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4208500,42,'ITUPORANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4208609,42,'JABORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4208708,42,'JACINTO MACHADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4208807,42,'JAGUARUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4208906,42,'JARAGUA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4208955,42,'JARDINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209003,42,'JOAÇABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209102,42,'JOINVILLE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209151,42,'JOSE BOITEUX',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209177,42,'JUPIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209201,42,'LACERDOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209300,42,'LAGES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209409,42,'LAGUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209458,42,'LAJEADO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209508,42,'LAURENTINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209607,42,'LAURO MULLER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209706,42,'LEBON REGIS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209805,42,'LEOBERTO LEAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209854,42,'LINDOIA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4209904,42,'LONTRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210001,42,'LUIZ ALVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210035,42,'LUZERNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210050,42,'MACIEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210100,42,'MAFRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210209,42,'MAJOR GERCINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210308,42,'MAJOR VIEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210407,42,'MARACAJA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210506,42,'MARAVILHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210555,42,'MAREMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210605,42,'MASSARANDUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210704,42,'MATOS COSTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210803,42,'MELEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210852,42,'MIRIM DOCE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4210902,42,'MODELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211009,42,'MONDAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211058,42,'MONTE CARLO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211108,42,'MONTE CASTELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211207,42,'MORRO DA FUMAÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211256,42,'MORRO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211306,42,'NAVEGANTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211405,42,'NOVA ERECHIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211454,42,'NOVA ITABERABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211504,42,'NOVA TRENTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211603,42,'NOVA VENEZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211652,42,'NOVO HORIZONTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211702,42,'ORLEANS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211751,42,'OTACILIO COSTA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211801,42,'OURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211850,42,'OURO VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211876,42,'PAIAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211892,42,'PAINEL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4211900,42,'PALHOÇA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212007,42,'PALMA SOLA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212056,42,'PALMEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212106,42,'PALMITOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212205,42,'PAPANDUVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212239,42,'PARAISO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212254,42,'PASSO DE TORRES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212270,42,'PASSOS MAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212304,42,'PAULO LOPES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212403,42,'PEDRAS GRANDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212502,42,'PENHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212601,42,'PERITIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212650,42,'PESCARIA BRAVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212700,42,'PETROLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212809,42,'BALNEARIO PIÇARRAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4212908,42,'PINHALZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4213005,42,'PINHEIRO PRETO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4213104,42,'PIRATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4213153,42,'PLANALTO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4213203,42,'POMERODE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4213302,42,'PONTE ALTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4213351,42,'PONTE ALTA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4213401,42,'PONTE SERRADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4213500,42,'PORTO BELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4213609,42,'PORTO UNIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4213708,42,'POUSO REDONDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4213807,42,'PRAIA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4213906,42,'PRESIDENTE CASTELLO BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4214003,42,'PRESIDENTE GETULIO',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4214102,42,'PRESIDENTE NEREU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4214151,42,'PRINCESA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4214201,42,'QUILOMBO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4214300,42,'RANCHO QUEIMADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4214409,42,'RIO DAS ANTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4214508,42,'RIO DO CAMPO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4214607,42,'RIO DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4214706,42,'RIO DOS CEDROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4214805,42,'RIO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4214904,42,'RIO FORTUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215000,42,'RIO NEGRINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215059,42,'RIO RUFINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215075,42,'RIQUEZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215109,42,'RODEIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215208,42,'ROMELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215307,42,'SALETE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215356,42,'SALTINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215406,42,'SALTO VELOSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215455,42,'SANGAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215505,42,'SANTA CECILIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215554,42,'SANTA HELENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215604,42,'SANTA ROSA DE LIMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215653,42,'SANTA ROSA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215679,42,'SANTA TEREZINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215687,42,'SANTA TEREZINHA DO PROGRESSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215695,42,'SANTIAGO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215703,42,'SANTO AMARO DA IMPERATRIZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215752,42,'SAO BERNARDINO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215802,42,'SAO BENTO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4215901,42,'SAO BONIFACIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216008,42,'SAO CARLOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216057,42,'SAO CRISTOVAO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216107,42,'SAO DOMINGOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216206,42,'SAO FRANCISCO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216255,42,'SAO JOAO DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216305,42,'SAO JOAO BATISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216354,42,'SAO JOAO DO ITAPERIU',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216404,42,'SAO JOAO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216503,42,'SAO JOAQUIM',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216602,42,'SAO JOSE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216701,42,'SAO JOSE DO CEDRO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216800,42,'SAO JOSE DO CERRITO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4216909,42,'SAO LOURENÇO DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217006,42,'SAO LUDGERO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217105,42,'SAO MARTINHO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217154,42,'SAO MIGUEL DA BOA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217204,42,'SAO MIGUEL DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217253,42,'SAO PEDRO DE ALCANTARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217303,42,'SAUDADES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217402,42,'SCHROEDER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217501,42,'SEARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217550,42,'SERRA ALTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217600,42,'SIDEROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217709,42,'SOMBRIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217758,42,'SUL BRASIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217808,42,'TAIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217907,42,'TANGARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4217956,42,'TIGRINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218004,42,'TIJUCAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218103,42,'TIMBE DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218202,42,'TIMBO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218251,42,'TIMBO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218301,42,'TRES BARRAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218350,42,'TREVISO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218400,42,'TREZE DE MAIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218509,42,'TREZE TILIAS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218608,42,'TROMBUDO CENTRAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218707,42,'TUBARAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218756,42,'TUNAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218806,42,'TURVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218855,42,'UNIAO DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218905,42,'URUBICI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4218954,42,'URUPEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4219002,42,'URUSSANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4219101,42,'VARGEAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4219150,42,'VARGEM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4219176,42,'VARGEM BONITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4219200,42,'VIDAL RAMOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4219309,42,'VIDEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4219358,42,'VITOR MEIRELES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4219408,42,'WITMARSUM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4219507,42,'XANXERE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4219606,42,'XAVANTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4219705,42,'XAXIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4219853,42,'ZORTEA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4220000,42,'BALNEARIO RINCAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300034,43,'ACEGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300059,43,'AGUA SANTA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300109,43,'AGUDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300208,43,'AJURICABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300307,43,'ALECRIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300406,43,'ALEGRETE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300455,43,'ALEGRIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300471,43,'ALMIRANTE TAMANDARE DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300505,43,'ALPESTRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300554,43,'ALTO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300570,43,'ALTO FELIZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300604,43,'ALVORADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300638,43,'AMARAL FERRADOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300646,43,'AMETISTA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300661,43,'ANDRE DA ROCHA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300703,43,'ANTA GORDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300802,43,'ANTONIO PRADO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300851,43,'ARAMBARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300877,43,'ARARICA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4300901,43,'ARATIBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301008,43,'ARROIO DO MEIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301057,43,'ARROIO DO SAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301073,43,'ARROIO DO PADRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301107,43,'ARROIO DOS RATOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301206,43,'ARROIO DO TIGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301305,43,'ARROIO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301404,43,'ARVOREZINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301503,43,'AUGUSTO PESTANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301552,43,'AUREA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301602,43,'BAGE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301636,43,'BALNEARIO PINHAL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301651,43,'BARAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301701,43,'BARAO DE COTEGIPE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301750,43,'BARAO DO TRIUNFO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301800,43,'BARRACAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301859,43,'BARRA DO GUARITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301875,43,'BARRA DO QUARAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301909,43,'BARRA DO RIBEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301925,43,'BARRA DO RIO AZUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4301958,43,'BARRA FUNDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302006,43,'BARROS CASSAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302055,43,'BENJAMIN CONSTANT DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302105,43,'BENTO GONÇALVES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302154,43,'BOA VISTA DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302204,43,'BOA VISTA DO BURICA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302220,43,'BOA VISTA DO CADEADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302238,43,'BOA VISTA DO INCRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302253,43,'BOA VISTA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302303,43,'BOM JESUS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302352,43,'BOM PRINCIPIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302378,43,'BOM PROGRESSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302402,43,'BOM RETIRO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302451,43,'BOQUEIRAO DO LEAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302501,43,'BOSSOROCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302584,43,'BOZANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302600,43,'BRAGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302659,43,'BROCHIER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302709,43,'BUTIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302808,43,'CAÇAPAVA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4302907,43,'CACEQUI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4303004,43,'CACHOEIRA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4303103,43,'CACHOEIRINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4303202,43,'CACIQUE DOBLE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4303301,43,'CAIBATE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4303400,43,'CAIÇARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4303509,43,'CAMAQUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4303558,43,'CAMARGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4303608,43,'CAMBARA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4303673,43,'CAMPESTRE DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4303707,43,'CAMPINA DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4303806,43,'CAMPINAS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4303905,43,'CAMPO BOM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304002,43,'CAMPO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304101,43,'CAMPOS BORGES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304200,43,'CANDELARIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304309,43,'CANDIDO GODOI',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304358,43,'CANDIOTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304408,43,'CANELA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304507,43,'CANGUÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304606,43,'CANOAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304614,43,'CANUDOS DO VALE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304622,43,'CAPAO BONITO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304630,43,'CAPAO DA CANOA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304655,43,'CAPAO DO CIPO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304663,43,'CAPAO DO LEAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304671,43,'CAPIVARI DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304689,43,'CAPELA DE SANTANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304697,43,'CAPITAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304705,43,'CARAZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304713,43,'CARAA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304804,43,'CARLOS BARBOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304853,43,'CARLOS GOMES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304903,43,'CASCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4304952,43,'CASEIROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305009,43,'CATUIPE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305108,43,'CAXIAS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305116,43,'CENTENARIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305124,43,'CERRITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305132,43,'CERRO BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305157,43,'CERRO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305173,43,'CERRO GRANDE DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305207,43,'CERRO LARGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305306,43,'CHAPADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305355,43,'CHARQUEADAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305371,43,'CHARRUA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305405,43,'CHIAPETTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305439,43,'CHUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305447,43,'CHUVISCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305454,43,'CIDREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305504,43,'CIRIACO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305587,43,'COLINAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305603,43,'COLORADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305702,43,'CONDOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305801,43,'CONSTANTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305835,43,'COQUEIRO BAIXO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305850,43,'COQUEIROS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305871,43,'CORONEL BARROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305900,43,'CORONEL BICACO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305934,43,'CORONEL PILAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305959,43,'COTIPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4305975,43,'COXILHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306007,43,'CRISSIUMAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306056,43,'CRISTAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306072,43,'CRISTAL DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306106,43,'CRUZ ALTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306130,43,'CRUZALTENSE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306205,43,'CRUZEIRO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306304,43,'DAVID CANABARRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306320,43,'DERRUBADAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306353,43,'DEZESSEIS DE NOVEMBRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306379,43,'DILERMANDO DE AGUIAR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306403,43,'DOIS IRMAOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306429,43,'DOIS IRMAOS DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306452,43,'DOIS LAJEADOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306502,43,'DOM FELICIANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306551,43,'DOM PEDRO DE ALCANTARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306601,43,'DOM PEDRITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306700,43,'DONA FRANCISCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306734,43,'DOUTOR MAURICIO CARDOSO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306759,43,'DOUTOR RICARDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306767,43,'ELDORADO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306809,43,'ENCANTADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306908,43,'ENCRUZILHADA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306924,43,'ENGENHO VELHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306932,43,'ENTRE-IJUIS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306957,43,'ENTRE RIOS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4306973,43,'EREBANGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307005,43,'ERECHIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307054,43,'ERNESTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307104,43,'HERVAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307203,43,'ERVAL GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307302,43,'ERVAL SECO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307401,43,'ESMERALDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307450,43,'ESPERANÇA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307500,43,'ESPUMOSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307559,43,'ESTAÇAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307609,43,'ESTANCIA VELHA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307708,43,'ESTEIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307807,43,'ESTRELA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307815,43,'ESTRELA VELHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307831,43,'EUGENIO DE CASTRO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307864,43,'FAGUNDES VARELA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4307906,43,'FARROUPILHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308003,43,'FAXINAL DO SOTURNO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308052,43,'FAXINALZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308078,43,'FAZENDA VILANOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308102,43,'FELIZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308201,43,'FLORES DA CUNHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308250,43,'FLORIANO PEIXOTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308300,43,'FONTOURA XAVIER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308409,43,'FORMIGUEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308433,43,'FORQUETINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308458,43,'FORTALEZA DOS VALOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308508,43,'FREDERICO WESTPHALEN',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308607,43,'GARIBALDI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308656,43,'GARRUCHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308706,43,'GAURAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308805,43,'GENERAL CAMARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308854,43,'GENTIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4308904,43,'GETULIO VARGAS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309001,43,'GIRUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309050,43,'GLORINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309100,43,'GRAMADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309126,43,'GRAMADO DOS LOUREIROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309159,43,'GRAMADO XAVIER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309209,43,'GRAVATAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309258,43,'GUABIJU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309308,43,'GUAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309407,43,'GUAPORE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309506,43,'GUARANI DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309555,43,'HARMONIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309571,43,'HERVEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309605,43,'HORIZONTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309654,43,'HULHA NEGRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309704,43,'HUMAITA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309753,43,'IBARAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309803,43,'IBIAÇA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309902,43,'IBIRAIARAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4309951,43,'IBIRAPUITA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310009,43,'IBIRUBA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310108,43,'IGREJINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310207,43,'IJUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310306,43,'ILOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310330,43,'IMBE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310363,43,'IMIGRANTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310405,43,'INDEPENDENCIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310413,43,'INHACORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310439,43,'IPE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310462,43,'IPIRANGA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310504,43,'IRAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310538,43,'ITAARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310553,43,'ITACURUBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310579,43,'ITAPUCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310603,43,'ITAQUI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310652,43,'ITATI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310702,43,'ITATIBA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310751,43,'IVORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310801,43,'IVOTI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310850,43,'JABOTICABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310876,43,'JACUIZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4310900,43,'JACUTINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311007,43,'JAGUARAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311106,43,'JAGUARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311122,43,'JAQUIRANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311130,43,'JARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311155,43,'JOIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311205,43,'JULIO DE CASTILHOS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311239,43,'LAGOA BONITA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311254,43,'LAGOAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311270,43,'LAGOA DOS TRES CANTOS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311304,43,'LAGOA VERMELHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311403,43,'LAJEADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311429,43,'LAJEADO DO BUGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311502,43,'LAVRAS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311601,43,'LIBERATO SALZANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311627,43,'LINDOLFO COLLOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311643,43,'LINHA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311700,43,'MACHADINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311718,43,'MAÇAMBARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311734,43,'MAMPITUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311759,43,'MANOEL VIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311775,43,'MAQUINE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311791,43,'MARATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311809,43,'MARAU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311908,43,'MARCELINO RAMOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4311981,43,'MARIANA PIMENTEL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312005,43,'MARIANO MORO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312054,43,'MARQUES DE SOUZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312104,43,'MATA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312138,43,'MATO CASTELHANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312153,43,'MATO LEITAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312179,43,'MATO QUEIMADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312203,43,'MAXIMILIANO DE ALMEIDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312252,43,'MINAS DO LEAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312302,43,'MIRAGUAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312351,43,'MONTAURI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312377,43,'MONTE ALEGRE DOS CAMPOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312385,43,'MONTE BELO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312401,43,'MONTENEGRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312427,43,'MORMAÇO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312443,43,'MORRINHOS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312450,43,'MORRO REDONDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312476,43,'MORRO REUTER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312500,43,'MOSTARDAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312609,43,'MUÇUM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312617,43,'MUITOS CAPOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312625,43,'MULITERNO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312658,43,'NAO-ME-TOQUE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312674,43,'NICOLAU VERGUEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312708,43,'NONOAI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312757,43,'NOVA ALVORADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312807,43,'NOVA ARAÇA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312906,43,'NOVA BASSANO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4312955,43,'NOVA BOA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313003,43,'NOVA BRESCIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313011,43,'NOVA CANDELARIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313037,43,'NOVA ESPERANÇA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313060,43,'NOVA HARTZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313086,43,'NOVA PADUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313102,43,'NOVA PALMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313201,43,'NOVA PETROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313300,43,'NOVA PRATA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313334,43,'NOVA RAMADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313359,43,'NOVA ROMA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313375,43,'NOVA SANTA RITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313391,43,'NOVO CABRAIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313409,43,'NOVO HAMBURGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313425,43,'NOVO MACHADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313441,43,'NOVO TIRADENTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313466,43,'NOVO XINGU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313490,43,'NOVO BARREIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313508,43,'OSORIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313607,43,'PAIM FILHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313656,43,'PALMARES DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313706,43,'PALMEIRA DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313805,43,'PALMITINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313904,43,'PANAMBI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4313953,43,'PANTANO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314001,43,'PARAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314027,43,'PARAISO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314035,43,'PARECI NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314050,43,'PAROBE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314068,43,'PASSA SETE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314076,43,'PASSO DO SOBRADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314100,43,'PASSO FUNDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314134,43,'PAULO BENTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314159,43,'PAVERAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314175,43,'PEDRAS ALTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314209,43,'PEDRO OSORIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314308,43,'PEJUÇARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314407,43,'PELOTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314423,43,'PICADA CAFE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314456,43,'PINHAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314464,43,'PINHAL DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314472,43,'PINHAL GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314498,43,'PINHEIRINHO DO VALE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314506,43,'PINHEIRO MACHADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314548,43,'PINTO BANDEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314555,43,'PIRAPO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314605,43,'PIRATINI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314704,43,'PLANALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314753,43,'POÇO DAS ANTAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314779,43,'PONTAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314787,43,'PONTE PRETA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314803,43,'PORTAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4314902,43,'PORTO ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315008,43,'PORTO LUCENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315057,43,'PORTO MAUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315073,43,'PORTO VERA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315107,43,'PORTO XAVIER',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315131,43,'POUSO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315149,43,'PRESIDENTE LUCENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315156,43,'PROGRESSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315172,43,'PROTASIO ALVES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315206,43,'PUTINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315305,43,'QUARAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315313,43,'QUATRO IRMAOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315321,43,'QUEVEDOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315354,43,'QUINZE DE NOVEMBRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315404,43,'REDENTORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315453,43,'RELVADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315503,43,'RESTINGA SECA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315552,43,'RIO DOS INDIOS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315602,43,'RIO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315701,43,'RIO PARDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315750,43,'RIOZINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315800,43,'ROCA SALES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315909,43,'RODEIO BONITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4315958,43,'ROLADOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316006,43,'ROLANTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316105,43,'RONDA ALTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316204,43,'RONDINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316303,43,'ROQUE GONZALES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316402,43,'ROSARIO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316428,43,'SAGRADA FAMILIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316436,43,'SALDANHA MARINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316451,43,'SALTO DO JACUI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316477,43,'SALVADOR DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316501,43,'SALVADOR DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316600,43,'SANANDUVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316709,43,'SANTA BARBARA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316733,43,'SANTA CECILIA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316758,43,'SANTA CLARA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316808,43,'SANTA CRUZ DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316907,43,'SANTA MARIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316956,43,'SANTA MARIA DO HERVAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4316972,43,'SANTA MARGARIDA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317004,43,'SANTANA DA BOA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317103,43,'SANT''ANA DO LIVRAMENTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317202,43,'SANTA ROSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317251,43,'SANTA TEREZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317301,43,'SANTA VITORIA DO PALMAR',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317400,43,'SANTIAGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317509,43,'SANTO ANGELO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317558,43,'SANTO ANTONIO DO PALMA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317608,43,'SANTO ANTONIO DA PATRULHA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317707,43,'SANTO ANTONIO DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317756,43,'SANTO ANTONIO DO PLANALTO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317806,43,'SANTO AUGUSTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317905,43,'SANTO CRISTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4317954,43,'SANTO EXPEDITO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318002,43,'SAO BORJA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318051,43,'SAO DOMINGOS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318101,43,'SAO FRANCISCO DE ASSIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318200,43,'SAO FRANCISCO DE PAULA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318309,43,'SAO GABRIEL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318408,43,'SAO JERONIMO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318424,43,'SAO JOAO DA URTIGA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318432,43,'SAO JOAO DO POLESINE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318440,43,'SAO JORGE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318457,43,'SAO JOSE DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318465,43,'SAO JOSE DO HERVAL',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318481,43,'SAO JOSE DO HORTENCIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318499,43,'SAO JOSE DO INHACORA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318507,43,'SAO JOSE DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318606,43,'SAO JOSE DO OURO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318614,43,'SAO JOSE DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318622,43,'SAO JOSE DOS AUSENTES',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318705,43,'SAO LEOPOLDO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318804,43,'SAO LOURENÇO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4318903,43,'SAO LUIZ GONZAGA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319000,43,'SAO MARCOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319109,43,'SAO MARTINHO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319125,43,'SAO MARTINHO DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319158,43,'SAO MIGUEL DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319208,43,'SAO NICOLAU',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319307,43,'SAO PAULO DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319356,43,'SAO PEDRO DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319364,43,'SAO PEDRO DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319372,43,'SAO PEDRO DO BUTIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319406,43,'SAO PEDRO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319505,43,'SAO SEBASTIAO DO CAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319604,43,'SAO SEPE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319703,43,'SAO VALENTIM',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319711,43,'SAO VALENTIM DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319737,43,'SAO VALERIO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319752,43,'SAO VENDELINO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319802,43,'SAO VICENTE DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4319901,43,'SAPIRANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320008,43,'SAPUCAIA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320107,43,'SARANDI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320206,43,'SEBERI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320230,43,'SEDE NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320263,43,'SEGREDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320305,43,'SELBACH',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320321,43,'SENADOR SALGADO FILHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320354,43,'SENTINELA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320404,43,'SERAFINA CORREA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320453,43,'SERIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320503,43,'SERTAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320552,43,'SERTAO SANTANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320578,43,'SETE DE SETEMBRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320602,43,'SEVERIANO DE ALMEIDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320651,43,'SILVEIRA MARTINS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320677,43,'SINIMBU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320701,43,'SOBRADINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320800,43,'SOLEDADE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320859,43,'TABAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4320909,43,'TAPEJARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321006,43,'TAPERA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321105,43,'TAPES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321204,43,'TAQUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321303,43,'TAQUARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321329,43,'TAQUARUÇU DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321352,43,'TAVARES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321402,43,'TENENTE PORTELA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321436,43,'TERRA DE AREIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321451,43,'TEUTONIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321469,43,'TIO HUGO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321477,43,'TIRADENTES DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321493,43,'TOROPI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321501,43,'TORRES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321600,43,'TRAMANDAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321626,43,'TRAVESSEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321634,43,'TRES ARROIOS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321667,43,'TRES CACHOEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321709,43,'TRES COROAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321808,43,'TRES DE MAIO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321832,43,'TRES FORQUILHAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321857,43,'TRES PALMEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321907,43,'TRES PASSOS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4321956,43,'TRINDADE DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322004,43,'TRIUNFO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322103,43,'TUCUNDUVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322152,43,'TUNAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322186,43,'TUPANCI DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322202,43,'TUPANCIRETA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322251,43,'TUPANDI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322301,43,'TUPARENDI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322327,43,'TURUÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322343,43,'UBIRETAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322350,43,'UNIAO DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322376,43,'UNISTALDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322400,43,'URUGUAIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322509,43,'VACARIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322525,43,'VALE VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322533,43,'VALE DO SOL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322541,43,'VALE REAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322558,43,'VANINI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322608,43,'VENANCIO AIRES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322707,43,'VERA CRUZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322806,43,'VERANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322855,43,'VESPASIANO CORREA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4322905,43,'VIADUTOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323002,43,'VIAMAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323101,43,'VICENTE DUTRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323200,43,'VICTOR GRAEFF',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323309,43,'VILA FLORES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323358,43,'VILA LANGARO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323408,43,'VILA MARIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323457,43,'VILA NOVA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323507,43,'VISTA ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323606,43,'VISTA ALEGRE DO PRATA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323705,43,'VISTA GAUCHA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323754,43,'VITORIA DAS MISSOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323770,43,'WESTFALIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (4323804,43,'XANGRI-LA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5000203,50,'AGUA CLARA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5000252,50,'ALCINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5000609,50,'AMAMBAI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5000708,50,'ANASTACIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5000807,50,'ANAURILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5000856,50,'ANGELICA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5000906,50,'ANTONIO JOAO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5001003,50,'APARECIDA DO TABOADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5001102,50,'AQUIDAUANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5001243,50,'ARAL MOREIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5001508,50,'BANDEIRANTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5001904,50,'BATAGUASSU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5002001,50,'BATAYPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5002100,50,'BELA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5002159,50,'BODOQUENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5002209,50,'BONITO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5002308,50,'BRASILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5002407,50,'CAARAPO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5002605,50,'CAMAPUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5002704,50,'CAMPO GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5002803,50,'CARACOL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5002902,50,'CASSILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5002951,50,'CHAPADAO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5003108,50,'CORGUINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5003157,50,'CORONEL SAPUCAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5003207,50,'CORUMBA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5003256,50,'COSTA RICA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5003306,50,'COXIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5003454,50,'DEODAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5003488,50,'DOIS IRMAOS DO BURITI',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5003504,50,'DOURADINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5003702,50,'DOURADOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5003751,50,'ELDORADO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5003801,50,'FATIMA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5003900,50,'FIGUEIRAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5004007,50,'GLORIA DE DOURADOS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5004106,50,'GUIA LOPES DA LAGUNA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5004304,50,'IGUATEMI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5004403,50,'INOCENCIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5004502,50,'ITAPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5004601,50,'ITAQUIRAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5004700,50,'IVINHEMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5004809,50,'JAPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5004908,50,'JARAGUARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5005004,50,'JARDIM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5005103,50,'JATEI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5005152,50,'JUTI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5005202,50,'LADARIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5005251,50,'LAGUNA CARAPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5005400,50,'MARACAJU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5005608,50,'MIRANDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5005681,50,'MUNDO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5005707,50,'NAVIRAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5005806,50,'NIOAQUE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5006002,50,'NOVA ALVORADA DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5006200,50,'NOVA ANDRADINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5006259,50,'NOVO HORIZONTE DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5006275,50,'PARAISO DAS AGUAS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5006309,50,'PARANAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5006358,50,'PARANHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5006408,50,'PEDRO GOMES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5006606,50,'PONTA PORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5006903,50,'PORTO MURTINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007109,50,'RIBAS DO RIO PARDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007208,50,'RIO BRILHANTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007307,50,'RIO NEGRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007406,50,'RIO VERDE DE MATO GROSSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007505,50,'ROCHEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007554,50,'SANTA RITA DO PARDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007695,50,'SAO GABRIEL DO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007703,50,'SETE QUEDAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007802,50,'SELVIRIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007901,50,'SIDROLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007935,50,'SONORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007950,50,'TACURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5007976,50,'TAQUARUSSU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5008008,50,'TERENOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5008305,50,'TRES LAGOAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5008404,50,'VICENTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5100102,51,'ACORIZAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5100201,51,'AGUA BOA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5100250,51,'ALTA FLORESTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5100300,51,'ALTO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5100359,51,'ALTO BOA VISTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5100409,51,'ALTO GARÇAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5100508,51,'ALTO PARAGUAI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5100607,51,'ALTO TAQUARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5100805,51,'APIACAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5101001,51,'ARAGUAIANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5101209,51,'ARAGUAINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5101258,51,'ARAPUTANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5101308,51,'ARENAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5101407,51,'ARIPUANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5101605,51,'BARAO DE MELGAÇO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5101704,51,'BARRA DO BUGRES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5101803,51,'BARRA DO GARÇAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5101852,51,'BOM JESUS DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5101902,51,'BRASNORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5102504,51,'CACERES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5102603,51,'CAMPINAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5102637,51,'CAMPO NOVO DO PARECIS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5102678,51,'CAMPO VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5102686,51,'CAMPOS DE JULIO',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5102694,51,'CANABRAVA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5102702,51,'CANARANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5102793,51,'CARLINDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5102850,51,'CASTANHEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103007,51,'CHAPADA DOS GUIMARAES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103056,51,'CLAUDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103106,51,'COCALINHO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103205,51,'COLIDER',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103254,51,'COLNIZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103304,51,'COMODORO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103353,51,'CONFRESA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103361,51,'CONQUISTA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103379,51,'COTRIGUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103403,51,'CUIABA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103437,51,'CURVELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103452,51,'DENISE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103502,51,'DIAMANTINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103601,51,'DOM AQUINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103700,51,'FELIZ NATAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103809,51,'FIGUEIROPOLIS D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103858,51,'GAUCHA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103908,51,'GENERAL CARNEIRO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5103957,51,'GLORIA D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5104104,51,'GUARANTA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5104203,51,'GUIRATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5104500,51,'INDIAVAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5104526,51,'IPIRANGA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5104542,51,'ITANHANGA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5104559,51,'ITAUBA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5104609,51,'ITIQUIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5104807,51,'JACIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5104906,51,'JANGADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105002,51,'JAURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105101,51,'JUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105150,51,'JUINA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105176,51,'JURUENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105200,51,'JUSCIMEIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105234,51,'LAMBARI D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105259,51,'LUCAS DO RIO VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105309,51,'LUCIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105507,51,'VILA BELA DA SANTISSIMA TRINDA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105580,51,'MARCELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105606,51,'MATUPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105622,51,'MIRASSOL D''OESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5105903,51,'NOBRES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106000,51,'NORTELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106109,51,'NOSSA SENHORA DO LIVRAMENTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106158,51,'NOVA BANDEIRANTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106174,51,'NOVA NAZARE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106182,51,'NOVA LACERDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106190,51,'NOVA SANTA HELENA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106208,51,'NOVA BRASILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106216,51,'NOVA CANAA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106224,51,'NOVA MUTUM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106232,51,'NOVA OLIMPIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106240,51,'NOVA UBIRATA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106257,51,'NOVA XAVANTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106265,51,'NOVO MUNDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106273,51,'NOVO HORIZONTE DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106281,51,'NOVO SAO JOAQUIM',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106299,51,'PARANAITA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106307,51,'PARANATINGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106315,51,'NOVO SANTO ANTONIO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106372,51,'PEDRA PRETA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106422,51,'PEIXOTO DE AZEVEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106455,51,'PLANALTO DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106505,51,'POCONE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106653,51,'PONTAL DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106703,51,'PONTE BRANCA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106752,51,'PONTES E LACERDA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106778,51,'PORTO ALEGRE DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106802,51,'PORTO DOS GAUCHOS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106828,51,'PORTO ESPERIDIAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5106851,51,'PORTO ESTRELA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107008,51,'POXOREO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107040,51,'PRIMAVERA DO LESTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107065,51,'QUERENCIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107107,51,'SAO JOSE DOS QUATRO MARCOS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107156,51,'RESERVA DO CABAÇAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107180,51,'RIBEIRAO CASCALHEIRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107198,51,'RIBEIRAOZINHO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107206,51,'RIO BRANCO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107248,51,'SANTA CARMEM',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107263,51,'SANTO AFONSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107297,51,'SAO JOSE DO POVO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107305,51,'SAO JOSE DO RIO CLARO',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107354,51,'SAO JOSE DO XINGU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107404,51,'SAO PEDRO DA CIPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107578,51,'RONDOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107602,51,'RONDONOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107701,51,'ROSARIO OESTE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107743,51,'SANTA CRUZ DO XINGU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107750,51,'SALTO DO CEU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107768,51,'SANTA RITA DO TRIVELATO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107776,51,'SANTA TEREZINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107792,51,'SANTO ANTONIO DO LESTE',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107800,51,'SANTO ANTONIO DO LEVERGER',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107859,51,'SAO FELIX DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107875,51,'SAPEZAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107883,51,'SERRA NOVA DOURADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107909,51,'SINOP',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107925,51,'SORRISO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107941,51,'TABAPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5107958,51,'TANGARA DA SERRA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108006,51,'TAPURAH',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108055,51,'TERRA NOVA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108105,51,'TESOURO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108204,51,'TORIXOREU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108303,51,'UNIAO DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108352,51,'VALE DE SAO DOMINGOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108402,51,'VARZEA GRANDE',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108501,51,'VERA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108600,51,'VILA RICA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108808,51,'NOVA GUARITA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108857,51,'NOVA MARILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108907,51,'NOVA MARINGA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5108956,51,'NOVA MONTE VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200050,52,'ABADIA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200100,52,'ABADIANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200134,52,'ACREUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200159,52,'ADELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200175,52,'AGUA FRIA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200209,52,'AGUA LIMPA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200258,52,'AGUAS LINDAS DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200308,52,'ALEXANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200506,52,'ALOANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200555,52,'ALTO HORIZONTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200605,52,'ALTO PARAISO DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200803,52,'ALVORADA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200829,52,'AMARALINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200852,52,'AMERICANO DO BRASIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5200902,52,'AMORINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5201108,52,'ANAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5201207,52,'ANHANGUERA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5201306,52,'ANICUNS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5201405,52,'APARECIDA DE GOIANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5201454,52,'APARECIDA DO RIO DOCE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5201504,52,'APORE',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5201603,52,'ARAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5201702,52,'ARAGARÇAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5201801,52,'ARAGOIANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5202155,52,'ARAGUAPAZ',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5202353,52,'ARENOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5202502,52,'ARUANA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5202601,52,'AURILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5202809,52,'AVELINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5203104,52,'BALIZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5203203,52,'BARRO ALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5203302,52,'BELA VISTA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5203401,52,'BOM JARDIM DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5203500,52,'BOM JESUS DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5203559,52,'BONFINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5203575,52,'BONOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5203609,52,'BRAZABRANTES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5203807,52,'BRITANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5203906,52,'BURITI ALEGRE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5203939,52,'BURITI DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5203962,52,'BURITINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204003,52,'CABECEIRAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204102,52,'CACHOEIRA ALTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204201,52,'CACHOEIRA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204250,52,'CACHOEIRA DOURADA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204300,52,'CAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204409,52,'CAIAPONIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204508,52,'CALDAS NOVAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204557,52,'CALDAZINHA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204607,52,'CAMPESTRE DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204656,52,'CAMPINAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204706,52,'CAMPINORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204805,52,'CAMPO ALEGRE DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204854,52,'CAMPO LIMPO DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204904,52,'CAMPOS BELOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5204953,52,'CAMPOS VERDES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205000,52,'CARMO DO RIO VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205059,52,'CASTELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205109,52,'CATALAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205208,52,'CATURAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205307,52,'CAVALCANTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205406,52,'CERES',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205455,52,'CEZARINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205471,52,'CHAPADAO DO CEU',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205497,52,'CIDADE OCIDENTAL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205513,52,'COCALZINHO DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205521,52,'COLINAS DO SUL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205703,52,'CORREGO DO OURO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205802,52,'CORUMBA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5205901,52,'CORUMBAIBA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5206206,52,'CRISTALINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5206305,52,'CRISTIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5206404,52,'CRIXAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5206503,52,'CROMINIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5206602,52,'CUMARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5206701,52,'DAMIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5206800,52,'DAMOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5206909,52,'DAVINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5207105,52,'DIORAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5207253,52,'DOVERLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5207352,52,'EDEALINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5207402,52,'EDEIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5207501,52,'ESTRELA DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5207535,52,'FAINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5207600,52,'FAZENDA NOVA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5207808,52,'FIRMINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5207907,52,'FLORES DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5208004,52,'FORMOSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5208103,52,'FORMOSO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5208152,52,'GAMELEIRA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5208301,52,'DIVINOPOLIS DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5208400,52,'GOIANAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5208509,52,'GOIANDIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5208608,52,'GOIANESIA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5208707,52,'GOIANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5208806,52,'GOIANIRA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5208905,52,'GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5209101,52,'GOIATUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5209150,52,'GOUVELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5209200,52,'GUAPO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5209291,52,'GUARAITA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5209408,52,'GUARANI DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5209457,52,'GUARINOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5209606,52,'HEITORAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5209705,52,'HIDROLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5209804,52,'HIDROLINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5209903,52,'IACIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5209937,52,'INACIOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5209952,52,'INDIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5210000,52,'INHUMAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5210109,52,'IPAMERI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5210158,52,'IPIRANGA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5210208,52,'IPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5210307,52,'ISRAELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5210406,52,'ITABERAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5210562,52,'ITAGUARI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5210604,52,'ITAGUARU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5210802,52,'ITAJA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5210901,52,'ITAPACI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5211008,52,'ITAPIRAPUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5211206,52,'ITAPURANGA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5211305,52,'ITARUMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5211404,52,'ITAUÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5211503,52,'ITUMBIARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5211602,52,'IVOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5211701,52,'JANDAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5211800,52,'JARAGUA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5211909,52,'JATAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5212006,52,'JAUPACI',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5212055,52,'JESUPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5212105,52,'JOVIANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5212204,52,'JUSSARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5212253,52,'LAGOA SANTA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5212303,52,'LEOPOLDO DE BULHOES',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5212501,52,'LUZIANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5212600,52,'MAIRIPOTABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5212709,52,'MAMBAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5212808,52,'MARA ROSA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5212907,52,'MARZAGAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5212956,52,'MATRINCHA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5213004,52,'MAURILANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5213053,52,'MIMOSO DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5213087,52,'MINAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5213103,52,'MINEIROS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5213400,52,'MOIPORA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5213509,52,'MONTE ALEGRE DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5213707,52,'MONTES CLAROS DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5213756,52,'MONTIVIDIU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5213772,52,'MONTIVIDIU DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5213806,52,'MORRINHOS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5213855,52,'MORRO AGUDO DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5213905,52,'MOSSAMEDES',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5214002,52,'MOZARLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5214051,52,'MUNDO NOVO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5214101,52,'MUTUNOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5214408,52,'NAZARIO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5214507,52,'NEROPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5214606,52,'NIQUELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5214705,52,'NOVA AMERICA',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5214804,52,'NOVA AURORA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5214838,52,'NOVA CRIXAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5214861,52,'NOVA GLORIA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5214879,52,'NOVA IGUAÇU DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5214903,52,'NOVA ROMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5215009,52,'NOVA VENEZA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5215207,52,'NOVO BRASIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5215231,52,'NOVO GAMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5215256,52,'NOVO PLANALTO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5215306,52,'ORIZONA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5215405,52,'OURO VERDE DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5215504,52,'OUVIDOR',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5215603,52,'PADRE BERNARDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5215652,52,'PALESTINA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5215702,52,'PALMEIRAS DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5215801,52,'PALMELO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5215900,52,'PALMINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5216007,52,'PANAMA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5216304,52,'PARANAIGUARA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5216403,52,'PARAUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5216452,52,'PEROLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5216809,52,'PETROLINA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5216908,52,'PILAR DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5217104,52,'PIRACANJUBA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5217203,52,'PIRANHAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5217302,52,'PIRENOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5217401,52,'PIRES DO RIO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5217609,52,'PLANALTINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5217708,52,'PONTALINA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5218003,52,'PORANGATU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5218052,52,'PORTEIRAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5218102,52,'PORTELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5218300,52,'POSSE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5218391,52,'PROFESSOR JAMIL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5218508,52,'QUIRINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5218607,52,'RIALMA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5218706,52,'RIANAPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5218789,52,'RIO QUENTE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5218805,52,'RIO VERDE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5218904,52,'RUBIATABA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219001,52,'SANCLERLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219100,52,'SANTA BARBARA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219209,52,'SANTA CRUZ DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219258,52,'SANTA FE DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219308,52,'SANTA HELENA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219357,52,'SANTA ISABEL',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219407,52,'SANTA RITA DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219456,52,'SANTA RITA DO NOVO DESTINO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219506,52,'SANTA ROSA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219605,52,'SANTA TEREZA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219704,52,'SANTA TEREZINHA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219712,52,'SANTO ANTONIO DA BARRA',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219738,52,'SANTO ANTONIO DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219753,52,'SANTO ANTONIO DO DESCOBERTO',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219803,52,'SAO DOMINGOS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5219902,52,'SAO FRANCISCO DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220009,52,'SAO JOAO D''ALIANÇA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220058,52,'SAO JOAO DA PARAUNA',{d '2016-12-06'},{ts '2016-12-06 09:31:54'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220108,52,'SAO LUIS DE MONTES BELOS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220157,52,'SAO LUIZ DO NORTE',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220207,52,'SAO MIGUEL DO ARAGUAIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220264,52,'SAO MIGUEL DO PASSA QUATRO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220280,52,'SAO PATRICIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220405,52,'SAO SIMAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220454,52,'SENADOR CANEDO',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220504,52,'SERRANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220603,52,'SILVANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220686,52,'SIMOLANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5220702,52,'SITIO D''ABADIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221007,52,'TAQUARAL DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221080,52,'TERESINA DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221197,52,'TEREZOPOLIS DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221304,52,'TRES RANCHOS',{d '2016-12-06'},{ts '2016-12-06 09:30:41'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221403,52,'TRINDADE',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221452,52,'TROMBAS',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221502,52,'TURVANIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221551,52,'TURVELANDIA',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221577,52,'UIRAPURU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221601,52,'URUAÇU',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221700,52,'URUANA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221809,52,'URUTAI',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221858,52,'VALPARAISO DE GOIAS',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5221908,52,'VARJAO',{d '2016-12-06'},{ts '2016-12-06 09:30:02'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5222005,52,'VIANOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5222054,52,'VICENTINOPOLIS',{d '2016-12-06'},{ts '2016-12-06 09:31:17'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5222203,52,'VILA BOA',{d '2016-12-06'},{ts '2016-12-06 09:27:07'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5222302,52,'VILA PROPICIO',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});
INSERT INTO cad_cidade (id,idestado,descricao,datacreate,dataupdate) VALUES (5300108,53,'BRASILIA',{d '2016-12-06'},{ts '2016-12-06 09:31:01'});

------------------------------------------------- ADM_COMERCIO -----------------------------------------------------------
insert into adm_comercio(id, nomerazaosocial, nomefantasia, inativo, datacreate, dataupdate) values (0, 'PUPPIS', 'PUPPIS', 'F', current_date, current_timestamp);

------------------------------------------------- ADM_ENDERECO -----------------------------------------------------------
insert into adm_endereco (id, idcomercio, rua, numero, cep, complemento, bairro, idcidade, datacreate, dataupdate) values (0, 0, 'PADRAO', 0, '13840-000', null, 'PADRAO', 0, current_date, current_timestamp);

------------------------------------------------- ADM_CONTATO -----------------------------------------------------------
insert into adm_contato (id, idcomercio, ddd, telefone, celular, email, datacreate, dataupdate) values (0, 0, 0, '3891-3891', '99999-9999', 'puppis@puppis.com.br', current_date, current_timestamp);

------------------------------------------------- ADM_DOCUMENTO -----------------------------------------------------------
insert into adm_documento (id, idcomercio, cpfcnpj, rginscricaoestadual, datacreate, dataupdate) values (0, 0, '00.000.000/0000-00', 'ISENTO', current_date, current_timestamp);

------------------------------------------------- ADM_MODULO -----------------------------------------------------------
insert into adm_modulo(id, idcomercio, idmodulo, datacreate) values (1, 0, 1, current_date);
insert into adm_modulo(id, idcomercio, idmodulo, datacreate) values (2, 0, 2, current_date);
insert into adm_modulo(id, idcomercio, idmodulo, datacreate) values (3, 0, 3, current_date);
insert into adm_modulo(id, idcomercio, idmodulo, datacreate) values (4, 0, 4, current_date);

------------------------------------------------- ADM_TIPOACESSO -----------------------------------------------------------
insert into adm_tipoacesso (id, datacreate, dataupdate, descricao) values (1, current_date, current_timestamp, 'BASICO');
insert into adm_tipoacesso (id, datacreate, dataupdate, descricao) values (2, current_date, current_timestamp, 'MEDIO');
insert into adm_tipoacesso (id, datacreate, dataupdate, descricao) values (3, current_date, current_timestamp, 'TOTAL');

------------------------------------------------- ADM_GRUPO -----------------------------------------------------------
insert into adm_grupo (id, descricao, datacreate, dataupdate) values (1, 'ADMINISTRADOR', current_date, current_timestamp);
insert into adm_grupo (id, descricao, datacreate, dataupdate) values (2, 'GERENTE', current_date, current_timestamp);
insert into adm_grupo (id, descricao, datacreate, dataupdate) values (3, 'FUNCIONARIO', current_date, current_timestamp);

-------------------------------------------------- ADM_USUARIO -------------------------------------------------------------
insert into adm_usuario (id, datacreate, dataupdate, inativo, senha, idgrupo, usuario, nome, idtipoacesso) values (0, current_date, current_timestamp, false, 'ADMIN123', 1, 'ADMIN', 'ADMIN', 3);
insert into adm_usuario (id, datacreate, dataupdate, inativo, senha, idgrupo, usuario, nome, idtipoacesso) values (1, current_date, current_timestamp, false, 'PERMI123', 1, 'PERMISSION', 'PERMISSION', 3);

-------------------------------------------------- ADM_USUARIOCOMERCIO -------------------------------------------------------------
insert into adm_usuariocomercio (id, idusuario, idcomercio, datacreate) values (1, 0, 0, current_date);
insert into adm_usuariocomercio (id, idusuario, idcomercio, datacreate) values (2, 1, 0, current_date);

--------------------------------------------- FIN_BANCO ---------------------------------------------------------------------------------------------------------------------------
insert into fin_banco(id, codigo, descricao, datacreate, dataupdate) values (1, '001', 'BANCO DO BRASIL', current_date, current_timestamp);
insert into fin_banco(id, codigo, descricao, datacreate, dataupdate) values (2, '237', 'BRADESCO', current_date, current_timestamp);
insert into fin_banco(id, codigo, descricao, datacreate, dataupdate) values (3, '104', 'CAIXA ECONOMICA FEDERAL', current_date, current_timestamp);
insert into fin_banco(id, codigo, descricao, datacreate, dataupdate) values (4, '399', 'HSBC', current_date, current_timestamp);
insert into fin_banco(id, codigo, descricao, datacreate, dataupdate) values (5, '184', 'ITAU', current_date, current_timestamp);
insert into fin_banco(id, codigo, descricao, datacreate, dataupdate) values (6, '033', 'SANTANDER', current_date, current_timestamp);

--------------------------------------------- FIN_FORMAPAGAMENTO -------------------------------------------------------------------------------------------------------------------
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (0, current_date, current_timestamp, '', 0, 0);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (1, current_date, current_timestamp, 'A VISTA', 0, 1);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (2, current_date, current_timestamp, 'DEBITO', 0, 1);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (3, current_date, current_timestamp, 'CREDITO 1X', 30, 1);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (4, current_date, current_timestamp, 'CREDITO 2X', 30, 2);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (5, current_date, current_timestamp, 'CREDITO 3X', 30, 3);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (6, current_date, current_timestamp, 'CREDITO 4X', 30, 4);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (7, current_date, current_timestamp, 'CREDITO 5X', 30, 5);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (8, current_date, current_timestamp, 'CREDITO 6X', 30, 6);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (9, current_date, current_timestamp, 'CREDITO 7X', 30, 7);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (10, current_date, current_timestamp, 'CREDITO 8X', 30, 8);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (11, current_date, current_timestamp, 'CREDITO 9X', 30, 9);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (12, current_date, current_timestamp, 'CREDITO 10X', 30, 10);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (13, current_date, current_timestamp, 'CREDITO 11X', 30, 11);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (14, current_date, current_timestamp, 'CREDITO 12X', 30, 12);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (15, current_date, current_timestamp, 'FATURADO 01', 15, 1);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (16, current_date, current_timestamp, 'FATURADO 02', 15, 2);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (17, current_date, current_timestamp, 'FATURADO 03', 15, 3);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (18, current_date, current_timestamp, 'FATURADO 04', 15, 4);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (19, current_date, current_timestamp, 'FINANCIAMENTO 12', 30, 12);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (20, current_date, current_timestamp, 'FINANCIAMENTO 24', 30, 24);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (21, current_date, current_timestamp, 'FINANCIAMENTO 36', 30, 36);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (22, current_date, current_timestamp, 'FINANCIAMENTO 48', 30, 48);
insert into fin_formapagamento (id, datacreate, dataupdate, descricao, intervalo, quantidadeparcela) values (23, current_date, current_timestamp, 'FINANCIAMENTO 60', 30, 60);

--------------------------------------------- CAD_CENTROCUSTO ---------------------------------------------------------------------------------------------------------------
insert into cad_centrocusto(id, idcentrocustomaster, descricao, datacreate, dataupdate) values (0, 0, '', current_date, current_timestamp);

--------------------------------------------- FIN_HISTORICO ---------------------------------------------------------------------------------------------------------------
insert into fin_historico(id, descricao, datacreate, dataupdate) values (0, '', current_date, current_timestamp);

--------------------------------------------- FIN_TIPOCONTABANCARIA ---------------------------------------------------------------------------------------------------------------
insert into fin_tipocontabancaria (id, datacreate, dataupdate, descricao) values (1, current_date, current_timestamp, 'CORRENTE');
insert into fin_tipocontabancaria (id, datacreate, dataupdate, descricao) values (2, current_date, current_timestamp, 'POUPANCA');
insert into fin_tipocontabancaria (id, datacreate, dataupdate, descricao) values (3, current_date, current_timestamp, 'SALARIO');

--------------------------------------------- FIN_TIPODOCUMENTO ---------------------------------------------------------------------------------------------------------------
insert into fin_tipodocumento(id, descricao, datacreate, dataupdate) values (1, 'CUPOM FISCAL', current_date, current_timestamp);
insert into fin_tipodocumento(id, descricao, datacreate, dataupdate) values (2, 'BOLETO', current_date, current_timestamp);
insert into fin_tipodocumento(id, descricao, datacreate, dataupdate) values (3, 'NOTA ELETRONICA', current_date, current_timestamp);
insert into fin_tipodocumento(id, descricao, datacreate, dataupdate) values (4, 'TRANSFERENCIA', current_date, current_timestamp);
insert into fin_tipodocumento(id, descricao, datacreate, dataupdate) values (5, 'FATURA', current_date, current_timestamp);
insert into fin_tipodocumento(id, descricao, datacreate, dataupdate) values (6, 'RECIBO', current_date, current_timestamp);
insert into fin_tipodocumento(id, descricao, datacreate, dataupdate) values (7, 'CONTRATO', current_date, current_timestamp);
insert into fin_tipodocumento(id, descricao, datacreate, dataupdate) values (8, 'MULTA', current_date, current_timestamp);
insert into fin_tipodocumento(id, descricao, datacreate, dataupdate) values (9, 'SEM DOCUMENTO', current_date, current_timestamp);
insert into fin_tipodocumento(id, descricao, datacreate, dataupdate) values (10, 'CHEQUE', current_date, current_timestamp);
insert into fin_tipodocumento(id, descricao, datacreate, dataupdate) values (11, 'CARNE', current_date, current_timestamp);

--------------------------------------------- PES_ESTADOCIVIL ---------------------------------------------------------------------------------------------------------------
insert into pes_estadocivil (id, datacreate, dataupdate, descricao) values(0, current_date, current_timestamp, '');
insert into pes_estadocivil (id, datacreate, dataupdate, descricao) values(1, current_date, current_timestamp, 'CASADO(A)');
insert into pes_estadocivil (id, datacreate, dataupdate, descricao) values(2, current_date, current_timestamp, 'DIVORCIADO(A)');
insert into pes_estadocivil (id, datacreate, dataupdate, descricao) values(3, current_date, current_timestamp, 'SEPARADO(A)');
insert into pes_estadocivil (id, datacreate, dataupdate, descricao) values(4, current_date, current_timestamp, 'SOLTEIRO(A)');
insert into pes_estadocivil (id, datacreate, dataupdate, descricao) values(5, current_date, current_timestamp, 'VIUVO(A)');

---------------------------------------------------- PES_SEXO ----------------------------------------------------------------------------------------------------------------------
insert into pes_sexo (id, datacreate, dataupdate, descricao) values (0, current_date, current_timestamp, '');
insert into pes_sexo (id, datacreate, dataupdate, descricao) values (1, current_date, current_timestamp, 'FEMININO');
insert into pes_sexo (id, datacreate, dataupdate, descricao) values (2, current_date, current_timestamp, 'MASCULINO');

--------------------------------------------------------- PES_TIPO --------------------------------------------------------
insert into pes_tipo (id, datacreate, dataupdate, descricao) values (0, current_timestamp, current_timestamp, 'TODOS');
insert into pes_tipo (id, datacreate, dataupdate, descricao) values (1, current_timestamp, current_timestamp, 'CLIENTE');
insert into pes_tipo (id, datacreate, dataupdate, descricao) values (2, current_timestamp, current_timestamp, 'FORNECEDOR');
insert into pes_tipo (id, datacreate, dataupdate, descricao) values (3, current_timestamp, current_timestamp, 'FUNCIONARIO');

---------------------------------------------------- PES_PESSOA ----------------------------------------------------------------------------------------------------------------------
insert into pes_pessoa(id, nomerazaosocial, nomefantasia, apelido, idsexo, idestadocivil, inativo, observacao, datacreate, dataupdate) values (0, 'TODOS', 'TODOS', null, 0, 0, 'F', null, current_date, current_timestamp);

---------------------------------------------------- PES_DEFINICAO ----------------------------------------------------------------------------------------------------------------------
insert into pes_definicao (id, idpessoa, idtipo, inativo, datacreate, dataupdate) values (0, 0, 0, 'F', current_date, current_timestamp);

--------------------------------------------- PS_UNIDADEMEDIDA --------------------------------------------------------------------------------------------------------------------
insert into ps_unidademedida (id, datacreate, dataupdate, descricao, unidade) values (1, current_date, current_timestamp, 'UNIDADE', 'UN');
insert into ps_unidademedida (id, datacreate, dataupdate, descricao, unidade) values (2, current_date, current_timestamp, 'LITRO', 'LT');
insert into ps_unidademedida (id, datacreate, dataupdate, descricao, unidade) values (3, current_date, current_timestamp, 'KILO', 'KG');
insert into ps_unidademedida (id, datacreate, dataupdate, descricao, unidade) values (4, current_date, current_timestamp, 'TONELADA', 'TN');

--------------------------------------------- PS_TIPO ---------------------------------------------------------------------------------------------------------------
insert into ps_tipo (id, datacreate,dataupdate,descricao) values (1, current_date, current_timestamp, 'PRODUTO');
insert into ps_tipo (id, datacreate,dataupdate,descricao) values (2, current_date, current_timestamp, 'SERVICO');

--------------------------------------------- PS_GRUPO ---------------------------------------------------------------------------------------------------------------
insert into ps_grupo (id, descricao, datacreate, dataupdate) values (0, '', current_date, current_timestamp);

--------------------------------------------- PS_CLASSE ---------------------------------------------------------------------------------------------------------------
insert into ps_classe (id, idgrupo, descricao, datacreate, dataupdate) values (0, 0, '', current_date, current_timestamp);

--------------------------------------------- PS_PRODUTOSERVICO ---------------------------------------------------------------------------------------------------------------
insert into ps_produtoservico (id,idclasse,descricao,aceitadesconto,idtipo,idunidademedida,inativo,marca,codigobarra,observacao,pathimagem,datacreate,dataupdate) values (0, 0, '', 'T', 1, 1, false, null, null, null, null, current_date, current_timestamp);

--------------------------------------------- PS_MOVIMENTOTIPO ---------------------------------------------------------------------------------------------------------------
insert into ps_movimentotipo (id, idtipooperacao, descricao, datacreate, dataupdate) values (0, 0, '', current_date, current_timestamp);
insert into ps_movimentotipo (id, idtipooperacao, descricao, datacreate, dataupdate) values (1, 1, 'ENTRADA POR COMPRA', current_date, current_timestamp);
insert into ps_movimentotipo (id, idtipooperacao, descricao, datacreate, dataupdate) values (2, 1, 'SAIDA POR ESTORNO', current_date, current_timestamp);
insert into ps_movimentotipo (id, idtipooperacao, descricao, datacreate, dataupdate) values (3, 2, 'SAIDA POR VENDA', current_date, current_timestamp);
insert into ps_movimentotipo (id, idtipooperacao, descricao, datacreate, dataupdate) values (4, 2, 'ENTRADA POR ESTORNO', current_date, current_timestamp);
insert into ps_movimentotipo (id, idtipooperacao, descricao, datacreate, dataupdate) values (5, 8, 'ENTRADA POR CORRECAO MANUAL', current_date, current_timestamp);
insert into ps_movimentotipo (id, idtipooperacao, descricao, datacreate, dataupdate) values (6, 9, 'SAIDA POR CORRECAO MANUAL', current_date, current_timestamp);


--------------------------------------------- INDEX's' ---------------------------------------------------------------------------------------------------------------
alter sequence sqsys_modulo restart with 5;
alter sequence sqsys_tipooperacao restart with 10;
alter sequence sqadm_modulo restart with 5;
alter sequence sqadm_tipoacesso restart with 4;
alter sequence sqadm_grupo restart with 4;
alter sequence sqadm_usuario restart with 2;
alter sequence sqadm_usuariocomercio restart with 2;
alter sequence sqfin_banco restart with 7;
alter sequence sqfin_formapagamento restart with 24;
alter sequence sqfin_tipocontabancaria restart with 4;
alter sequence sqfin_tipodocumento restart with 12;
alter sequence sqpes_estadocivil restart with 6;
alter sequence sqpes_sexo restart with 3;
alter sequence sqpes_tipo restart with 4;
alter sequence sqps_movimentotipo restart with 7;