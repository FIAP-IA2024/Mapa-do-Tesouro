-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2024-10-09 18:27:36 BRT
--   site:      Oracle Database 12cR2
--   tipo:      Oracle Database 12cR2



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE tbl_ajuste (
    id_ajuste          INTEGER NOT NULL,
    ajt_data           TIMESTAMP NOT NULL,
    ajt_qntd_n         NUMBER(10, 2),
    ajt_qntd_p         NUMBER(10, 2),
    ajt_qntd_k         NUMBER(10, 2),
    ajt_qntd_agua      NUMBER(10, 2),
    ajt_tipo_irrigacao VARCHAR2(40 CHAR),
    ajt_vazao          NUMBER(10, 2),
    ajt_duracao        NUMBER(10, 2),
    id_zona            INTEGER NOT NULL
);

ALTER TABLE tbl_ajuste ADD CONSTRAINT tbl_ajuste_pk PRIMARY KEY ( id_ajuste );


CREATE TABLE tbl_AJUSTE_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ID_AJUSTE INTEGER NOT NULL
 ,ajt_DATA TIMESTAMP NOT NULL
 ,ajt_QNTD_N NUMBER (10,2)
 ,ajt_QNTD_P NUMBER (10,2)
 ,ajt_QNTD_K NUMBER (10,2)
 ,ajt_QNTD_AGUA NUMBER (10,2)
 ,ajt_TIPO_IRRIGACAO VARCHAR2 (40 CHAR)
 ,ajt_VAZAO NUMBER (10,2)
 ,ajt_DURACAO NUMBER (10,2)
 ,ID_ZONA INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER tbl_AJUSTE_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON tbl_AJUSTE for each row 
 Declare 
  rec tbl_AJUSTE_JN%ROWTYPE; 
  blank tbl_AJUSTE_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ID_AJUSTE := :NEW.ID_AJUSTE; 
      rec.ajt_DATA := :NEW.ajt_DATA; 
      rec.ajt_QNTD_N := :NEW.ajt_QNTD_N; 
      rec.ajt_QNTD_P := :NEW.ajt_QNTD_P; 
      rec.ajt_QNTD_K := :NEW.ajt_QNTD_K; 
      rec.ajt_QNTD_AGUA := :NEW.ajt_QNTD_AGUA; 
      rec.ajt_TIPO_IRRIGACAO := :NEW.ajt_TIPO_IRRIGACAO; 
      rec.ajt_VAZAO := :NEW.ajt_VAZAO; 
      rec.ajt_DURACAO := :NEW.ajt_DURACAO; 
      rec.ID_ZONA := :NEW.ID_ZONA; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ID_AJUSTE := :OLD.ID_AJUSTE; 
      rec.ajt_DATA := :OLD.ajt_DATA; 
      rec.ajt_QNTD_N := :OLD.ajt_QNTD_N; 
      rec.ajt_QNTD_P := :OLD.ajt_QNTD_P; 
      rec.ajt_QNTD_K := :OLD.ajt_QNTD_K; 
      rec.ajt_QNTD_AGUA := :OLD.ajt_QNTD_AGUA; 
      rec.ajt_TIPO_IRRIGACAO := :OLD.ajt_TIPO_IRRIGACAO; 
      rec.ajt_VAZAO := :OLD.ajt_VAZAO; 
      rec.ajt_DURACAO := :OLD.ajt_DURACAO; 
      rec.ID_ZONA := :OLD.ID_ZONA; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into tbl_AJUSTE_JN VALUES rec; 
  END; 
  /CREATE TABLE tbl_cultura (
    id_cultura     INTEGER NOT NULL,
    ctr_nome       VARCHAR2(50 CHAR) NOT NULL,
    ctr_ciclo_vida VARCHAR2(25 CHAR),
    id_solo        INTEGER NOT NULL
);

ALTER TABLE tbl_cultura ADD CONSTRAINT tbl_cultura_pk PRIMARY KEY ( id_cultura );


