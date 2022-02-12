CREATE DATABASE bdfinal;
USE bdfinal;

#Jogador(id_jogador, nome, apelido, idade, nro_vitorias, nro_derrotas)
CREATE TABLE Jogador(id_jogador integer not null auto_increment, nome varchar(20), apelido varchar(10), idade integer, nro_vitorias integer, nro_derrotas integer,
	PRIMARY KEY (id_jogador)
)Engine=innoDB;

#Deck(id_deck, nro_partidas, qtde_vitorias, qtde_derrotas, #id_jogador)
CREATE TABLE Deck(id_deck integer not null auto_increment, nro_partidas integer, qtde_vitorias integer, qtde_derrotas integer, id_jogador integer,
	PRIMARY KEY (id_deck),
	FOREIGN KEY (id_jogador) REFERENCES Jogador(id_jogador)
)Engine=innoDB;

#um id para cada tipo de carta sejam elas (Normal, Continua, Campo, Rapida, Resposta, Fusao, Ritual, Efeito, Sincro, Xyz, Pendulo)
CREATE TABLE TiposCarta(id_tipo_carta integer not null auto_increment, tipo_carta varchar(20),
	PRIMARY KEY (id_tipo_carta)
)Engine=innoDB;

#Carta_Armadilha(#cod_serie,#id_carta , Normal, Resposta, Continua)
#Carta_Magica(#cod_serie,#id_carta Normal, Continua, Campo, Rapida)
#Carta_Monstro(#cod_serie,# id_carta, Normal, Fusao, Ritual, Efeito, Sincro, Xyz, Pendulo)
CREATE TABLE NaturezaCarta(id_carta integer not null auto_increment, tipo_natureza varchar(15),
	PRIMARY KEY (id_carta)
)Engine=innoDB;

#Carta(id_carta, nome_carta, nro_edicao, descricao, #id_deck, id_natureza, id_tipo_carta)
CREATE TABLE Carta(id_carta integer not null auto_increment, nome_carta varchar(40), nro_edicao integer, descricao varchar(500), id_deck integer, id_natureza integer, id_tipo integer,
    PRIMARY KEY (id_carta),
	FOREIGN KEY (id_deck) REFERENCES Deck(id_deck),
    FOREIGN KEY (id_natureza) REFERENCES NaturezaCarta(id_carta),
    FOREIGN KEY (id_tipo) REFERENCES TiposCarta(id_tipo_carta)
)Engine=innoDB;

#Partida(cod_partida, tipo_campo, qtd_turnos, resultado)
CREATE TABLE Partida(cod_partida integer not null auto_increment, tipo_campo varchar(10), qtd_turnos integer, vencedor integer, perdedor integer,
	PRIMARY KEY (cod_partida),
    FOREIGN KEY (vencedor) REFERENCES Jogador(id_jogador),
    FOREIGN KEY (perdedor) REFERENCES Jogador(id_jogador)
)Engine=innoDB;

#PartidaDeck(#id_deck, #cod_partida)
CREATE TABLE PartidaDeck(id_deck integer, cod_partida integer,
	PRIMARY KEY (id_deck),
	FOREIGN KEY (id_deck) REFERENCES Deck(id_deck),
    FOREIGN KEY (cod_partida) REFERENCES Partida(cod_partida)
)Engine=innoDB;

#Turno(id_turno, id_jogador_1, id_jogador_2, hp_jogador_1, hp_jogador_2, #cod_partida)
CREATE TABLE Turno(id_turno integer not null auto_increment, id_jogador_1 integer, id_jogador_2 integer, hp_jogador_1 integer, hp_jogador_2 integer, cod_partida integer,
	PRIMARY KEY (id_turno),
    FOREIGN KEY (cod_partida) REFERENCES Partida(cod_partida),
    FOREIGN KEY (id_jogador_1) REFERENCES Jogador(id_jogador),
    FOREIGN KEY (id_jogador_2) REFERENCES Jogador(id_jogador)
)Engine=innoDB;

