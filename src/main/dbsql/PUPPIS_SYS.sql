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