CREATE TABLE tbl_CULTURA_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ID_CULTURA INTEGER NOT NULL
 ,ctr_NOME VARCHAR2 (50 CHAR) NOT NULL
 ,ctr_CICLO_VIDA VARCHAR2 (25 CHAR)
 ,ID_SOLO INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER tbl_CULTURA_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON tbl_CULTURA for each row 
 Declare 
  rec tbl_CULTURA_JN%ROWTYPE; 
  blank tbl_CULTURA_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ID_CULTURA := :NEW.ID_CULTURA; 
      rec.ctr_NOME := :NEW.ctr_NOME; 
      rec.ctr_CICLO_VIDA := :NEW.ctr_CICLO_VIDA; 
      rec.ID_SOLO := :NEW.ID_SOLO; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ID_CULTURA := :OLD.ID_CULTURA; 
      rec.ctr_NOME := :OLD.ctr_NOME; 
      rec.ctr_CICLO_VIDA := :OLD.ctr_CICLO_VIDA; 
      rec.ID_SOLO := :OLD.ID_SOLO; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into tbl_CULTURA_JN VALUES rec; 
  END; 
  /CREATE TABLE tbl_fazenda (
    id_fazenda   INTEGER NOT NULL,
    fzd_nome     VARCHAR2(100 CHAR) NOT NULL,
    fzd_endereco VARCHAR2(200 CHAR) NOT NULL
);

ALTER TABLE tbl_fazenda ADD CONSTRAINT tbl_fazenda_pk PRIMARY KEY ( id_fazenda );


CREATE TABLE tbl_FAZENDA_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ID_FAZENDA INTEGER NOT NULL
 ,fzd_NOME VARCHAR2 (100 CHAR) NOT NULL
 ,fzd_ENDERECO VARCHAR2 (200 CHAR) NOT NULL
 );

CREATE OR REPLACE TRIGGER tbl_FAZENDA_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON tbl_FAZENDA for each row 
 Declare 
  rec tbl_FAZENDA_JN%ROWTYPE; 
  blank tbl_FAZENDA_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ID_FAZENDA := :NEW.ID_FAZENDA; 
      rec.fzd_NOME := :NEW.fzd_NOME; 
      rec.fzd_ENDERECO := :NEW.fzd_ENDERECO; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ID_FAZENDA := :OLD.ID_FAZENDA; 
      rec.fzd_NOME := :OLD.fzd_NOME; 
      rec.fzd_ENDERECO := :OLD.fzd_ENDERECO; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into tbl_FAZENDA_JN VALUES rec; 
  END; 
  /CREATE TABLE tbl_irrigacao (
    id_irrigacao  INTEGER NOT NULL,
    irr_data      TIMESTAMP NOT NULL,
    irr_qntd_agua NUMBER(6, 2) NOT NULL,
    id_zona       INTEGER NOT NULL
);

ALTER TABLE tbl_irrigacao ADD CONSTRAINT tbl_irrigacao_pk PRIMARY KEY ( id_irrigacao );


CREATE TABLE tbl_IRRIGACAO_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ID_IRRIGACAO INTEGER NOT NULL
 ,irr_DATA TIMESTAMP NOT NULL
 ,irr_QNTD_AGUA NUMBER (6,2) NOT NULL
 ,ID_ZONA INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER tbl_IRRIGACAO_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON tbl_IRRIGACAO for each row 
 Declare 
  rec tbl_IRRIGACAO_JN%ROWTYPE; 
  blank tbl_IRRIGACAO_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ID_IRRIGACAO := :NEW.ID_IRRIGACAO; 
      rec.irr_DATA := :NEW.irr_DATA; 
      rec.irr_QNTD_AGUA := :NEW.irr_QNTD_AGUA; 
      rec.ID_ZONA := :NEW.ID_ZONA; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ID_IRRIGACAO := :OLD.ID_IRRIGACAO; 
      rec.irr_DATA := :OLD.irr_DATA; 
      rec.irr_QNTD_AGUA := :OLD.irr_QNTD_AGUA; 
      rec.ID_ZONA := :OLD.ID_ZONA; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into tbl_IRRIGACAO_JN VALUES rec; 
  END; 
  /CREATE TABLE tbl_leitura (
    id_leitura      INTEGER NOT NULL,
    ltr_data        TIMESTAMP NOT NULL,
    ltr_umidade     NUMBER(6, 2),
    ltr_ph          NUMBER(6, 2),
    ltr_nutriente_n NUMBER(6, 2),
    ltr_nutriente_p NUMBER(6, 2),
    ltr_nutriente_k NUMBER(6, 2),
    id_sensor       INTEGER NOT NULL
);

