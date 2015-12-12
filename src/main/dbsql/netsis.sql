
    drop table if exists sys_cargo cascade

    drop table if exists sys_especializacao cascade

    drop table if exists sys_estadocivil cascade

    drop table if exists sys_formapagamento cascade

    drop table if exists sys_nacionalidade cascade

    drop table if exists sys_nivelformacao cascade

    drop table if exists sys_sexo cascade

    drop table if exists sys_tipocontabancaria cascade

    drop table if exists sys_tipocontratacao cascade

    drop table if exists sys_tipofornecedor cascade

    drop table if exists sys_unidademedida cascade

    create table sys_cargo (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(120) not null,
        primary key (id)
    )

    create table sys_especializacao (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(120) not null,
        primary key (id)
    )

    create table sys_estadocivil (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(15) not null,
        primary key (id)
    )

    create table sys_formapagamento (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(30) not null,
        intervalo int4,
        quantidadeparcela int4,
        primary key (id)
    )

    create table sys_nacionalidade (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(30) not null,
        primary key (id)
    )

    create table sys_nivelformacao (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(50) not null,
        primary key (id)
    )

    create table sys_sexo (
        id  serial not null,
        abreviado char(1) not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(10) not null,
        primary key (id)
    )

    create table sys_tipocontabancaria (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(10) not null,
        primary key (id)
    )

    create table sys_tipocontratacao (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(12) not null,
        primary key (id)
    )

    create table sys_tipofornecedor (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(15) not null,
        primary key (id)
    )

    create table sys_unidademedida (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(10) not null,
        unidade char(2) not null,
        primary key (id)
    )

    alter table sys_cargo 
        add constraint UK_tbjbkctmlioa6pjx9dlht186o  unique (descricao)

    alter table sys_nacionalidade 
        add constraint UK_ma1f3nbj70m33m4wctcdk6d9u  unique (descricao)

    alter table sys_sexo 
        add constraint UK_152gwm4wdxgal4bkx0uaedcy8  unique (descricao)

    alter table sys_unidademedida 
        add constraint UK_gu42hq0ub0o43yyvmoqbav25d  unique (descricao)

    alter table sys_unidademedida 
        add constraint UK_5tt3v68h96j8srepsihysl2lr  unique (unidade)
