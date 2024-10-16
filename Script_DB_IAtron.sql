CREATE TABLE tbl_ajuste (
                            id_ajuste          INTEGER NOT NULL,
                            ajt_data           TIMESTAMP NOT NULL,
                            ajt_qntd_n         NUMBER(10, 2),
                            ajt_qntd_p         NUMBER(10, 2),
                            ajt_qntd_k         NUMBER(10, 2),
                            ajt_qntd_agua      NUMBER(10, 2),
                            ajt_tipo_irrigacao VARCHAR(40 CHAR),
                            ajt_vazao          NUMBER(10, 2),
                            ajt_duracao        NUMBER(10, 2),
                            id_zona            INTEGER NOT NULL
)
    LOGGING;

ALTER TABLE tbl_ajuste ADD CONSTRAINT tbl_ajuste_pk PRIMARY KEY ( id_ajuste );

CREATE TABLE tbl_cultura (
                             id_cultura     INTEGER NOT NULL,
                             ctr_nome       VARCHAR(50 CHAR) NOT NULL,
                             ctr_ciclo_vida VARCHAR(25 CHAR),
                             id_solo        INTEGER NOT NULL
)
    LOGGING;

ALTER TABLE tbl_cultura ADD CONSTRAINT tbl_cultura_pk PRIMARY KEY ( id_cultura );

CREATE TABLE tbl_fazenda (
                             id_fazenda   INTEGER NOT NULL,
                             fzd_nome     VARCHAR(100 CHAR) NOT NULL,
                             fzd_endereco VARCHAR(200 CHAR) NOT NULL
)
    LOGGING;

ALTER TABLE tbl_fazenda ADD CONSTRAINT tbl_fazenda_pk PRIMARY KEY ( id_fazenda );

CREATE TABLE tbl_irrigacao (
                               id_irrigacao  INTEGER NOT NULL,
                               irr_data      TIMESTAMP NOT NULL,
                               irr_qntd_agua NUMBER(6, 2) NOT NULL,
                               id_zona       INTEGER NOT NULL
)
    LOGGING;

ALTER TABLE tbl_irrigacao ADD CONSTRAINT tbl_irrigacao_pk PRIMARY KEY ( id_irrigacao );

CREATE TABLE tbl_leitura (
                             id_leitura      INTEGER NOT NULL,
                             ltr_data        TIMESTAMP NOT NULL,
                             ltr_umidade     NUMBER(6, 2),
                             ltr_ph          NUMBER(6, 2),
                             ltr_nutriente_n NUMBER(6, 2),
                             ltr_nutriente_p NUMBER(6, 2),
                             ltr_nutriente_k NUMBER(6, 2),
                             id_sensor       INTEGER NOT NULL
)
    LOGGING;

ALTER TABLE tbl_leitura ADD CONSTRAINT tbl_leitura_pk PRIMARY KEY ( id_leitura );

CREATE TABLE tbl_praga_doenca (
                                  id_praga_doenca           INTEGER NOT NULL,
                                  pd_nome                   VARCHAR(50 CHAR) NOT NULL,
                                  pd_descricao              VARCHAR(150 CHAR),
                                  pd_tratamento_recomendado VARCHAR(150 CHAR)
)
    LOGGING;

ALTER TABLE tbl_praga_doenca ADD CONSTRAINT tbl_praga_doenca_pk PRIMARY KEY ( id_praga_doenca );

CREATE TABLE tbl_sensor (
                            id_sensor           INTEGER NOT NULL,
                            sns_tipo_sensor     VARCHAR(50 CHAR) NOT NULL,
                            sns_data_calibracao TIMESTAMP NOT NULL,
                            sns_modelo          VARCHAR(50 CHAR) NOT NULL,
                            sns_area            NUMBER(10, 2) NOT NULL,
                            id_zona             INTEGER NOT NULL
)
    LOGGING;

ALTER TABLE tbl_sensor ADD CONSTRAINT tbl_sensor_pk PRIMARY KEY ( id_sensor );

CREATE TABLE tbl_solo (
                          id_solo             INTEGER NOT NULL,
                          slo_tipo_solo       VARCHAR(25 CHAR) NOT NULL,
                          slo_ph_desejado     NUMBER(6, 2),
                          slo_umidade_ideal   NUMBER(6, 2),
                          slo_caracteristicas VARCHAR(140 CHAR),
                          id_zona             INTEGER NOT NULL
)
    LOGGING;