ALTER TABLE tbl_leitura ADD CONSTRAINT tbl_leitura_pk PRIMARY KEY ( id_leitura );


CREATE TABLE tbl_LEITURA_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ID_LEITURA INTEGER NOT NULL
 ,ltr_DATA TIMESTAMP NOT NULL
 ,ltr_UMIDADE NUMBER (6,2)
 ,ltr_PH NUMBER (6,2)
 ,ltr_NUTRIENTE_N NUMBER (6,2)
 ,ltr_NUTRIENTE_P NUMBER (6,2)
 ,ltr_NUTRIENTE_K NUMBER (6,2)
 ,ID_SENSOR INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER tbl_LEITURA_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON tbl_LEITURA for each row 
 Declare 
  rec tbl_LEITURA_JN%ROWTYPE; 
  blank tbl_LEITURA_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ID_LEITURA := :NEW.ID_LEITURA; 
      rec.ltr_DATA := :NEW.ltr_DATA; 
      rec.ltr_UMIDADE := :NEW.ltr_UMIDADE; 
      rec.ltr_PH := :NEW.ltr_PH; 
      rec.ltr_NUTRIENTE_N := :NEW.ltr_NUTRIENTE_N; 
      rec.ltr_NUTRIENTE_P := :NEW.ltr_NUTRIENTE_P; 
      rec.ltr_NUTRIENTE_K := :NEW.ltr_NUTRIENTE_K; 
      rec.ID_SENSOR := :NEW.ID_SENSOR; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ID_LEITURA := :OLD.ID_LEITURA; 
      rec.ltr_DATA := :OLD.ltr_DATA; 
      rec.ltr_UMIDADE := :OLD.ltr_UMIDADE; 
      rec.ltr_PH := :OLD.ltr_PH; 
      rec.ltr_NUTRIENTE_N := :OLD.ltr_NUTRIENTE_N; 
      rec.ltr_NUTRIENTE_P := :OLD.ltr_NUTRIENTE_P; 
      rec.ltr_NUTRIENTE_K := :OLD.ltr_NUTRIENTE_K; 
      rec.ID_SENSOR := :OLD.ID_SENSOR; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into tbl_LEITURA_JN VALUES rec; 
  END; 
  /CREATE TABLE tbl_praga_doenca (
    id_praga_doenca           INTEGER NOT NULL,
    pd_nome                   VARCHAR2(50 CHAR) NOT NULL,
    pd_descricao              VARCHAR2(150 CHAR),
    pd_tratamento_recomendado VARCHAR2(150 CHAR)
);

ALTER TABLE tbl_praga_doenca ADD CONSTRAINT tbl_praga_doenca_pk PRIMARY KEY ( id_praga_doenca );


CREATE TABLE tbl_PRAGA_DOENCA_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ID_PRAGA_DOENCA INTEGER NOT NULL
 ,pd_NOME VARCHAR2 (50 CHAR) NOT NULL
 ,pd_DESCRICAO VARCHAR2 (150 CHAR)
 ,pd_TRATAMENTO_RECOMENDADO VARCHAR2 (150 CHAR)
 );

