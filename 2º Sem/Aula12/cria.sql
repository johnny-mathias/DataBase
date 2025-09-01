-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-08-19 17:25:30 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE T_RHSTU_BAIRRO 
    ( 
     ID_BAIRRO      NUMBER (8)  NOT NULL , 
     ID_CIDADE      NUMBER (8)  NOT NULL , 
     NM_BAIRRO      VARCHAR2 (45)  NOT NULL , 
     NM_ZONA_BAIRRO VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE T_RHSTU_BAIRRO 
    ADD CONSTRAINT UK_T_PKD_BAIRRO_ZONA 
    CHECK (NM_ZONA_BAIRRO IN ('CENTRO', 'ZONA LESTE', 'ZONA NORTE', 'ZONA OESTE', 'ZONA SUL')) 
;

COMMENT ON COLUMN T_RHSTU_BAIRRO.ID_BAIRRO IS 'Esta coluna irá receber o codigo interno para garantir o cadastro dos  Bairros da Cidade do Estado do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.' 
;

COMMENT ON COLUMN T_RHSTU_BAIRRO.NM_BAIRRO IS 'Esta coluna irá receber o nome do Bairro  pertencente Cidade do Estado Brasileiro. O padrão de armazenmento é  InitCap e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.' 
;

COMMENT ON COLUMN T_RHSTU_BAIRRO.NM_ZONA_BAIRRO IS 'Esta coluna irá receber a localização da zona onde se encontra o bairro. Alguns exemplos: Zona Norte, Zona Sul, Zona Leste, Zona Oeste, Centro.' 
;

ALTER TABLE T_RHSTU_BAIRRO 
    ADD CONSTRAINT PK__RHSTU_BAIRRO PRIMARY KEY ( ID_BAIRRO ) ;

CREATE TABLE T_RHSTU_CIDADE 
    ( 
     ID_CIDADE NUMBER (8)  NOT NULL , 
     ID_ESTADO NUMBER (2)  NOT NULL , 
     NM_CIDADE VARCHAR2 (60)  NOT NULL , 
     CD_IBGE   NUMBER (8)  NOT NULL , 
     NR_DDD    NUMBER (3)  NOT NULL 
    ) 
;

COMMENT ON COLUMN T_RHSTU_CIDADE.ID_CIDADE IS 'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório e será preenchido automaticamente pelo sistema.

' 
;

COMMENT ON COLUMN T_RHSTU_CIDADE.ID_ESTADO IS 'Esta coluna irá receber o codigo interno para garantir unicidade dos Estados do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.' 
;

COMMENT ON COLUMN T_RHSTU_CIDADE.NM_CIDADE IS 'Esta coluna irá receber o nome do Cidade pertencente ao Estado Brasileiro. O padrão de armazenmento é  InitCap e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.' 
;

COMMENT ON COLUMN T_RHSTU_CIDADE.CD_IBGE IS 'Esta coluna irá receber o código do IBGE que fornece informações para geração da NFe.' 
;

ALTER TABLE T_RHSTU_CIDADE 
    ADD CONSTRAINT PK_RHSTU_CIDADE PRIMARY KEY ( ID_CIDADE ) ;

CREATE TABLE T_RHSTU_CONSULTA 
    ( 
     ID_UNID_HOSPITAL NUMBER (9)  NOT NULL , 
     NR_CONSULTA      NUMBER  NOT NULL , 
     ID_PACIENTE      NUMBER (9)  NOT NULL , 
     CD_MEDICO        NUMBER  NOT NULL , 
     DT_HR_CONSULTA   DATE  NOT NULL , 
     NR_CONSULTORIO   NUMBER (5)  NOT NULL 
    ) 
;

ALTER TABLE T_RHSTU_CONSULTA 
    ADD CONSTRAINT PK_RHSTU_CONSULTA PRIMARY KEY ( NR_CONSULTA, ID_UNID_HOSPITAL ) ;

CREATE TABLE T_RHSTU_CONSULTA_FORMA_PAGTO 
    ( 
     ID_CONSULTA_FORMA_PAGTO NUMBER  NOT NULL , 
     ID_UNID_HOSPITAL        NUMBER (9)  NOT NULL , 
     NR_CONSULTA             NUMBER  NOT NULL , 
     ID_PACIENTE_PS          NUMBER (10)  NOT NULL , 
     ID_FORMA_PAGTO          NUMBER  NOT NULL , 
     DT_CADASTRO             DATE  NOT NULL , 
     DT_PAGTO_CONSULTA       DATE , 
     ST_PAGTO_CONSULTA       CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE T_RHSTU_CONSULTA_FORMA_PAGTO 
    ADD CONSTRAINT UK_RHSTU_STATUS_PAGTO_PACI 
    CHECK (ST_PAGTO_CONSULTA IN ('A', 'C', 'P')) 
;

ALTER TABLE T_RHSTU_CONSULTA_FORMA_PAGTO 
    ADD CONSTRAINT PK_RHSTU_CONSULTA_FORMA_PAGTO PRIMARY KEY ( ID_CONSULTA_FORMA_PAGTO ) ;

CREATE TABLE T_RHSTU_CONTATO_PACIENTE 
    ( 
     ID_PACIENTE     NUMBER (9)  NOT NULL , 
     ID_CONTATO      NUMBER (9)  NOT NULL , 
     ID_TIPO_CONTATO NUMBER (5)  NOT NULL , 
     NM_CONTATO      VARCHAR2 (40)  NOT NULL , 
     NR_DDI          NUMBER (3) , 
     NR_DDD          NUMBER (3) , 
     NR_TELEFONE     NUMBER (10) 
    ) 
;

COMMENT ON COLUMN T_RHSTU_CONTATO_PACIENTE.ID_PACIENTE IS 'Esse atributo irá receber a chave primária do paciente. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_CONTATO_PACIENTE.ID_CONTATO IS 'Esse atributo irá receber a chave primária do contato do paciente. Esse número é sequencial e inicia sempre com 1 a partir do id do paciente e é gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_CONTATO_PACIENTE.ID_TIPO_CONTATO IS 'Esse atributo irá receber a chave primária do tipo do contato. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_CONTATO_PACIENTE.NM_CONTATO IS 'Este atributo irá receber o nome do contato do paciente. Seu conteudo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_CONTATO_PACIENTE.NR_DDI IS 'Este atributo irá receber o número do DDI do telefone do contato do paciente. Seu conteudo é opcional.' 
;

COMMENT ON COLUMN T_RHSTU_CONTATO_PACIENTE.NR_DDD IS 'Este atributo irá receber o número do DDD  do telefone do contato do paciente. Seu conteudo é opcional.' 
;

COMMENT ON COLUMN T_RHSTU_CONTATO_PACIENTE.NR_TELEFONE IS 'Este atributo irá receber o número do telefone do contato do paciente. Seu conteudo é opcional.' 
;

ALTER TABLE T_RHSTU_CONTATO_PACIENTE 
    ADD CONSTRAINT PK_RHSTU_CONTATO_EMERG_PAC PRIMARY KEY ( ID_CONTATO, ID_PACIENTE ) ;

CREATE TABLE T_RHSTU_EMAIL_PACIENTE 
    ( 
     ID_EMAIL    NUMBER (9)  NOT NULL , 
     ID_PACIENTE NUMBER (9)  NOT NULL , 
     DS_EMAIL    VARCHAR2 (100)  NOT NULL , 
     TP_EMAIL    VARCHAR2 (20)  NOT NULL , 
     ST_EMAIL    CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE T_RHSTU_EMAIL_PACIENTE 
    ADD CONSTRAINT UK_RHSTU_STATUS_EMAIL_PAC 
    CHECK (ST_EMAIL IN ('A', 'I')) 
;

COMMENT ON COLUMN T_RHSTU_EMAIL_PACIENTE.ID_EMAIL IS 'Esse atributo irá receber a chave primária do email do paciente. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_EMAIL_PACIENTE.ID_PACIENTE IS 'Esse atributo irá receber a chave primária do paciente. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_EMAIL_PACIENTE.DS_EMAIL IS 'Esse atributo irá receber o email do paciente.  Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_EMAIL_PACIENTE.TP_EMAIL IS 'Esse atributo irá receber o tipo email do paciente.  Seu conteúdo é obrigatório e deve possuir os seguintes valores: Pessoal ou Profissional.' 
;

COMMENT ON COLUMN T_RHSTU_EMAIL_PACIENTE.ST_EMAIL IS 'Esse atributo irá receber o status do email do paciente.  Seu conteúdo é obrigatório e deve possuir os seguintes valores: (A)tivo ou (I)nativo.' 
;

ALTER TABLE T_RHSTU_EMAIL_PACIENTE 
    ADD CONSTRAINT PK_RHSTU_EMAIL_PACIENTE PRIMARY KEY ( ID_EMAIL ) ;

CREATE TABLE T_RHSTU_ENDERECO_PACIENTE 
    ( 
     ID_ENDERECO           NUMBER (9)  NOT NULL , 
     ID_PACIENTE           NUMBER (9)  NOT NULL , 
     ID_LOGRADOURO         NUMBER (10)  NOT NULL , 
     NR_LOGRADOURO         NUMBER (7) , 
     DS_COMPLEMENTO_NUMERO VARCHAR2 (30) , 
     DS_PONTO_REFERENCIA   VARCHAR2 (50) , 
     DT_INICIO             DATE  NOT NULL , 
     DT_FIM                DATE 
    ) 
;

COMMENT ON COLUMN T_RHSTU_ENDERECO_PACIENTE.ID_ENDERECO IS 'Esse atributo irá receber a chave primária do endereco do paciente. Esse número é sequencia e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_ENDERECO_PACIENTE.ID_PACIENTE IS 'Esse atributo irá receber a chave primária do paciente. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_ENDERECO_PACIENTE.NR_LOGRADOURO IS 'Esse atributo irá receber o número do logradouro do endereco do paciente.  Seu conteúdo é opcional.' 
;

COMMENT ON COLUMN T_RHSTU_ENDERECO_PACIENTE.DS_COMPLEMENTO_NUMERO IS 'Esse atributo irá receber o complemeneto  do logradouro do endereco do paciente caso ele exista. Seu conteúdo é opcional.' 
;

COMMENT ON COLUMN T_RHSTU_ENDERECO_PACIENTE.DS_PONTO_REFERENCIA IS 'Esse atributo irá receber o ponto de referência  do logradouro do endereco do paciente.  Seu conteúdo é opcional.' 
;

COMMENT ON COLUMN T_RHSTU_ENDERECO_PACIENTE.DT_INICIO IS 'Esse atributo irá receber a data inicio do paciente associado ao endereço (logradouro). Seu conteúdo é obrigatorio.' 
;

COMMENT ON COLUMN T_RHSTU_ENDERECO_PACIENTE.DT_FIM IS 'Esse atributo irá receber a data fim do paciente associado ao endereço (logradouro), ou seja, ele não reside mais nesse endereço.  Seu conteúdo é opcional.' 
;

ALTER TABLE T_RHSTU_ENDERECO_PACIENTE 
    ADD CONSTRAINT PK_RHSTU_ENDERECO_PACIENTE PRIMARY KEY ( ID_ENDERECO ) ;

CREATE TABLE T_RHSTU_ESTADO 
    ( 
     ID_ESTADO NUMBER (2)  NOT NULL , 
     SG_ESTADO CHAR (2)  NOT NULL , 
     NM_ESTADO VARCHAR2 (30)  NOT NULL 
    ) 
;

COMMENT ON COLUMN T_RHSTU_ESTADO.ID_ESTADO IS 'Esta coluna irá receber o codigo interno para garantir unicidade dos Estados do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.' 
;

COMMENT ON COLUMN T_RHSTU_ESTADO.SG_ESTADO IS 'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_ESTADO.NM_ESTADO IS 'Esta coluna irá receber o nome do estado. O padrão de armazenmento é  InitCap e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.' 
;

ALTER TABLE T_RHSTU_ESTADO 
    ADD CONSTRAINT PK_RHSTU_ESTADO PRIMARY KEY ( ID_ESTADO ) ;

CREATE TABLE T_RHSTU_FORMA_PAGAMENTO 
    ( 
     ID_FORMA_PAGTO NUMBER  NOT NULL , 
     NM_FORMA_PAGTO VARCHAR2 (60)  NOT NULL , 
     DS_FORMA_PAGTO VARCHAR2 (500) , 
     ST_FORMA_PAGTO CHAR (1) DEFAULT 'A'  NOT NULL 
    ) 
;

ALTER TABLE T_RHSTU_FORMA_PAGAMENTO 
    ADD CONSTRAINT UK_RHSTU_STATUS_FORMA_PAGTO 
    CHECK (ST_FORMA_PAGTO IN ('A', 'I')) 
;

ALTER TABLE T_RHSTU_FORMA_PAGAMENTO 
    ADD CONSTRAINT PK_RHSTU_FORMA_PAGTO PRIMARY KEY ( ID_FORMA_PAGTO ) ;

CREATE TABLE T_RHSTU_LOGRADOURO 
    ( 
     ID_LOGRADOURO NUMBER (10)  NOT NULL , 
     ID_BAIRRO     NUMBER (8)  NOT NULL , 
     NM_LOGRADOURO VARCHAR2 (100)  NOT NULL , 
     NR_CEP        NUMBER (8)  NOT NULL 
    ) 
;

COMMENT ON COLUMN T_RHSTU_LOGRADOURO.ID_LOGRADOURO IS 'Esta coluna irá receber o codigo interno para garantir o lograouro, que esta localizado no  cadastro dos  Bairros da Cidade do Estado do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.' 
;

COMMENT ON COLUMN T_RHSTU_LOGRADOURO.ID_BAIRRO IS 'Esta coluna irá receber o codigo interno para garantir o cadastro dos  Bairros da Cidade do Estado do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.' 
;

COMMENT ON COLUMN T_RHSTU_LOGRADOURO.NM_LOGRADOURO IS 'Esta coluna irá receber o nome do lograoduro. O padrão de armazenmento é  InitCap e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.' 
;

COMMENT ON COLUMN T_RHSTU_LOGRADOURO.NR_CEP IS 'Esta coluna irá receber o número do CEP do lograoduro. O padrão de armazenmento é  numérico  e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.' 
;

ALTER TABLE T_RHSTU_LOGRADOURO 
    ADD CONSTRAINT PK_RHSTU_LOGRADOURO PRIMARY KEY ( ID_LOGRADOURO ) ;

CREATE TABLE T_RHSTU_MEDICAMENTO 
    ( 
     ID_MEDICAMENTO           NUMBER  NOT NULL , 
     NM_MEDICAMENTO           VARCHAR2 (50)  NOT NULL , 
     DS_DETALHADA_MEDICAMENTO VARCHAR2 (4000) , 
     NR_CODIGO_BARRAS         NUMBER  NOT NULL 
    ) 
;

ALTER TABLE T_RHSTU_MEDICAMENTO 
    ADD CONSTRAINT PK_RHSTU_MEDICAMENTO PRIMARY KEY ( ID_MEDICAMENTO ) ;

CREATE TABLE T_RHSTU_MEDICO 
    ( 
     CD_MEDICO        NUMBER  NOT NULL , 
     NM_MEDICO        VARCHAR2 (90)  NOT NULL , 
     NR_CRM           NUMBER (10)  NOT NULL , 
     DS_ESPECIALIDADE VARCHAR2 (50)  NOT NULL 
    ) 
;

ALTER TABLE T_RHSTU_MEDICO 
    ADD CONSTRAINT PK_RHSTU_MEDICO PRIMARY KEY ( CD_MEDICO ) ;

CREATE TABLE T_RHSTU_PACIENTE 
    ( 
     ID_PACIENTE        NUMBER (9)  NOT NULL , 
     NM_PACIENTE        VARCHAR2 (80)  NOT NULL , 
     NR_CPF             NUMBER (12)  NOT NULL , 
     NM_RG              VARCHAR2 (15) , 
     DT_NASCIMENTO      DATE  NOT NULL , 
     FL_SEXO_BIOLOGICO  CHAR (1)  NOT NULL , 
     DS_ESCOLARIDADE    VARCHAR2 (40)  NOT NULL , 
     DS_ESTADO_CIVIL    VARCHAR2 (25)  NOT NULL , 
     NM_GRUPO_SANGUINEO VARCHAR2 (6)  NOT NULL , 
     NR_ALTURA          NUMBER (3,2) DEFAULT 0.1  NOT NULL , 
     NR_PESO            NUMBER (4,1) DEFAULT 1  NOT NULL 
    ) 
;

ALTER TABLE T_RHSTU_PACIENTE 
    ADD CONSTRAINT CK_RHSTU_PACIENTE_SEXO 
    CHECK (FL_SEXO_BIOLOGICO IN ('F', 'I', 'M')) 
;

ALTER TABLE T_RHSTU_PACIENTE 
    ADD CONSTRAINT CK_RHSTU_PACIENTE_ALTURA 
    CHECK (NR_ALTURA BETWEEN 0.1 AND 2.99) 
;

ALTER TABLE T_RHSTU_PACIENTE 
    ADD CONSTRAINT UK_RHSTU_PACIENTE_PESO 
    CHECK (NR_PESO BETWEEN 1 AND 800) 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE.ID_PACIENTE IS 'Esse atributo irá receber a chave primária do paciente. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE.NM_PACIENTE IS 'Esse atributo irá receber o nome completo do  paciente.  Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE.NR_CPF IS 'Esse atributo irá receber o número do  CPF paciente.  Seu conteúdo é obrigatório e será validado de acordo com regras de negócio.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE.NM_RG IS 'Esse atributo irá receber o número do  RG  paciente.  Seu conteúdo é obrigatório e será validado de acordo com regras de negócio.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE.DT_NASCIMENTO IS 'Esse atributo irá receber a data de nascimento do  paciente.  Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE.FL_SEXO_BIOLOGICO IS 'Esse atributo irá receber a flag do sexo biológico de nascimento do Paciente. Os valores possíveis são (F)emea  ou (M)acho ou (I)ntersexual. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE.DS_ESCOLARIDADE IS 'Esse atributo irá receber a Escolaridade do  paciente.  Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE.DS_ESTADO_CIVIL IS 'Esse atributo irá receber o Estado Civil  do  paciente.  Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE.NM_GRUPO_SANGUINEO IS 'Esse atributo irá receber o grupo sanguineo do  paciente.  Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE.NR_ALTURA IS 'Esse atributo irá receber a altura do  paciente.  Seu conteúdo é obrigatório e o limite de altura deve ficar entre 0.1 e 2.99.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE.NR_PESO IS 'Esse atributo irá receber o peso  do  paciente.  Seu conteúdo é obrigatório. A faixa de valores permitidos está entre 1 e 800kg.' 
;

ALTER TABLE T_RHSTU_PACIENTE 
    ADD CONSTRAINT PK_RHSTU_PACIENTE PRIMARY KEY ( ID_PACIENTE ) ;

ALTER TABLE T_RHSTU_PACIENTE 
    ADD CONSTRAINT UK_RHSTU_CPF_PACIENTE UNIQUE ( NR_CPF ) ;

ALTER TABLE T_RHSTU_PACIENTE 
    ADD CONSTRAINT UK_RHSTU_CPF_PACIENTEv1 UNIQUE ( NM_RG ) ;

CREATE TABLE T_RHSTU_PACIENTE_PLANO_SAUDE 
    ( 
     ID_PACIENTE_PS NUMBER (10)  NOT NULL , 
     ID_PACIENTE    NUMBER (9)  NOT NULL , 
     ID_PLANO_SAUDE NUMBER (5)  NOT NULL , 
     NR_CARTEIRA_PS NUMBER (15) , 
     DT_INICIO      DATE  NOT NULL , 
     DT_FIM         DATE 
    ) 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE_PLANO_SAUDE.ID_PACIENTE_PS IS 'Esse atributo irá receber a chave primária do plano de saúde do paciente. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE_PLANO_SAUDE.ID_PACIENTE IS 'Esse atributo irá receber a chave primária do paciente. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE_PLANO_SAUDE.DT_INICIO IS 'Esse atributo irá receber a data de início para atendimento do plano de saúde do cliente aceito na RHSTU. Seu conteúdo é opcional.' 
;

COMMENT ON COLUMN T_RHSTU_PACIENTE_PLANO_SAUDE.DT_FIM IS 'Esse atributo irá receber a data de encerramento do plano de saúde aceito na RHSTU. Seu conteúdo é opcional.' 
;

ALTER TABLE T_RHSTU_PACIENTE_PLANO_SAUDE 
    ADD CONSTRAINT PK_RHSTU_PAC_PLANO_SAUDE PRIMARY KEY ( ID_PACIENTE_PS ) ;

CREATE TABLE T_RHSTU_PLANO_SAUDE 
    ( 
     ID_PLANO_SAUDE          NUMBER (5)  NOT NULL , 
     DS_RAZAO_SOCIAL         VARCHAR2 (70)  NOT NULL , 
     NM_FANTASIA_PLANO_SAUDE VARCHAR2 (80) , 
     DS_PLANO_SAUDE          VARCHAR2 (100)  NOT NULL , 
     NR_CNPJ                 NUMBER (14)  NOT NULL , 
     NM_CONTATO              VARCHAR2 (30) , 
     DS_TELEFONE             VARCHAR2 (30) , 
     DT_INICIO               DATE  NOT NULL , 
     DT_FIM                  DATE 
    ) 
;

COMMENT ON COLUMN T_RHSTU_PLANO_SAUDE.ID_PLANO_SAUDE IS 'Esse atributo irá receber a chave primária do plano de saúde. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PLANO_SAUDE.DS_RAZAO_SOCIAL IS 'Esse atributo irá receber Razão Social do plano de saúde aceito na RHSTU. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PLANO_SAUDE.NM_FANTASIA_PLANO_SAUDE IS 'Esse atributo irá receber o nome Fantasia do plano de saúde aceito na RHSTU. Seu conteúdo é opcional.' 
;

COMMENT ON COLUMN T_RHSTU_PLANO_SAUDE.DS_PLANO_SAUDE IS 'Esse atributo irá receber a descrição do  plano de saúde aceito na RHSTU. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PLANO_SAUDE.NR_CNPJ IS 'Esse atributo irá receber o numero do CNPJ do plano de saúde aceito na RHSTU. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PLANO_SAUDE.NM_CONTATO IS 'Esse atributo irá receber o nome  do contato dentro do plano de saúde aceito na RHSTU. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_PLANO_SAUDE.DS_TELEFONE IS 'Esse atributo irá receber os dados do telefone para contato no plano de saúde aceito na RHSTU. Seu conteúdo é opcional.' 
;

COMMENT ON COLUMN T_RHSTU_PLANO_SAUDE.DT_INICIO IS 'Esse atributo irá receber a data de início para atendimento do plano de saúde aceito na RHSTU. Seu conteúdo é opcional.' 
;

COMMENT ON COLUMN T_RHSTU_PLANO_SAUDE.DT_FIM IS 'Esse atributo irá receber a data de encerramento do plano de saúde aceito na RHSTU. Seu conteúdo é opcional.' 
;

ALTER TABLE T_RHSTU_PLANO_SAUDE 
    ADD CONSTRAINT PK_RHSTU_PLANO_SAUDE PRIMARY KEY ( ID_PLANO_SAUDE ) ;

CREATE TABLE T_RHSTU_PRESCICAO_MEDICA 
    ( 
     ID_PRESCRICAO_MEDICA NUMBER  NOT NULL , 
     ID_UNID_HOSPITAL     NUMBER (9)  NOT NULL , 
     NR_CONSULTA          NUMBER  NOT NULL , 
     ID_MEDICAMENTO       NUMBER  NOT NULL , 
     DS_POSOLOGIA         VARCHAR2 (150)  NOT NULL , 
     DS_VIA               VARCHAR2 (40)  NOT NULL , 
     DS_OBSERVACAO_USO    VARCHAR2 (100) , 
     QT_MEDICAMENTO       NUMBER (10,4) 
    ) 
;

ALTER TABLE T_RHSTU_PRESCICAO_MEDICA 
    ADD CONSTRAINT PK_RHSTU_PRESCICAO_MEDICA PRIMARY KEY ( ID_PRESCRICAO_MEDICA ) ;

CREATE TABLE T_RHSTU_TELEFONE_PACIENTE 
    ( 
     ID_PACIENTE NUMBER (9)  NOT NULL , 
     ID_TELEFONE NUMBER (9)  NOT NULL , 
     NR_DDI      NUMBER (3)  NOT NULL , 
     NR_DDD      NUMBER (3)  NOT NULL , 
     NR_TELEFONE NUMBER (10)  NOT NULL , 
     TP_TELEFONE VARCHAR2 (20)  NOT NULL , 
     ST_TELEFONE CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE T_RHSTU_TELEFONE_PACIENTE 
    ADD CONSTRAINT UK_RHSTU_STATUS_TELEF_PACIENTE 
    CHECK (ST_TELEFONE IN ('A', 'I')) 
;

COMMENT ON COLUMN T_RHSTU_TELEFONE_PACIENTE.ID_PACIENTE IS 'Esse atributo irá receber a chave primária do paciente. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_TELEFONE_PACIENTE.ID_TELEFONE IS 'Esse atributo irá receber a chave primária do telefone do paciente. Esse número é sequencial iniciando com 1 a partir do id do paciente e é  gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_TELEFONE_PACIENTE.NR_DDI IS 'Este atributo irá receber o número do DDI do telefone do  paciente. Seu conteudo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_TELEFONE_PACIENTE.NR_DDD IS 'Esse atributo irá receber o número do DDD do telefone paciente.  Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_TELEFONE_PACIENTE.NR_TELEFONE IS 'Esse atributo irá receber o número do telefone do  DDD do telefone paciente.  Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_TELEFONE_PACIENTE.TP_TELEFONE IS 'Esse atributo irá receber o tipo do  telefone  do telefone paciente.  Seu conteúdo é obrigatório e os valores possiveis são: Comercial, Residencial, Recado e Celular' 
;

COMMENT ON COLUMN T_RHSTU_TELEFONE_PACIENTE.ST_TELEFONE IS 'Esse atributo irá receber o status do telefone do paciente.  Seu conteúdo é obrigatório e deve possuir os seguintes valores: (A)tivo ou (I)nativo.' 
;

ALTER TABLE T_RHSTU_TELEFONE_PACIENTE 
    ADD CONSTRAINT PK_RHSTU_TELEFONE_PACIENTE PRIMARY KEY ( ID_TELEFONE, ID_PACIENTE ) ;

CREATE TABLE T_RHSTU_TIPO_CONTATO 
    ( 
     ID_TIPO_CONTATO NUMBER (5)  NOT NULL , 
     NM_TIPO_CONTATO VARCHAR2 (80)  NOT NULL , 
     DT_INICIO       DATE  NOT NULL , 
     DT_FIM          DATE 
    ) 
;

COMMENT ON COLUMN T_RHSTU_TIPO_CONTATO.ID_TIPO_CONTATO IS 'Esse atributo irá receber a chave primária do tipo do contato. Esse número é sequencial e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_TIPO_CONTATO.NM_TIPO_CONTATO IS 'Este atributo irá  receber o nome  do tipo de contato (Mãe, Pai, Prima(o), Irmã(o), Amiga(o), Colega de trabalho) entre outros. Seu conteudo é obrigatório.
' 
;

COMMENT ON COLUMN T_RHSTU_TIPO_CONTATO.DT_INICIO IS 'Este atributo irá  receber a data de início de validade do tipo do contato. Seu conteudo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_TIPO_CONTATO.DT_FIM IS 'Este atributo irá  receber a data de término  de validade do tipo do contato. Seu conteudo é obrigatório.' 
;

ALTER TABLE T_RHSTU_TIPO_CONTATO 
    ADD CONSTRAINT PK_RHSTU_TIPO_CONTATO PRIMARY KEY ( ID_TIPO_CONTATO ) ;

CREATE TABLE T_RHSTU_UNID_HOSPITALAR 
    ( 
     ID_UNID_HOSPITAL          NUMBER (9)  NOT NULL , 
     ID_LOGRADOURO             NUMBER (10)  NOT NULL , 
     NM_UNID_HOSPITALAR        VARCHAR2 (80)  NOT NULL , 
     NM_RAZAO_SOCIAL_UNID_HOSP VARCHAR2 (80)  NOT NULL , 
     DT_FUNDACAO               DATE , 
     NR_LOGRADOURO             NUMBER (7) , 
     DS_COMPLEMENTO_NUMERO     VARCHAR2 (30) , 
     DS_PONTO_REFERENCIA       VARCHAR2 (50) , 
     DT_INICIO                 DATE  NOT NULL , 
     DT_TERMINO                DATE 
    ) 
;

COMMENT ON COLUMN T_RHSTU_UNID_HOSPITALAR.ID_UNID_HOSPITAL IS 'Esse atributo irá receber a chave primária da Unidade Hospitalar. Esse número é sequencia e gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN T_RHSTU_UNID_HOSPITALAR.NR_LOGRADOURO IS 'Esse atributo irá receber o número do logradouro do endereco da Unidade Hospitalar.  Seu conteúdo é opcional.' 
;

COMMENT ON COLUMN T_RHSTU_UNID_HOSPITALAR.DS_COMPLEMENTO_NUMERO IS 'Esse atributo irá receber o complemeneto  do logradouro do endereco da Unidade Hospitalar caso ele exista. Seu conteúdo é opcional.' 
;

COMMENT ON COLUMN T_RHSTU_UNID_HOSPITALAR.DS_PONTO_REFERENCIA IS 'Esse atributo irá receber o ponto de referência  do logradouro do endereco da Unidade Hospitalar.' 
;

COMMENT ON COLUMN T_RHSTU_UNID_HOSPITALAR.DT_INICIO IS 'Esse atributo irá receber a data inicio do endereço da Unidade Hospitalar associado ao endereço (logradouro). Seu conteúdo é obrigatorio.' 
;

COMMENT ON COLUMN T_RHSTU_UNID_HOSPITALAR.DT_TERMINO IS 'Esse atributo irá receber a data término  do endereço da Unidade Hospitalar associado ao endereço (logradouro). Seu conteúdo é opcional.' 
;

ALTER TABLE T_RHSTU_UNID_HOSPITALAR 
    ADD CONSTRAINT PK_RHSTU_UNI_HOSP_END PRIMARY KEY ( ID_UNID_HOSPITAL ) ;

ALTER TABLE T_RHSTU_UNID_HOSPITALAR 
    ADD CONSTRAINT FK_LOGR_END_UNID_HOSPITALAR FOREIGN KEY 
    ( 
     ID_LOGRADOURO
    ) 
    REFERENCES T_RHSTU_LOGRADOURO 
    ( 
     ID_LOGRADOURO
    ) 
;

ALTER TABLE T_RHSTU_ENDERECO_PACIENTE 
    ADD CONSTRAINT FK_LOGRADOURO_END_PACIENTE FOREIGN KEY 
    ( 
     ID_LOGRADOURO
    ) 
    REFERENCES T_RHSTU_LOGRADOURO 
    ( 
     ID_LOGRADOURO
    ) 
;

ALTER TABLE T_RHSTU_CONTATO_PACIENTE 
    ADD CONSTRAINT FK_PACIENTE_CONTATO_EMERG FOREIGN KEY 
    ( 
     ID_PACIENTE
    ) 
    REFERENCES T_RHSTU_PACIENTE 
    ( 
     ID_PACIENTE
    ) 
;

ALTER TABLE T_RHSTU_ENDERECO_PACIENTE 
    ADD CONSTRAINT FK_PACIENTE_ENDERECO FOREIGN KEY 
    ( 
     ID_PACIENTE
    ) 
    REFERENCES T_RHSTU_PACIENTE 
    ( 
     ID_PACIENTE
    ) 
;

ALTER TABLE T_RHSTU_LOGRADOURO 
    ADD CONSTRAINT FK_PKD_BAIRRO_LOGRADOURO FOREIGN KEY 
    ( 
     ID_BAIRRO
    ) 
    REFERENCES T_RHSTU_BAIRRO 
    ( 
     ID_BAIRRO
    ) 
;

ALTER TABLE T_RHSTU_BAIRRO 
    ADD CONSTRAINT FK_PKD_CIDADE_BAIRRO FOREIGN KEY 
    ( 
     ID_CIDADE
    ) 
    REFERENCES T_RHSTU_CIDADE 
    ( 
     ID_CIDADE
    ) 
;

ALTER TABLE T_RHSTU_CIDADE 
    ADD CONSTRAINT FK_PKD_ESTADO_CIDADE FOREIGN KEY 
    ( 
     ID_ESTADO
    ) 
    REFERENCES T_RHSTU_ESTADO 
    ( 
     ID_ESTADO
    ) 
;

ALTER TABLE T_RHSTU_PACIENTE_PLANO_SAUDE 
    ADD CONSTRAINT FK_RHSTU_PAC_PLANO_SAUDE FOREIGN KEY 
    ( 
     ID_PACIENTE
    ) 
    REFERENCES T_RHSTU_PACIENTE 
    ( 
     ID_PACIENTE
    ) 
;

ALTER TABLE T_RHSTU_EMAIL_PACIENTE 
    ADD CONSTRAINT FK_RHSTU_PACIENTE_EMAIL FOREIGN KEY 
    ( 
     ID_PACIENTE
    ) 
    REFERENCES T_RHSTU_PACIENTE 
    ( 
     ID_PACIENTE
    ) 
;

ALTER TABLE T_RHSTU_TELEFONE_PACIENTE 
    ADD CONSTRAINT FK_RHSTU_PACIENTE_TELEF FOREIGN KEY 
    ( 
     ID_PACIENTE
    ) 
    REFERENCES T_RHSTU_PACIENTE 
    ( 
     ID_PACIENTE
    ) 
;

ALTER TABLE T_RHSTU_PACIENTE_PLANO_SAUDE 
    ADD CONSTRAINT FK_RHSTU_PLANO_SAUDE_PAC FOREIGN KEY 
    ( 
     ID_PLANO_SAUDE
    ) 
    REFERENCES T_RHSTU_PLANO_SAUDE 
    ( 
     ID_PLANO_SAUDE
    ) 
;

ALTER TABLE T_RHSTU_CONTATO_PACIENTE 
    ADD CONSTRAINT FK_RHSTU_TIPO_CONTATO FOREIGN KEY 
    ( 
     ID_TIPO_CONTATO
    ) 
    REFERENCES T_RHSTU_TIPO_CONTATO 
    ( 
     ID_TIPO_CONTATO
    ) 
;

ALTER TABLE T_RHSTU_CONSULTA 
    ADD CONSTRAINT FK_RHSTU_UNID_HOSP_CONSULTA FOREIGN KEY 
    ( 
     ID_UNID_HOSPITAL
    ) 
    REFERENCES T_RHSTU_UNID_HOSPITALAR 
    ( 
     ID_UNID_HOSPITAL
    ) 
;

ALTER TABLE T_RHSTU_CONSULTA_FORMA_PAGTO 
    ADD CONSTRAINT FK_STU_CONSULTA_FORMA_PAGTO FOREIGN KEY 
    ( 
     NR_CONSULTA,
     ID_UNID_HOSPITAL
    ) 
    REFERENCES T_RHSTU_CONSULTA 
    ( 
     NR_CONSULTA,
     ID_UNID_HOSPITAL
    ) 
;

ALTER TABLE T_RHSTU_PRESCICAO_MEDICA 
    ADD CONSTRAINT FK_STU_CONSULTA_PRESC_MEDICA FOREIGN KEY 
    ( 
     NR_CONSULTA,
     ID_UNID_HOSPITAL
    ) 
    REFERENCES T_RHSTU_CONSULTA 
    ( 
     NR_CONSULTA,
     ID_UNID_HOSPITAL
    ) 
;

ALTER TABLE T_RHSTU_CONSULTA_FORMA_PAGTO 
    ADD CONSTRAINT FK_STU_FORMA_PAGTO_CONSULTA FOREIGN KEY 
    ( 
     ID_FORMA_PAGTO
    ) 
    REFERENCES T_RHSTU_FORMA_PAGAMENTO 
    ( 
     ID_FORMA_PAGTO
    ) 
;

ALTER TABLE T_RHSTU_CONSULTA 
    ADD CONSTRAINT FK_STU_MED_CONSULTA FOREIGN KEY 
    ( 
     CD_MEDICO
    ) 
    REFERENCES T_RHSTU_MEDICO 
    ( 
     CD_MEDICO
    ) 
;

ALTER TABLE T_RHSTU_PRESCICAO_MEDICA 
    ADD CONSTRAINT FK_STU_MEDICAMENTO_PM FOREIGN KEY 
    ( 
     ID_MEDICAMENTO
    ) 
    REFERENCES T_RHSTU_MEDICAMENTO 
    ( 
     ID_MEDICAMENTO
    ) 
;

ALTER TABLE T_RHSTU_CONSULTA 
    ADD CONSTRAINT FK_STU_PAC_CONSULTA FOREIGN KEY 
    ( 
     ID_PACIENTE
    ) 
    REFERENCES T_RHSTU_PACIENTE 
    ( 
     ID_PACIENTE
    ) 
;

ALTER TABLE T_RHSTU_CONSULTA_FORMA_PAGTO 
    ADD CONSTRAINT FK_STU_PAC_PS_CNST_FP FOREIGN KEY 
    ( 
     ID_PACIENTE_PS
    ) 
    REFERENCES T_RHSTU_PACIENTE_PLANO_SAUDE 
    ( 
     ID_PACIENTE_PS
    ) 
;

CREATE SEQUENCE SQ_RHSTU_BAIRRO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_RHSTU_BAIRRO 
BEFORE INSERT ON T_RHSTU_BAIRRO 
FOR EACH ROW 
WHEN (NEW.ID_BAIRRO IS NULL) 
BEGIN 
    :NEW.ID_BAIRRO := SQ_RHSTU_BAIRRO.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_RHSTU_CIDADE 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_RHSTU_CIDADE 
BEFORE INSERT ON T_RHSTU_CIDADE 
FOR EACH ROW 
WHEN (NEW.ID_CIDADE IS NULL) 
BEGIN 
    :NEW.ID_CIDADE := SQ_RHSTU_CIDADE.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_CONSULTA_FORMA_PAGTO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_CONSULTA_FORMA_PAGTO 
BEFORE INSERT ON T_RHSTU_CONSULTA_FORMA_PAGTO 
FOR EACH ROW 
WHEN (NEW.ID_CONSULTA_FORMA_PAGTO IS NULL) 
BEGIN 
    :NEW.ID_CONSULTA_FORMA_PAGTO := SQ_CONSULTA_FORMA_PAGTO.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_END_PACIENTE 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_END_PACIENTE 
BEFORE INSERT ON T_RHSTU_ENDERECO_PACIENTE 
FOR EACH ROW 
WHEN (NEW.ID_ENDERECO IS NULL) 
BEGIN 
    :NEW.ID_ENDERECO := SQ_END_PACIENTE.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_RHSTU_ESTADO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_RHSTU_ESTADO 
BEFORE INSERT ON T_RHSTU_ESTADO 
FOR EACH ROW 
WHEN (NEW.ID_ESTADO IS NULL) 
BEGIN 
    :NEW.ID_ESTADO := SQ_RHSTU_ESTADO.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_RHSTU_LOGRADOURO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_RHSTU_LOGRADOURO 
BEFORE INSERT ON T_RHSTU_LOGRADOURO 
FOR EACH ROW 
WHEN (NEW.ID_LOGRADOURO IS NULL) 
BEGIN 
    :NEW.ID_LOGRADOURO := SQ_RHSTU_LOGRADOURO.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_MEDICAMENTO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_MEDICAMENTO 
BEFORE INSERT ON T_RHSTU_MEDICAMENTO 
FOR EACH ROW 
WHEN (NEW.ID_MEDICAMENTO IS NULL) 
BEGIN 
    :NEW.ID_MEDICAMENTO := SQ_MEDICAMENTO.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_RHSTU_MEDICO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_RHSTU_MEDICO 
BEFORE INSERT ON T_RHSTU_MEDICO 
FOR EACH ROW 
WHEN (NEW.CD_MEDICO IS NULL) 
BEGIN 
    :NEW.CD_MEDICO := SQ_RHSTU_MEDICO.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_RHSTU_PACIENTE 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_RHSTU_PACIENTE 
BEFORE INSERT ON T_RHSTU_PACIENTE 
FOR EACH ROW 
WHEN (NEW.ID_PACIENTE IS NULL) 
BEGIN 
    :NEW.ID_PACIENTE := SQ_RHSTU_PACIENTE.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_PACIENTE_PLANO_SAUDE 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_PACIENTE_PLANO_SAUDE 
BEFORE INSERT ON T_RHSTU_PACIENTE_PLANO_SAUDE 
FOR EACH ROW 
WHEN (NEW.ID_PACIENTE_PS IS NULL) 
BEGIN 
    :NEW.ID_PACIENTE_PS := SQ_PACIENTE_PLANO_SAUDE.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_PRESCRICAO_MEDICA 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_PRESCRICAO_MEDICA 
BEFORE INSERT ON T_RHSTU_PRESCICAO_MEDICA 
FOR EACH ROW 
WHEN (NEW.ID_PRESCRICAO_MEDICA IS NULL) 
BEGIN 
    :NEW.ID_PRESCRICAO_MEDICA := SQ_PRESCRICAO_MEDICA.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_TIPO_CONTATO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_TIPO_CONTATO 
BEFORE INSERT ON T_RHSTU_TIPO_CONTATO 
FOR EACH ROW 
WHEN (NEW.ID_TIPO_CONTATO IS NULL) 
BEGIN 
    :NEW.ID_TIPO_CONTATO := SQ_TIPO_CONTATO.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_UNID_HOSPITALAR 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TG_UNID_HOSPITALAR 
BEFORE INSERT ON T_RHSTU_UNID_HOSPITALAR 
FOR EACH ROW 
WHEN (NEW.ID_UNID_HOSPITAL IS NULL) 
BEGIN 
    :NEW.ID_UNID_HOSPITAL := SQ_UNID_HOSPITALAR.NEXTVAL; 
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            19
-- CREATE INDEX                             0
-- ALTER TABLE                             49
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          13
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
-- CREATE SEQUENCE                         13
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
