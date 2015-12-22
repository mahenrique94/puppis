
    alter table adm_contato 
        drop constraint FK_j5a160pgyt4pils63lon4jhvs

    alter table adm_documento 
        drop constraint FK_flbbght8tn4o37j10neschh4s

    alter table adm_endereco 
        drop constraint FK_cpek7g7k77ar8q2c0fiu5pxr6

    alter table adm_endereco 
        drop constraint FK_b7futrfnv4ocqp6d64fvt5a5q

    alter table adm_endereco 
        drop constraint FK_ju5hgvna0j0fm6rtusmksl532

    alter table adm_endereco 
        drop constraint FK_kk954i6ngburh88r6sysnujjc

    alter table adm_usuario 
        drop constraint FK_9frru974u6l51oq3cpaskdv8l

    alter table cad_cidade 
        drop constraint FK_agw5oyxeu5x0lbpghyx9dow8p

    alter table cad_estado 
        drop constraint FK_t8gh9ugedis05xsd3jon2erir

    alter table com_nota 
        drop constraint FK_tl7y8op99j6m0r81k1hldjlp4

    alter table com_nota 
        drop constraint FK_4xfu47b7sryti5paeotlk113x

    alter table com_nota 
        drop constraint FK_mnjgcllxlpbexl7y4i1uus6n5

    alter table com_nota 
        drop constraint FK_kwehrpapq3ee5ddt21g95lbjy

    alter table com_notacusto 
        drop constraint FK_7bkab0w5nkpgfjqogwxhtlg4i

    alter table com_notacusto 
        drop constraint FK_q5bc6lnk2uhjlvmxa0o4bsajl

    alter table com_notaitens 
        drop constraint FK_9uqcrnb2kc58ax22h7l7gd1k2

    alter table com_notaitens 
        drop constraint FK_a4plfky7l1b38yaba7l5gbr2u

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

    alter table pes_pessoa 
        drop constraint FK_h1y6igi5ipm81tqvq9b4dv56y

    alter table pes_pessoa 
        drop constraint FK_oo30oav8i4km503tmloxqh0dn

    alter table pes_pessoa 
        drop constraint FK_dqw358rgpavswyy4p8udw79r0

    alter table ps_classe 
        drop constraint FK_qgsmg5r3djjfofu1lgnaf46n0

    alter table ps_custo 
        drop constraint FK_5ooecl1hu17j4w0nkuieswk98

    alter table ps_custo 
        drop constraint FK_t5slspvxo5kphol99qx7i5u12

    alter table ps_custo 
        drop constraint FK_smy51l54owetg55ynomhrnnfj

    alter table ps_estoque 
        drop constraint FK_dsdxuvhn8opr9w6mclh4emliw

    alter table ps_estoque 
        drop constraint FK_2ad8pgt61u7e48yu2cwriiu1o

    alter table ps_estoque 
        drop constraint FK_55j1tlb5v2ygs5w459uxm3uts

    alter table ps_produtoservico 
        drop constraint FK_4f0tm6lsngpq2f1oljno48m60

    alter table ps_produtoservico 
        drop constraint FK_p05m5ljfqt03yd9bgnlrnfwgw

    alter table ps_produtoservico 
        drop constraint FK_40r07i46pktst6cprev8ecy1w

    alter table ps_produtoservico 
        drop constraint FK_egytrkxvwcjj46nvt1dyl86dk

    alter table sys_tipooperacao 
        drop constraint FK_19r86pttj2b9mmhdwnj57v76i

    drop table if exists adm_comercio cascade

    drop table if exists adm_contato cascade

    drop table if exists adm_documento cascade

    drop table if exists adm_endereco cascade

    drop table if exists adm_tipoacesso cascade

    drop table if exists adm_usuario cascade

    drop table if exists cad_centrocusto cascade

    drop table if exists cad_cidade cascade

    drop table if exists cad_estado cascade

    drop table if exists cad_pais cascade

    drop table if exists com_nota cascade

    drop table if exists com_notacusto cascade

    drop table if exists com_notaitens cascade

    drop table if exists fin_banco cascade

    drop table if exists fin_formapagamento cascade

    drop table if exists fin_tipocontabancaria cascade

    drop table if exists pes_contato cascade

    drop table if exists pes_documento cascade

    drop table if exists pes_endereco cascade

    drop table if exists pes_estadocivil cascade

    drop table if exists pes_pessoa cascade

    drop table if exists pes_sexo cascade

    drop table if exists pes_tipo cascade

    drop table if exists ps_classe cascade

    drop table if exists ps_custo cascade

    drop table if exists ps_estoque cascade

    drop table if exists ps_grupo cascade

    drop table if exists ps_produtoservico cascade

    drop table if exists ps_tipo cascade

    drop table if exists ps_unidademedida cascade

    drop table if exists sys_modulo cascade

    drop table if exists sys_tipooperacao cascade

    create table adm_comercio (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        nomefantasia varchar(60) not null,
        razaosocial varchar(60) not null,
        primary key (id)
    )

    create table adm_contato (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        ddd int4,
        email varchar(255),
        telefone varchar(10),
        idcomercio int4 not null,
        primary key (id)
    )

    create table adm_documento (
        id  serial not null,
        cnpj varchar(20) not null,
        datacreate date not null,
        dataupdate timestamp not null,
        inscricaoestadual varchar(20) not null,
        idcomercio int4 not null,
        primary key (id)
    )

    create table adm_endereco (
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
        idcomercio int4 not null,
        primary key (id)
    )

    create table adm_tipoacesso (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(6) not null,
        primary key (id)
    )

    create table adm_usuario (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        inativo char(1) not null,
        nome varchar(60) not null,
        senha varchar(8) not null,
        usuario varchar(20) not null,
        idtipoacesso int4 not null,
        primary key (id)
    )

    create table cad_centrocusto (
        id  serial not null,
        conta int4 not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(60) not null,
        subconta int4 not null,
        primary key (id)
    )

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

    create table com_nota (
        id  bigserial not null,
        atualizada char(1) not null,
        cancelada char(1) not null,
        datacreate date not null,
        dataemissao date,
        dataentrada date,
        dataupdate timestamp not null,
        numeronota int4,
        serienota int4,
        idcliente int8,
        idfornecedor int8,
        idfuncionario int4 not null,
        idtipooperacao int4 not null,
        primary key (id)
    )

    create table com_notacusto (
        id  bigserial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        porcdesconto float8,
        porcicms float8,
        porcipi float8,
        valortotal float8 not null,
        idformapagamento int4 not null,
        idnota int8 not null,
        primary key (id)
    )

    create table com_notaitens (
        id  bigserial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        porcdesconto float8,
        porcicms float8,
        porcipi float8,
        porclucro float8,
        quantidade int4 not null,
        valortotal float8 not null,
        valorunitario float8 not null,
        iditem int8 not null,
        idnota int8 not null,
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

    create table fin_formapagamento (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(30) not null,
        intervalo int4,
        quantidadeparcela int4,
        primary key (id)
    )

    create table fin_tipocontabancaria (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(10) not null,
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

    create table pes_estadocivil (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(15) not null,
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

    create table ps_classe (
        id int4 not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(30) not null,
        idgrupo int4 not null,
        primary key (id)
    )

    create table ps_custo (
        id  bigserial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        porclucro float8 not null,
        valoranterior float8,
        valormax float8,
        valormin float8,
        valorpago float8 not null,
        valortotal float8 not null,
        valorvenda float8 not null,
        idclasse int4 not null,
        idgrupo int4 not null,
        idproduto int8 not null,
        primary key (id)
    )

    create table ps_estoque (
        id  bigserial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        quantidade int4 not null,
        quantidademax int4,
        quantidademin int4,
        quantidadeven int4,
        idclasse int4 not null,
        idgrupo int4 not null,
        idproduto int8 not null,
        primary key (id)
    )

    create table ps_grupo (
        id int4 not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(30) not null,
        primary key (id)
    )

    create table ps_produtoservico (
        id  bigserial not null,
        aceitadesconto char(1) not null,
        codigobarra varchar(120),
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(120) not null,
        inativo char(1) not null,
        marca varchar(30),
        idclasse int4 not null,
        idgrupo int4 not null,
        idtipo int4 not null,
        idunidademedida int4 not null,
        primary key (id)
    )

    create table ps_tipo (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(8) not null,
        primary key (id)
    )

    create table ps_unidademedida (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(10) not null,
        unidade char(2) not null,
        primary key (id)
    )

    create table sys_modulo (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao varchar(20) not null,
        inativo char(1) not null,
        primary key (id)
    )

    create table sys_tipooperacao (
        id  serial not null,
        datacreate date not null,
        dataupdate timestamp not null,
        descricao char(10) not null,
        tipo char(1) not null,
        idmodulo int4 not null,
        primary key (id)
    )

    alter table adm_comercio 
        add constraint UK_4xax2wnqte5srl5lvddg1nrur  unique (nomefantasia)

    alter table adm_comercio 
        add constraint UK_q60khaxgre9s8o8ylhhwvwqb  unique (razaosocial)

    alter table adm_contato 
        add constraint UK_j5a160pgyt4pils63lon4jhvs  unique (idcomercio)

    alter table adm_documento 
        add constraint UK_2lbednpp60rudqg0eo9e84srp  unique (cnpj)

    alter table adm_documento 
        add constraint UK_flbbght8tn4o37j10neschh4s  unique (idcomercio)

    alter table adm_endereco 
        add constraint UK_kk954i6ngburh88r6sysnujjc  unique (idcomercio)

    alter table adm_tipoacesso 
        add constraint UK_9pk5kus6d91yl61nmtahk7ht9  unique (descricao)

    alter table adm_usuario 
        add constraint UK_lv9o2ly3h6ujh4lrfxvcxwr2a  unique (nome)

    alter table adm_usuario 
        add constraint UK_rxk4v3bg8ttuhkb4ndjk2wvpf  unique (usuario)

    alter table cad_centrocusto 
        add constraint UK_9np1vl5uwp0ow46k585kmnsk7  unique (conta, subconta, id)

    alter table cad_centrocusto 
        add constraint UK_4to8on51fh7exf01hy0cev4os  unique (descricao)

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

    alter table pes_pessoa 
        add constraint UK_lw8ntgk3rypstse0nqsf4slyv  unique (nomefantasia)

    alter table pes_pessoa 
        add constraint UK_krjltchmospf531j0vwwv4r0e  unique (nomerazaosocial)

    alter table pes_sexo 
        add constraint UK_7sdpf93tfcpkhf4g868uwdjj4  unique (descricao)

    alter table ps_classe 
        add constraint UK_tnr4inlcqmhhfq5wbbff16grn  unique (idgrupo, id)

    alter table ps_custo 
        add constraint UK_oek0el37em16ap7b7y61mf8fr  unique (idgrupo, idclasse, idproduto)

    alter table ps_estoque 
        add constraint UK_bgnyu9onp4s9jisme8p9mmujb  unique (idgrupo, idclasse, idproduto)

    alter table ps_grupo 
        add constraint UK_5wofr9fld27n3j95vq3lbgept  unique (descricao)

    alter table ps_produtoservico 
        add constraint UK_dh3nfcvfjd8uqjsi7eysjjv61  unique (idgrupo, idclasse, id)

    alter table ps_produtoservico 
        add constraint UK_gdku24ojsp929iavd6n53j0iy  unique (codigobarra)

    alter table ps_produtoservico 
        add constraint UK_o2prqu0w4lfn268kq5sb3suf3  unique (descricao)

    alter table ps_tipo 
        add constraint UK_arre6t7y151pkwxlmiirav6mn  unique (descricao)

    alter table ps_unidademedida 
        add constraint UK_2v4ck8pu8r7y4pk1snth5i83l  unique (descricao)

    alter table ps_unidademedida 
        add constraint UK_i0li1u7w28wekbtff45hw4i2l  unique (unidade)

    alter table sys_modulo 
        add constraint UK_b56oi4u55ekr4dkkv4x12jk8n  unique (descricao)

    alter table sys_tipooperacao 
        add constraint UK_byy7r5yfchn7jgksda1d3rstd  unique (descricao)

    alter table adm_contato 
        add constraint FK_j5a160pgyt4pils63lon4jhvs 
        foreign key (idcomercio) 
        references adm_comercio

    alter table adm_documento 
        add constraint FK_flbbght8tn4o37j10neschh4s 
        foreign key (idcomercio) 
        references adm_comercio

    alter table adm_endereco 
        add constraint FK_cpek7g7k77ar8q2c0fiu5pxr6 
        foreign key (idcidade) 
        references cad_cidade

    alter table adm_endereco 
        add constraint FK_b7futrfnv4ocqp6d64fvt5a5q 
        foreign key (idestado) 
        references cad_estado

    alter table adm_endereco 
        add constraint FK_ju5hgvna0j0fm6rtusmksl532 
        foreign key (idpais) 
        references cad_pais

    alter table adm_endereco 
        add constraint FK_kk954i6ngburh88r6sysnujjc 
        foreign key (idcomercio) 
        references adm_comercio

    alter table adm_usuario 
        add constraint FK_9frru974u6l51oq3cpaskdv8l 
        foreign key (idtipoacesso) 
        references adm_tipoacesso

    alter table cad_cidade 
        add constraint FK_agw5oyxeu5x0lbpghyx9dow8p 
        foreign key (idestado) 
        references cad_estado

    alter table cad_estado 
        add constraint FK_t8gh9ugedis05xsd3jon2erir 
        foreign key (idpais) 
        references cad_pais

    alter table com_nota 
        add constraint FK_tl7y8op99j6m0r81k1hldjlp4 
        foreign key (idcliente) 
        references pes_pessoa

    alter table com_nota 
        add constraint FK_4xfu47b7sryti5paeotlk113x 
        foreign key (idfornecedor) 
        references pes_pessoa

    alter table com_nota 
        add constraint FK_mnjgcllxlpbexl7y4i1uus6n5 
        foreign key (idfuncionario) 
        references adm_usuario

    alter table com_nota 
        add constraint FK_kwehrpapq3ee5ddt21g95lbjy 
        foreign key (idtipooperacao) 
        references sys_tipooperacao

    alter table com_notacusto 
        add constraint FK_7bkab0w5nkpgfjqogwxhtlg4i 
        foreign key (idformapagamento) 
        references fin_formapagamento

    alter table com_notacusto 
        add constraint FK_q5bc6lnk2uhjlvmxa0o4bsajl 
        foreign key (idnota) 
        references com_nota

    alter table com_notaitens 
        add constraint FK_9uqcrnb2kc58ax22h7l7gd1k2 
        foreign key (iditem) 
        references ps_produtoservico

    alter table com_notaitens 
        add constraint FK_a4plfky7l1b38yaba7l5gbr2u 
        foreign key (idnota) 
        references com_nota

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

    alter table ps_classe 
        add constraint FK_qgsmg5r3djjfofu1lgnaf46n0 
        foreign key (idgrupo) 
        references ps_grupo

    alter table ps_custo 
        add constraint FK_5ooecl1hu17j4w0nkuieswk98 
        foreign key (idclasse) 
        references ps_classe

    alter table ps_custo 
        add constraint FK_t5slspvxo5kphol99qx7i5u12 
        foreign key (idgrupo) 
        references ps_grupo

    alter table ps_custo 
        add constraint FK_smy51l54owetg55ynomhrnnfj 
        foreign key (idproduto) 
        references ps_produtoservico

    alter table ps_estoque 
        add constraint FK_dsdxuvhn8opr9w6mclh4emliw 
        foreign key (idclasse) 
        references ps_classe

    alter table ps_estoque 
        add constraint FK_2ad8pgt61u7e48yu2cwriiu1o 
        foreign key (idgrupo) 
        references ps_grupo

    alter table ps_estoque 
        add constraint FK_55j1tlb5v2ygs5w459uxm3uts 
        foreign key (idproduto) 
        references ps_produtoservico

    alter table ps_produtoservico 
        add constraint FK_4f0tm6lsngpq2f1oljno48m60 
        foreign key (idclasse) 
        references ps_classe

    alter table ps_produtoservico 
        add constraint FK_p05m5ljfqt03yd9bgnlrnfwgw 
        foreign key (idgrupo) 
        references ps_grupo

    alter table ps_produtoservico 
        add constraint FK_40r07i46pktst6cprev8ecy1w 
        foreign key (idtipo) 
        references ps_tipo

    alter table ps_produtoservico 
        add constraint FK_egytrkxvwcjj46nvt1dyl86dk 
        foreign key (idunidademedida) 
        references ps_unidademedida

    alter table sys_tipooperacao 
        add constraint FK_19r86pttj2b9mmhdwnj57v76i 
        foreign key (idmodulo) 
        references sys_modulo
