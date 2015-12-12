
    alter table cad_cidade 
        drop constraint FK_agw5oyxeu5x0lbpghyx9dow8p

    alter table cad_estado 
        drop constraint FK_t8gh9ugedis05xsd3jon2erir

    alter table pes_contato 
        drop constraint FK_pu6neyrckpy2rcwm7p1jh46d5

    alter table pes_documento 
        drop constraint FK_orjla418wxmkb43rq41w36t01

    alter table pes_endereco 
        drop constraint FK_h1djmvi8a94b4yvym91vvuiqw

    alter table pes_endereco 
        drop constraint FK_se1ufpe4qtmunkbw5ieo4204e

    alter table pes_endereco 
        drop constraint FK_og3f7lgu1ghcuhw11l93cmcvg

    alter table pes_endereco 
        drop constraint FK_oed1obhfasdryq7sm08olrig9

    alter table pes_informacao 
        drop constraint FK_j1q0m7b7b0xsegowuc4tfgehw

    alter table pes_informacao 
        drop constraint FK_kc9bmy320yjttqxror2nk0xp5

    alter table pes_informacao 
        drop constraint FK_6ksbcn5iped63dikdc9js2pfh

    alter table pes_informacao 
        drop constraint FK_fypft9s10ov44uhg8b4xpcf1r

    alter table pes_informacao 
        drop constraint FK_1umvbp8djd5w5c9w2w9k9p04m

    alter table pes_informacao 
        drop constraint FK_d3a0yb7k2cres9gxrdb26y8b5

    alter table pes_informacao 
        drop constraint FK_fuv3fxjy8q0nw6cuamg7wqp8q

    alter table pes_informacao 
        drop constraint FK_7ww0qrkdmleqpwr2l9gprn2p

    alter table pes_informacao 
        drop constraint FK_n8phfed2grvexfk0x1yj2kk97

    alter table pes_informacao 
        drop constraint FK_rt6kt4wh4j0t4gaxxtpb12cv0

    alter table pes_informacaobancaria 
        drop constraint FK_1ayva2cvoo9bq7m90nd9j16g4

    alter table pes_informacaobancaria 
        drop constraint FK_ok5sptn3mejsry7y42evtmhpx

    alter table pes_informacaobancaria 
        drop constraint FK_2d2vnxvi8uo6la14q8rr6qqn5

    alter table pes_pessoa 
        drop constraint FK_h1y6igi5ipm81tqvq9b4dv56y

    alter table pes_pessoa 
        drop constraint FK_oo30oav8i4km503tmloxqh0dn

    alter table pes_pessoa 
        drop constraint FK_dqw358rgpavswyy4p8udw79r0

    drop table if exists cad_cidade cascade

    drop table if exists cad_estado cascade

    drop table if exists cad_pais cascade

    drop table if exists fin_banco cascade

    drop table if exists fin_tipocontabancaria cascade

    drop table if exists pes_cargo cascade

    drop table if exists pes_contato cascade

    drop table if exists pes_documento cascade

    drop table if exists pes_endereco cascade

    drop table if exists pes_especializacao cascade

    drop table if exists pes_estadocivil cascade

    drop table if exists pes_informacao cascade

    drop table if exists pes_informacaobancaria cascade

    drop table if exists pes_nacionalidade cascade

    drop table if exists pes_nivelformacao cascade

    drop table if exists pes_nucleo cascade

    drop table if exists pes_pessoa cascade

    drop table if exists pes_ramo cascade

    drop table if exists pes_setor cascade

    drop table if exists pes_sexo cascade

    drop table if exists pes_tipo cascade

    drop table if exists pes_tipocontratacao cascade

    drop table if exists pes_tipofornecedor cascade

    create table cad_cidade (
        id  serial not null,
        cidade varchar(60) not null,
        datacreate date not null,
        dataupdate timestamp not null,
        idestado int4 not null,
        primary key (id)
    )

    create table cad_estado (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        estado varchar(60) not null,
        uf char(2) not null,
        idpais int4 not null,
        primary key (id)
    )

    create table cad_pais (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        pais varchar(60) not null,
        primary key (id)
    )

    create table fin_banco (
        id  serial not null,
        codigo varchar(10),
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(30) not null,
        primary key (id)
    )

    create table fin_tipocontabancaria (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(10) not null,
        primary key (id)
    )

    create table pes_cargo (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(120) not null,
        primary key (id)
    )

    create table pes_contato (
        id  bigserial not null,
        celular varchar(12),
        datacreate date not null,
        dataupdate timestamp not null,
        ddd int4,
        email varchar(255),
        telefone varchar(10),
        idpessoa int8,
        primary key (id)
    )

    create table pes_documento (
        id  bigserial not null,
        cnh varchar(20),
        cpfcnpj varchar(20) not null,
        ctps int4,
        datacreate date not null,
        dataupdate timestamp not null,
        pis int4,
        rginscricaoestadual varchar(20) not null,
        serie int4,
        idpessoa int8 not null,
        primary key (id)
    )

    create table pes_endereco (
        id  serial not null,
        bairro varchar(60) not null,
        cep varchar(12) not null,
        complemento varchar(30),
        datacreate date not null,
        dataupdate timestamp not null,
        numero varchar(10) not null,
        rua varchar(60) not null,
        idcidade int4 not null,
        idestado int4 not null,
        idpais int4 not null,
        idpessoa int8,
        primary key (id)
    )

    create table pes_especializacao (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(120) not null,
        primary key (id)
    )

    create table pes_estadocivil (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(15) not null,
        primary key (id)
    )

    create table pes_informacao (
        id  bigserial not null,
        dataadmissao date,
        datacreate date not null,
        datademissao date,
        datanascimento date,
        dataupdate timestamp not null,
        nomevendedor varchar(60),
        sitefornecedor varchar(255),
        idcargo int4,
        idespecializacao int4,
        idnacionalidade int4,
        idnivelformacao int4,
        idnucleo int4,
        idpessoa int8,
        idramo int4,
        idsetor int4,
        idtipocontratacao int4,
        idtipofornecedor int4,
        primary key (id)
    )

    create table pes_informacaobancaria (
        id  bigserial not null,
        agencia varchar(10),
        conta varchar(10),
        datacreate date not null,
        dataupdate timestamp not null,
        nometitular varchar(60),
        idbanco int4,
        idpessoa int8,
        idtipoconta int4,
        primary key (id)
    )

    create table pes_nacionalidade (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(30) not null,
        primary key (id)
    )

    create table pes_nivelformacao (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(50) not null,
        primary key (id)
    )

    create table pes_nucleo (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(30) not null,
        primary key (id)
    )

    create table pes_pessoa (
        id  bigserial not null,
        apelido varchar(30),
        datacreate date not null,
        dataupdate timestamp not null,
        inativo char(1) not null,
        nomefantasia varchar(60),
        nomerazaosocial varchar(60) not null,
        observacao text,
        idestadocivil int4,
        idsexo int4,
        idtipo int4 not null,
        primary key (id)
    )

    create table pes_ramo (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(30) not null,
        primary key (id)
    )

    create table pes_setor (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(30) not null,
        primary key (id)
    )

    create table pes_sexo (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(10) not null,
        primary key (id)
    )

    create table pes_tipo (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao char(20) not null,
        primary key (id)
    )

    create table pes_tipocontratacao (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(12) not null,
        primary key (id)
    )

    create table pes_tipofornecedor (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(15) not null,
        primary key (id)
    )

    alter table cad_estado 
        add constraint UK_616wtinmwgwcbnob0ftb0fhli  unique (estado)

    alter table cad_estado 
        add constraint UK_qqv2mfrhccw7kbmtw2f5kro9x  unique (uf)

    alter table cad_pais 
        add constraint UK_ky0liuvsyh8aodqr3m3t57b15  unique (pais)

    alter table fin_banco 
        add constraint UK_o459oxsl8hpvss9t4qa84tpme  unique (codigo)

    alter table fin_banco 
        add constraint UK_lnfs0cigjkvf9yic47weerc34  unique (descricao)

    alter table pes_cargo 
        add constraint UK_kbjud9v8ig85yxb3fdcc63rbm  unique (descricao)

    alter table pes_documento 
        add constraint UK_1lp03dj2mt7bkrhxhadst5s2c  unique (cnh)

    alter table pes_documento 
        add constraint UK_6waak851y0oo7n7rbdq1td2p7  unique (cpfcnpj)

    alter table pes_documento 
        add constraint UK_degby5g3r1qytcmvv50qgcy3v  unique (rginscricaoestadual)

    alter table pes_documento 
        add constraint UK_orjla418wxmkb43rq41w36t01  unique (idpessoa)

    alter table pes_endereco 
        add constraint UK_oed1obhfasdryq7sm08olrig9  unique (idpessoa)

    alter table pes_informacao 
        add constraint UK_d3a0yb7k2cres9gxrdb26y8b5  unique (idpessoa)

    alter table pes_informacaobancaria 
        add constraint UK_ok5sptn3mejsry7y42evtmhpx  unique (idpessoa)

    alter table pes_nacionalidade 
        add constraint UK_6ryxwu68hncqtaj25mchkm8fh  unique (descricao)

    alter table pes_nucleo 
        add constraint UK_26jwjyq9yfx0udq4f4ujdlnhs  unique (descricao)

    alter table pes_pessoa 
        add constraint UK_lw8ntgk3rypstse0nqsf4slyv  unique (nomefantasia)

    alter table pes_pessoa 
        add constraint UK_krjltchmospf531j0vwwv4r0e  unique (nomerazaosocial)

    alter table pes_ramo 
        add constraint UK_rufuem2l8lbrsy1k6bkxih2wj  unique (descricao)

    alter table pes_setor 
        add constraint UK_gglxrjsijekc07mdjw1ldsgem  unique (descricao)

    alter table pes_sexo 
        add constraint UK_7sdpf93tfcpkhf4g868uwdjj4  unique (descricao)

    alter table cad_cidade 
        add constraint FK_agw5oyxeu5x0lbpghyx9dow8p 
        foreign key (idestado) 
        references cad_estado

    alter table cad_estado 
        add constraint FK_t8gh9ugedis05xsd3jon2erir 
        foreign key (idpais) 
        references cad_pais

    alter table pes_contato 
        add constraint FK_pu6neyrckpy2rcwm7p1jh46d5 
        foreign key (idpessoa) 
        references pes_pessoa

    alter table pes_documento 
        add constraint FK_orjla418wxmkb43rq41w36t01 
        foreign key (idpessoa) 
        references pes_pessoa

    alter table pes_endereco 
        add constraint FK_h1djmvi8a94b4yvym91vvuiqw 
        foreign key (idcidade) 
        references cad_cidade

    alter table pes_endereco 
        add constraint FK_se1ufpe4qtmunkbw5ieo4204e 
        foreign key (idestado) 
        references cad_estado

    alter table pes_endereco 
        add constraint FK_og3f7lgu1ghcuhw11l93cmcvg 
        foreign key (idpais) 
        references cad_pais

    alter table pes_endereco 
        add constraint FK_oed1obhfasdryq7sm08olrig9 
        foreign key (idpessoa) 
        references pes_pessoa

    alter table pes_informacao 
        add constraint FK_j1q0m7b7b0xsegowuc4tfgehw 
        foreign key (idcargo) 
        references pes_cargo

    alter table pes_informacao 
        add constraint FK_kc9bmy320yjttqxror2nk0xp5 
        foreign key (idespecializacao) 
        references pes_especializacao

    alter table pes_informacao 
        add constraint FK_6ksbcn5iped63dikdc9js2pfh 
        foreign key (idnacionalidade) 
        references pes_nacionalidade

    alter table pes_informacao 
        add constraint FK_fypft9s10ov44uhg8b4xpcf1r 
        foreign key (idnivelformacao) 
        references pes_nivelformacao

    alter table pes_informacao 
        add constraint FK_1umvbp8djd5w5c9w2w9k9p04m 
        foreign key (idnucleo) 
        references pes_nucleo

    alter table pes_informacao 
        add constraint FK_d3a0yb7k2cres9gxrdb26y8b5 
        foreign key (idpessoa) 
        references pes_pessoa

    alter table pes_informacao 
        add constraint FK_fuv3fxjy8q0nw6cuamg7wqp8q 
        foreign key (idramo) 
        references pes_ramo

    alter table pes_informacao 
        add constraint FK_7ww0qrkdmleqpwr2l9gprn2p 
        foreign key (idsetor) 
        references pes_setor

    alter table pes_informacao 
        add constraint FK_n8phfed2grvexfk0x1yj2kk97 
        foreign key (idtipocontratacao) 
        references pes_tipocontratacao

    alter table pes_informacao 
        add constraint FK_rt6kt4wh4j0t4gaxxtpb12cv0 
        foreign key (idtipofornecedor) 
        references pes_tipofornecedor

    alter table pes_informacaobancaria 
        add constraint FK_1ayva2cvoo9bq7m90nd9j16g4 
        foreign key (idbanco) 
        references fin_banco

    alter table pes_informacaobancaria 
        add constraint FK_ok5sptn3mejsry7y42evtmhpx 
        foreign key (idpessoa) 
        references pes_pessoa

    alter table pes_informacaobancaria 
        add constraint FK_2d2vnxvi8uo6la14q8rr6qqn5 
        foreign key (idtipoconta) 
        references fin_tipocontabancaria

    alter table pes_pessoa 
        add constraint FK_h1y6igi5ipm81tqvq9b4dv56y 
        foreign key (idestadocivil) 
        references pes_estadocivil

    alter table pes_pessoa 
        add constraint FK_oo30oav8i4km503tmloxqh0dn 
        foreign key (idsexo) 
        references pes_sexo

    alter table pes_pessoa 
        add constraint FK_dqw358rgpavswyy4p8udw79r0 
        foreign key (idtipo) 
        references pes_tipo
