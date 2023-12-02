create table dRaca(
	IdRaca integer not null,
	Sigla integer not null,
	Descricao varchar(17) not null,
	constraint pkRaca primary key (IdRaca)
);

create table dDeficiencia(
	IdDeficiencia integer not null,
	Sigla integer not null,
	Descricao varchar(21),
	constraint pkDeficiencia primary key (IdDeficiencia)
);

create table dSexo(
	IdSexo integer not null,
	Sigla integer not null,
	Descricao varchar(17),
	constraint pkSexo primary key (IdSexo)
);

create table dTipoEmpregador(
	IdTipoEmpregador integer not null,
	Sigla integer not null,
	Descricao varchar(21),
	constraint pkTipoEmpregador primary key (IdTipoEmpregador)
);

create table dEscolaridade(
	IdEscolaridade integer not null,
	Sigla integer not null,
	Descricao varchar(24),
	constraint pkEscolaridade primary key (IdEscolaridade)
);

create table dMotivoMovimentacao(
	IdMotivoMovimentacao integer not null,
	Sigla integer not null,
	Descricao varchar(53),
	constraint pkMotivoMovimentacao primary key (IdMotivoMovimentacao)
);

create table dLocalizacao(
	IdLocalizacao integer not null,
	RegiaoGeografica varchar(17) not null,
	UnidadeFederativa varchar(20) not null,
	Municipio varchar(36) not null,
	IDH integer not null,
	constraint pkLocalizacao primary key (IdLocalizacao)
);

create table dTempo(
	IdTempo integer not null,
	Ano integer not null,
	Mes varchar(10) not null,
	constraint pkTempo primary key (IdTempo)
);

create table dCargoDoEmpregado(
	IdCargoDoEmpregado integer not null,
	Sigla integer not null,
	Cbo2002Ocupacao varchar(137) not null,
	constraint pkCargoDoEmpregado primary key (IdCargoDoEmpregado)
);

create table dSetorDoEmpregador(
	IdSetorDoEmpregador integer not null,
	Sigla integer not null,
	Secao varchar(65) not null,
	Subclasse varchar(151) not null,
	constraint pkSetorDoEmpregador primary key (IdSetorDoEmpregador)
);

create table fMovimentacao(
	IdTempo integer not null,
	IdLocalizacao integer not null,
	IdTipoEmpregador integer not null,
	IdEscolaridade integer not null,
	IdMotivoMovimentacao integer not null,
	IdCargoDoEmpregado integer not null,
	IdSetorDoEmpregador integer not null,
	IdRaca integer not null,
	IdSexo integer not null,
	IdDeficiencia integer not null,
	Idade integer not null,
	Salario real not null,
	ValorSalarioFixo real not null,
	HorasContratuaisSemanais integer not null,
	TipoMovimentacao integer not null, /*Pode ser 1 ou -1*/
	Indtrabintermitente integer not null,
	constraint pkMovimentacao primary key (IdTempo, IdLocalizacao, IdTipoEmpregador, IdEscolaridade,
IdMotivoMovimentacao, IdCargoDoEmpregado, IdSetorDoEmpregador, IdRaca, IdSexo, IdDeficiencia),
	constraint fkMovimentacaoTempo foreign key (IdTempo) references dTempo(IdTempo),
	constraint fkMovimentacaoLocalizacao foreign key (IdLocalizacao) references dLocalizacao(IdLocalizacao),
	constraint fkMovimentacaoTipoEmpregador foreign key (IdTipoEmpregador) references
dTipoEmpregador(IdTipoEmpregador),
	constraint fkMovimentacaoEscolaridade foreign key (IdEscolaridade) references
dEscolaridade(IdEscolaridade),
	constraint fkMovimentacaoCargoDoEmpregado foreign key (IdCargoDoEmpregado) references
dCargoDoEmpregado(IdCargoDoEmpregado),
	constraint fkMovimentacaoSetorDoEmpregador foreign key (IdSetorDoEmpregador) references
dSetorDoEmpregador(IdSetorDoEmpregador),
	constraint fkMovimentacaoRaca foreign key (IdRaca) references dRaca(IdRaca),
	constraint fkMovimentacaoSexo foreign key (IdSexo) references dSexo(IdSexo),
	constraint fkMovimentacaoDeficiencia foreign key (IdDeficiencia) references dDeficiencia(IdDeficiencia)
);