CREATE OR REPLACE TRIGGER tbl_PRAGA_DOENCA_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON tbl_PRAGA_DOENCA for each row 
 Declare 
  rec tbl_PRAGA_DOENCA_JN%ROWTYPE; 
  blank tbl_PRAGA_DOENCA_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ID_PRAGA_DOENCA := :NEW.ID_PRAGA_DOENCA; 
      rec.pd_NOME := :NEW.pd_NOME; 
      rec.pd_DESCRICAO := :NEW.pd_DESCRICAO; 
      rec.pd_TRATAMENTO_RECOMENDADO := :NEW.pd_TRATAMENTO_RECOMENDADO; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ID_PRAGA_DOENCA := :OLD.ID_PRAGA_DOENCA; 
      rec.pd_NOME := :OLD.pd_NOME; 
      rec.pd_DESCRICAO := :OLD.pd_DESCRICAO; 
      rec.pd_TRATAMENTO_RECOMENDADO := :OLD.pd_TRATAMENTO_RECOMENDADO; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into tbl_PRAGA_DOENCA_JN VALUES rec; 
  END; 
  /CREATE TABLE tbl_sensor (
    id_sensor           INTEGER NOT NULL,
    sns_tipo_sensor     VARCHAR2(50 CHAR) NOT NULL,
    sns_data_calibracao TIMESTAMP NOT NULL,
    sns_modelo          VARCHAR2(50 CHAR) NOT NULL,
    sns_area            NUMBER(10, 2) NOT NULL,
    id_zona             INTEGER NOT NULL
);

ALTER TABLE tbl_sensor ADD CONSTRAINT tbl_sensor_pk PRIMARY KEY ( id_sensor );


CREATE TABLE tbl_SENSOR_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ID_SENSOR INTEGER NOT NULL
 ,sns_TIPO_SENSOR VARCHAR2 (50 CHAR) NOT NULL
 ,sns_DATA_CALIBRACAO TIMESTAMP NOT NULL
 ,sns_MODELO VARCHAR2 (50 CHAR) NOT NULL
 ,sns_AREA NUMBER (10,2) NOT NULL
 ,ID_ZONA INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER tbl_SENSOR_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON tbl_SENSOR for each row 
 Declare 
  rec tbl_SENSOR_JN%ROWTYPE; 
  blank tbl_SENSOR_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ID_SENSOR := :NEW.ID_SENSOR; 
      rec.sns_TIPO_SENSOR := :NEW.sns_TIPO_SENSOR; 
      rec.sns_DATA_CALIBRACAO := :NEW.sns_DATA_CALIBRACAO; 
      rec.sns_MODELO := :NEW.sns_MODELO; 
      rec.sns_AREA := :NEW.sns_AREA; 
      rec.ID_ZONA := :NEW.ID_ZONA; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ID_SENSOR := :OLD.ID_SENSOR; 
      rec.sns_TIPO_SENSOR := :OLD.sns_TIPO_SENSOR; 
      rec.sns_DATA_CALIBRACAO := :OLD.sns_DATA_CALIBRACAO; 
      rec.sns_MODELO := :OLD.sns_MODELO; 
      rec.sns_AREA := :OLD.sns_AREA; 
      rec.ID_ZONA := :OLD.ID_ZONA; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into tbl_SENSOR_JN VALUES rec; 
  END; 
  /CREATE TABLE tbl_solo (
    id_solo             INTEGER NOT NULL,
    slo_tipo_solo       VARCHAR2(25 CHAR) NOT NULL,
    slo_ph_desejado     NUMBER(6, 2),
    slo_umidade_ideal   NUMBER(6, 2),
    slo_caracteristicas VARCHAR2(140 CHAR),
    id_zona             INTEGER NOT NULL
);

ALTER TABLE tbl_solo ADD CONSTRAINT tbl_solo_pk PRIMARY KEY ( id_solo );


