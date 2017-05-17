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