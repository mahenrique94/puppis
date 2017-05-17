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
	logradouro varchar(60) not null,
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