-- 1
CREATE TABLE t_rhstu_medico_contato (
    cd_medico   NUMBER       NOT NULL,
    id_contato  NUMBER(3)    NOT NULL,
    tp_contato  VARCHAR2(30) NOT NULL,
    ds_contato  VARCHAR2(40) NOT NULL,
    st_contato  CHAR(1)      NOT NULL,

-- 2
    CONSTRAINT pk_medico_contato PRIMARY KEY (cd_medico, id_contato),
    CONSTRAINT fk_medico_contato FOREIGN KEY (cd_medico)
        REFERENCES t_rhstu_medico (cd_medico),
    CONSTRAINT ck_tp_contato CHECK (tp_contato IN (
        'Telefone Fixo',
        'Telefone Celular',
        'email',
        'Telefone Contato'
    )),
-- 3
    CONSTRAINT ck_st_contato CHECK (st_contato IN ('A', 'I'))
);

--5
ALTER TABLE t_rhstu_medico_contato
MODIFY tp_contato VARCHAR2(50);


-- 6
ALTER TABLE t_rhstu_medico_contato
	ADD dt_cadastro DATE;


-- 7
ALTER TABLE t_rhstu_medico_contato
	MODIFY dt_cadastro DATE NOT NULL;


-- 8
ALTER TABLE t_rhstu_medico_contato
	DROP COLUMN dt_cadastro;


-- 9
INSERT INTO t_rhstu_medico (cd_medico, nm_medico, nr_crm, ds_especialidade)
	VALUES (1, 'Dr. João Silva', 123456, 'Cardiologia');

INSERT INTO t_rhstu_medico_contato (cd_medico, id_contato, tp_contato, ds_contato, st_contato)
	VALUES (1, 1, 'Telefone Celular', '(11)99999-8888', 'A');


-- 10
SELECT m.cd_medico,
       m.nm_medico,
       m.nr_crm,
       m.ds_especialidade,
       c.id_contato,
       c.tp_contato,
       c.ds_contato,
       c.st_contato
FROM t_rhstu_medico m
JOIN t_rhstu_medico_contato c
  ON m.cd_medico = c.cd_medico;

COMMIT;
