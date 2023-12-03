create table dRaca(
	IdRaca integer not null,
	Descricao varchar(255),
	constraint pkRaca primary key (IdRaca)
);

create table dDeficiencia(
	IdDeficiencia integer not null,
	Descricao varchar(255),
	constraint pkDeficiencia primary key (IdDeficiencia)
);

create table dSexo(
	IdSexo integer not null,
	Descricao varchar(255),
	constraint pkSexo primary key (IdSexo)
);

create table dTipoEmpregador(
	IdTipoEmpregador integer not null,
	Descricao varchar(255),
	constraint pkTipoEmpregador primary key (IdTipoEmpregador)
);

create table dEscolaridade(
	IdEscolaridade integer not null,
	Descricao varchar(255),
	constraint pkEscolaridade primary key (IdEscolaridade)
);

create table dMotivoMovimentacao(
	IdMotivoMovimentacao integer not null,
	Descricao varchar(255),
	constraint pkMotivoMovimentacao primary key (IdMotivoMovimentacao)
);

create table dLocalizacao(
	IdLocalizacao integer not null,
	RegiaoGeografica varchar(255) not null,
	UnidadeFederativa varchar(255) not null,
	Municipio varchar(255) not null,
	constraint pkLocalizacao primary key (IdLocalizacao)
);

create table dTempo(
	IdTempo integer not null,
	Ano integer not null,
	Mes varchar(10) not null,
	constraint pkTempo primary key (IdTempo)
);

create table dCargoDoEmpregado(
	IdCBCO2002 integer not null,
	Descricao varchar(255),
	constraint pkCargoDoEmpregado primary key (IdCBCO2002)
);

create table dSetorDoEmpregador(
	IdSetorDoEmpregador integer not null,
	Descricao varchar(255),
	constraint pkSetorDoEmpregador primary key (IdSetorDoEmpregador)
);

create table fMovimentacao(
	IdTempo integer not null,
	IdLocalizacao integer not null,
	IdTipoEmpregador integer not null,
	IdEscolaridade integer not null,
	IdCargoDoEmpregado integer not null,
	IdSetorDoEmpregador integer not null,
	IdMotivoMovimentacao integer not null,
	IdRaca integer not null,
	IdSexo integer not null,
	IdDeficiencia integer not null,
	Idade integer not null,
	Salario real not null,
	HorasContratuaisSemanais integer not null,
	TipoMovimentacao integer not null, /*Pode ser 1 ou -1*/
	
	constraint pkMovimentacao primary key (IdTempo, IdLocalizacao, IdTipoEmpregador, IdEscolaridade,
IdMotivoMovimentacao, IdCargoDoEmpregado, IdSetorDoEmpregador, IdRaca, IdSexo, IdDeficiencia),
	constraint fkMovimentacaoTempo foreign key (IdTempo) references dTempo(IdTempo),
	constraint fkMovimentacaoLocalizacao foreign key (IdLocalizacao) references dLocalizacao(IdLocalizacao),
	constraint fkMovimentacaoTipoEmpregador foreign key (IdTipoEmpregador) references
dTipoEmpregador(IdTipoEmpregador),
	constraint fkMovimentacaoEscolaridade foreign key (IdEscolaridade) references
dEscolaridade(IdEscolaridade),
	constraint fkMovimentacaoCargoDoEmpregado foreign key (IdCargoDoEmpregado) references
dCargoDoEmpregado(IdCBCO2002),
	constraint fkMovimentacaoSetorDoEmpregador foreign key (IdSetorDoEmpregador) references
dSetorDoEmpregador(IdSetorDoEmpregador),
	constraint fkMovimentacaoRaca foreign key (IdRaca) references dRaca(IdRaca),
	constraint fkMovimentacaoSexo foreign key (IdSexo) references dSexo(IdSexo),
	constraint fkMovimentacaoDeficiencia foreign key (IdDeficiencia) references dDeficiencia(IdDeficiencia)
);