CREATE TABLE tbl_SOLO_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ID_SOLO INTEGER NOT NULL
 ,slo_TIPO_SOLO VARCHAR2 (25 CHAR) NOT NULL
 ,slo_PH_DESEJADO NUMBER (6,2)
 ,slo_UMIDADE_IDEAL NUMBER (6,2)
 ,slo_CARACTERISTICAS VARCHAR2 (140 CHAR)
 ,ID_ZONA INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER tbl_SOLO_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON tbl_SOLO for each row 
 Declare 
  rec tbl_SOLO_JN%ROWTYPE; 
  blank tbl_SOLO_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ID_SOLO := :NEW.ID_SOLO; 
      rec.slo_TIPO_SOLO := :NEW.slo_TIPO_SOLO; 
      rec.slo_PH_DESEJADO := :NEW.slo_PH_DESEJADO; 
      rec.slo_UMIDADE_IDEAL := :NEW.slo_UMIDADE_IDEAL; 
      rec.slo_CARACTERISTICAS := :NEW.slo_CARACTERISTICAS; 
      rec.ID_ZONA := :NEW.ID_ZONA; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ID_SOLO := :OLD.ID_SOLO; 
      rec.slo_TIPO_SOLO := :OLD.slo_TIPO_SOLO; 
      rec.slo_PH_DESEJADO := :OLD.slo_PH_DESEJADO; 
      rec.slo_UMIDADE_IDEAL := :OLD.slo_UMIDADE_IDEAL; 
      rec.slo_CARACTERISTICAS := :OLD.slo_CARACTERISTICAS; 
      rec.ID_ZONA := :OLD.ID_ZONA; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into tbl_SOLO_JN VALUES rec; 
  END; 
  /CREATE TABLE tbl_tratamento (
    id_tratamento   INTEGER NOT NULL,
    trt_data        TIMESTAMP NOT NULL,
    trt_produto     VARCHAR2(50 CHAR) NOT NULL,
    trt_dosagem     NUMBER(10, 2) NOT NULL,
    id_zona         INTEGER NOT NULL,
    id_praga_doenca INTEGER NOT NULL
);

ALTER TABLE tbl_tratamento ADD CONSTRAINT tbl_tratamento_pk PRIMARY KEY ( id_tratamento );


CREATE TABLE tbl_TRATAMENTO_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ID_TRATAMENTO INTEGER NOT NULL
 ,trt_DATA TIMESTAMP NOT NULL
 ,trt_PRODUTO VARCHAR2 (50 CHAR) NOT NULL
 ,trt_DOSAGEM NUMBER (10,2) NOT NULL
 ,ID_ZONA INTEGER NOT NULL
 ,ID_PRAGA_DOENCA INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER tbl_TRATAMENTO_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON tbl_TRATAMENTO for each row 
 Declare 
  rec tbl_TRATAMENTO_JN%ROWTYPE; 
  blank tbl_TRATAMENTO_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ID_TRATAMENTO := :NEW.ID_TRATAMENTO; 
      rec.trt_DATA := :NEW.trt_DATA; 
      rec.trt_PRODUTO := :NEW.trt_PRODUTO; 
      rec.trt_DOSAGEM := :NEW.trt_DOSAGEM; 
      rec.ID_ZONA := :NEW.ID_ZONA; 
      rec.ID_PRAGA_DOENCA := :NEW.ID_PRAGA_DOENCA; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ID_TRATAMENTO := :OLD.ID_TRATAMENTO; 
      rec.trt_DATA := :OLD.trt_DATA; 
      rec.trt_PRODUTO := :OLD.trt_PRODUTO; 
      rec.trt_DOSAGEM := :OLD.trt_DOSAGEM; 
      rec.ID_ZONA := :OLD.ID_ZONA; 
      rec.ID_PRAGA_DOENCA := :OLD.ID_PRAGA_DOENCA; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into tbl_TRATAMENTO_JN VALUES rec; 
  END; 
  /CREATE TABLE tbl_zona_plant (
    id_zona       INTEGER NOT NULL,
    zna_descricao VARCHAR2(100 BYTE) NOT NULL,
    zna_geometria mdsys.sdo_geometry NOT NULL,
    id_fazenda    INTEGER NOT NULL,
    id_cultura    INTEGER NOT NULL,
    id_solo       INTEGER NOT NULL
);

ALTER TABLE tbl_zona_plant ADD CONSTRAINT tbl_zona_plant_pk PRIMARY KEY ( id_zona );


