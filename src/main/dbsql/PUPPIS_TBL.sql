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