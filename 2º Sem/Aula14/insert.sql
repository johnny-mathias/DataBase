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