CREATE TABLE tbl_ZONA_PLANT_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,ID_ZONA INTEGER NOT NULL
 ,zna_DESCRICAO VARCHAR2 (100 BYTE) NOT NULL
 ,zna_GEOMETRIA SDO_GEOMETRY NOT NULL
 ,ID_FAZENDA INTEGER NOT NULL
 ,ID_CULTURA INTEGER NOT NULL
 ,ID_SOLO INTEGER NOT NULL
 );

CREATE OR REPLACE TRIGGER tbl_ZONA_PLANT_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON tbl_ZONA_PLANT for each row 
 Declare 
  rec tbl_ZONA_PLANT_JN%ROWTYPE; 
  blank tbl_ZONA_PLANT_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.ID_ZONA := :NEW.ID_ZONA; 
      rec.zna_DESCRICAO := :NEW.zna_DESCRICAO; 
      rec.zna_GEOMETRIA := :NEW.zna_GEOMETRIA; 
      rec.ID_FAZENDA := :NEW.ID_FAZENDA; 
      rec.ID_CULTURA := :NEW.ID_CULTURA; 
      rec.ID_SOLO := :NEW.ID_SOLO; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.ID_ZONA := :OLD.ID_ZONA; 
      rec.zna_DESCRICAO := :OLD.zna_DESCRICAO; 
      rec.zna_GEOMETRIA := :OLD.zna_GEOMETRIA; 
      rec.ID_FAZENDA := :OLD.ID_FAZENDA; 
      rec.ID_CULTURA := :OLD.ID_CULTURA; 
      rec.ID_SOLO := :OLD.ID_SOLO; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into tbl_ZONA_PLANT_JN VALUES rec; 
  END; 
  /ALTER TABLE tbl_ajuste
    ADD CONSTRAINT tbl_ajuste_tbl_zona_plant_fk FOREIGN KEY ( id_zona )
        REFERENCES tbl_zona_plant ( id_zona )
            ON DELETE CASCADE;

ALTER TABLE tbl_cultura
    ADD CONSTRAINT tbl_cultura_tbl_solo_fk FOREIGN KEY ( id_solo )
        REFERENCES tbl_solo ( id_solo );

ALTER TABLE tbl_irrigacao
    ADD CONSTRAINT tbl_irrigacao_tbl_zona_plant_fk FOREIGN KEY ( id_zona )
        REFERENCES tbl_zona_plant ( id_zona )
            ON DELETE CASCADE;

ALTER TABLE tbl_leitura
    ADD CONSTRAINT tbl_leitura_tbl_sensor_fk FOREIGN KEY ( id_sensor )
        REFERENCES tbl_sensor ( id_sensor )
            ON DELETE CASCADE;

ALTER TABLE tbl_sensor
    ADD CONSTRAINT tbl_sensor_tbl_zona_plant_fk FOREIGN KEY ( id_zona )
        REFERENCES tbl_zona_plant ( id_zona )
            ON DELETE CASCADE;

ALTER TABLE tbl_tratamento
    ADD CONSTRAINT tbl_tratamento_tbl_praga_doenca_fk FOREIGN KEY ( id_praga_doenca )
        REFERENCES tbl_praga_doenca ( id_praga_doenca )
            ON DELETE CASCADE;

ALTER TABLE tbl_tratamento
    ADD CONSTRAINT tbl_tratamento_tbl_zona_plant_fk FOREIGN KEY ( id_zona )
        REFERENCES tbl_zona_plant ( id_zona )
            ON DELETE CASCADE;

ALTER TABLE tbl_zona_plant
    ADD CONSTRAINT tbl_zona_plant_tbl_cultura_fk FOREIGN KEY ( id_cultura )
        REFERENCES tbl_cultura ( id_cultura )
            ON DELETE CASCADE;

ALTER TABLE tbl_zona_plant
    ADD CONSTRAINT tbl_zona_plant_tbl_fazenda_fk FOREIGN KEY ( id_fazenda )
        REFERENCES tbl_fazenda ( id_fazenda )
            ON DELETE CASCADE;

ALTER TABLE tbl_zona_plant
    ADD CONSTRAINT tbl_zona_plant_tbl_solo_fk FOREIGN KEY ( id_solo )
        REFERENCES tbl_solo ( id_solo );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             20
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