ALTER TABLE tbl_solo ADD CONSTRAINT tbl_solo_pk PRIMARY KEY ( id_solo );

CREATE TABLE tbl_tratamento (
                                id_tratamento   INTEGER NOT NULL,
                                trt_data        TIMESTAMP NOT NULL,
                                trt_produto     VARCHAR(50 CHAR) NOT NULL,
                                trt_dosagem     NUMBER(10, 2) NOT NULL,
                                id_zona         INTEGER NOT NULL,
                                id_praga_doenca INTEGER NOT NULL
)
    LOGGING;

ALTER TABLE tbl_tratamento ADD CONSTRAINT tbl_tratamento_pk PRIMARY KEY ( id_tratamento );

CREATE TABLE tbl_zona_plant (
                                id_zona       INTEGER NOT NULL,
                                zna_descricao VARCHAR(100 BYTE) NOT NULL,
                                zna_geometria sdo_geometry NOT NULL,
                                id_fazenda    INTEGER NOT NULL,
                                id_cultura    INTEGER NOT NULL,
                                id_solo       INTEGER NOT NULL
)
    LOGGING;

ALTER TABLE tbl_zona_plant ADD CONSTRAINT tbl_zona_plant_pk PRIMARY KEY ( id_zona );

ALTER TABLE tbl_ajuste
    ADD CONSTRAINT tbl_ajuste_tbl_zona_plant_fk FOREIGN KEY ( id_zona )
        REFERENCES tbl_zona_plant ( id_zona )
            ON DELETE CASCADE
            NOT DEFERRABLE;

ALTER TABLE tbl_cultura
    ADD CONSTRAINT tbl_cultura_tbl_solo_fk FOREIGN KEY ( id_solo )
        REFERENCES tbl_solo ( id_solo )
            NOT DEFERRABLE;

ALTER TABLE tbl_irrigacao
    ADD CONSTRAINT tbl_irrigacao_tbl_zona_plant_fk FOREIGN KEY ( id_zona )
        REFERENCES tbl_zona_plant ( id_zona )
            ON DELETE CASCADE
            NOT DEFERRABLE;

ALTER TABLE tbl_leitura
    ADD CONSTRAINT tbl_leitura_tbl_sensor_fk FOREIGN KEY ( id_sensor )
        REFERENCES tbl_sensor ( id_sensor )
            ON DELETE CASCADE
            NOT DEFERRABLE;

ALTER TABLE tbl_sensor
    ADD CONSTRAINT tbl_sensor_tbl_zona_plant_fk FOREIGN KEY ( id_zona )
        REFERENCES tbl_zona_plant ( id_zona )
            ON DELETE CASCADE
            NOT DEFERRABLE;

ALTER TABLE tbl_tratamento
    ADD CONSTRAINT tbl_tratamento_tbl_praga_doenca_fk FOREIGN KEY ( id_praga_doenca )
        REFERENCES tbl_praga_doenca ( id_praga_doenca )
            ON DELETE CASCADE
            NOT DEFERRABLE;

ALTER TABLE tbl_tratamento
    ADD CONSTRAINT tbl_tratamento_tbl_zona_plant_fk FOREIGN KEY ( id_zona )
        REFERENCES tbl_zona_plant ( id_zona )
            ON DELETE CASCADE
            NOT DEFERRABLE;

ALTER TABLE tbl_zona_plant
    ADD CONSTRAINT tbl_zona_plant_tbl_cultura_fk FOREIGN KEY ( id_cultura )
        REFERENCES tbl_cultura ( id_cultura )
            ON DELETE CASCADE
            NOT DEFERRABLE;

ALTER TABLE tbl_zona_plant
    ADD CONSTRAINT tbl_zona_plant_tbl_fazenda_fk FOREIGN KEY ( id_fazenda )
        REFERENCES tbl_fazenda ( id_fazenda )
            ON DELETE CASCADE
            NOT DEFERRABLE;

ALTER TABLE tbl_zona_plant
    ADD CONSTRAINT tbl_zona_plant_tbl_solo_fk FOREIGN KEY ( id_solo )
        REFERENCES tbl_solo ( id_solo )
            NOT DEFERRABLE;

