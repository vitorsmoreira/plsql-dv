-- Incluir e excluir sequência.

DROP SEQUENCE SQ_DV_LOG_ERRO;

CREATE SEQUENCE SQ_DV_LOG_ERRO START WITH 1;

DROP TABLE T_DV_LOG_ERRO CASCADE CONSTRAINTS;

-- Criando tabela de log de erros.

CREATE TABLE T_DV_LOG_ERRO(
    ID_LOG_ERRO NUMBER(9) DEFAULT SQ_DV_LOG_ERRO.NEXTVAL,
    NM_USUARIO VARCHAR2(255) DEFAULT USER,
    DT_INCLUSAO DATE DEFAULT SYSDATE,
    CD_ERRO NUMBER,
    DS_MENSAGEM_ERRO VARCHAR2(255)
);

-- Inserindo restrições.

ALTER TABLE T_DV_LOG_ERRO ADD CONSTRAINT PK_DV_LOG_ERRO PRIMARY KEY (ID_LOG_ERRO);

ALTER TABLE T_DV_LOG_ERRO MODIFY (NM_USUARIO CONSTRAINT CK_NM_USUARIO_NN NOT NULL);

ALTER TABLE T_DV_LOG_ERRO MODIFY (DT_INCLUSAO CONSTRAINT CK_DT_INCLUSAO_NN NOT NULL);

ALTER TABLE T_DV_LOG_ERRO MODIFY (CD_ERRO CONSTRAINT CK_CD_ERRO_NN NOT NULL);

ALTER TABLE T_DV_LOG_ERRO MODIFY (DS_MENSAGEM_ERRO CONSTRAINT CK_DS_MENSAGEM_ERRO_NN NOT NULL);

-- Criando procedures.

SET SERVEROUTPUT ON;

-- Região

CREATE OR REPLACE PROCEDURE INCLUIR_REGIAO(
    P_REGIAO T_DV_REGIAO.NM_REGIAO%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_REGIAO(
        NM_REGIAO
    ) VALUES(
        P_REGIAO
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Estado

CREATE OR REPLACE PROCEDURE INCLUIR_ESTADO(
    P_REGIAO T_DV_ESTADO.CD_REGIAO%TYPE,
    P_SIGLA T_DV_ESTADO.SG_ESTADO%TYPE,
    P_ESTADO T_DV_ESTADO.NM_ESTADO%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_ESTADO(
        CD_REGIAO,
        SG_ESTADO,
        NM_ESTADO
    ) VALUES(
        P_REGIAO,
        P_SIGLA,
        P_ESTADO
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Cidade

CREATE OR REPLACE PROCEDURE INCLUIR_CIDADE(
    P_ESTADO T_DV_CIDADE.CD_ESTADO%TYPE,
    P_CIDADE T_DV_CIDADE.NM_CIDADE%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_CIDADE(
        CD_ESTADO,
        NM_CIDADE
    ) VALUES(
        P_ESTADO,
        P_CIDADE
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Bairro

CREATE OR REPLACE PROCEDURE INCLUIR_BAIRRO(
    P_CIDADE T_DV_BAIRRO.ID_CIDADE%TYPE,
    P_BAIRRO T_DV_BAIRRO.NM_BAIRRO%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_BAIRRO(
        ID_CIDADE,
        NM_BAIRRO
    ) VALUES(
        P_CIDADE,
        P_BAIRRO
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Logradouro

CREATE OR REPLACE PROCEDURE INCLUIR_LOGRADOURO(
    P_BAIRRO T_DV_LOGRADOURO.ID_BAIRRO%TYPE,
    P_LOGRADOURO T_DV_LOGRADOURO.NM_LOGRADOURO%TYPE,
    P_CEP T_DV_LOGRADOURO.NR_CEP%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_LOGRADOURO(
        ID_BAIRRO,
        NM_LOGRADOURO,
        NR_CEP
    ) VALUES(
        P_BAIRRO,
        P_LOGRADOURO,
        P_CEP
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Paciente

CREATE OR REPLACE PROCEDURE INCLUIR_PACIENTE(
    P_PACIENTE T_DV_PACIENTE.NM_PACIENTE%TYPE,
    P_CPF T_DV_PACIENTE.NR_CPF%TYPE,
    P_DATA_NASCIMENTO T_DV_PACIENTE.DT_NASCIMENTO%TYPE,
    P_SEXO_BIOLOGICO T_DV_PACIENTE.NM_SEXO_BIOLOGICO%TYPE,
    P_TIPO_SANGUINEO T_DV_PACIENTE.NM_TIPO_SANGUINEO%TYPE,
    P_DATA_INCLUSAO T_DV_PACIENTE.DT_INCLUSAO%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_PACIENTE(
        NM_PACIENTE,
        NR_CPF,
        DT_NASCIMENTO,
        NM_SEXO_BIOLOGICO,
        NM_TIPO_SANGUINEO,
        DT_INCLUSAO
    ) VALUES(
        P_PACIENTE,
        P_CPF,
        P_DATA_NASCIMENTO,
        P_SEXO_BIOLOGICO,
        P_TIPO_SANGUINEO,
        P_DATA_INCLUSAO
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Remédio

CREATE OR REPLACE PROCEDURE INCLUIR_REMEDIO(
    P_REMEDIO T_DV_REMEDIO.NM_REMEDIO%TYPE,
    P_FORMA_FARMACEUTICA T_DV_REMEDIO.NM_FORMA_FARMACEUTICA%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_REMEDIO(
        NM_REMEDIO,
        NM_FORMA_FARMACEUTICA
    ) VALUES(
        P_REMEDIO,
        P_FORMA_FARMACEUTICA
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Sintoma

CREATE OR REPLACE PROCEDURE INCLUIR_SINTOMA(
    P_NOME_SINTOMA T_DV_SINTOMA.NM_SINTOMA%TYPE,
    P_DESCRICAO_SINTOMA T_DV_SINTOMA.DS_SINTOMA%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_SINTOMA(
        NM_SINTOMA,
        DS_SINTOMA
    ) VALUES(
        P_NOME_SINTOMA,
        P_DESCRICAO_SINTOMA
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Doença

CREATE OR REPLACE PROCEDURE INCLUIR_DOENCA(
    P_DOENCA T_DV_DOENCA.NM_DOENCA%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_DOENCA(
        NM_DOENCA
    ) VALUES(
        P_DOENCA
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Consulta

CREATE OR REPLACE PROCEDURE INCLUIR_CONSULTA(
    P_PACIENTE T_DV_CONSULTA.ID_PACIENTE%TYPE,
    P_CONSULTA_COMECO T_DV_CONSULTA.DT_HR_CONSULTA_COMECO%TYPE,
    P_CONSULTA_FIM T_DV_CONSULTA.DT_HR_CONSULTA_FIM%TYPE,
    P_TEMPERATURA T_DV_CONSULTA.NR_TEMPERATURA%TYPE,
    P_PRESSAO T_DV_CONSULTA.NR_PRESSAO%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_CONSULTA(
        ID_PACIENTE,
        DT_HR_CONSULTA_COMECO,
        DT_HR_CONSULTA_FIM,
        NR_TEMPERATURA,
        NR_PRESSAO
    ) VALUES(
        P_PACIENTE,
        P_CONSULTA_COMECO,
        P_CONSULTA_FIM,
        P_TEMPERATURA,
        P_PRESSAO
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Exame

CREATE OR REPLACE PROCEDURE INCLUIR_EXAME(
    P_CONSULTA T_DV_EXAME.ID_CONSULTA%TYPE,
    P_ESPECIALIDADE T_DV_EXAME.NM_ESPECIALIDADE%TYPE,
    P_MEDICO T_DV_EXAME.NM_MEDICO%TYPE,
    P_EXAME_DATA T_DV_EXAME.DT_EXAME%TYPE,
    P_EXAME_HORA T_DV_EXAME.HR_EXAME%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_EXAME(
        ID_CONSULTA,
        NM_ESPECIALIDADE,
        NM_MEDICO,
        DT_EXAME,
        HR_EXAME
    ) VALUES(
        P_CONSULTA,
        P_ESPECIALIDADE,
        P_MEDICO,
        P_EXAME_DATA,
        P_EXAME_HORA
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Endereço do Exame

CREATE OR REPLACE PROCEDURE INCLUIR_ENDERECO_EXAME(
    P_LOGRADOURO T_DV_ENDERECO_EXAME.ID_LOGRADOURO%TYPE,
    P_EXAME T_DV_ENDERECO_EXAME.ID_EXAME%TYPE,
    P_LOCAL_EXAME T_DV_ENDERECO_EXAME.NR_LOCAL_EXAME%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_ENDERECO_EXAME(
        ID_LOGRADOURO,
        ID_EXAME,
        NR_LOCAL_EXAME
    ) VALUES(
        P_LOGRADOURO,
        P_EXAME,
        P_LOCAL_EXAME
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Endereço do Paciente

CREATE OR REPLACE PROCEDURE INCLUIR_ENDERECO_PACIENTE(
    P_PACIENTE T_DV_ENDERECO_PACIENTE.ID_PACIENTE%TYPE,
    P_LOGRADOURO T_DV_ENDERECO_PACIENTE.ID_LOGRADOURO%TYPE,
    P_RESIDENCIA T_DV_ENDERECO_PACIENTE.NR_RESIDENCIA%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_ENDERECO_PACIENTE(
        ID_PACIENTE,
        ID_LOGRADOURO,
        NR_RESIDENCIA
    ) VALUES(
        P_PACIENTE,
        P_LOGRADOURO,
        P_RESIDENCIA
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Celular

CREATE OR REPLACE PROCEDURE INCLUIR_CELULAR(
    P_PACIENTE T_DV_CELULAR.ID_PACIENTE%TYPE,
    P_TELEFONE T_DV_CELULAR.NR_TELEFONE%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_CELULAR(
        ID_PACIENTE,
        NR_TELEFONE
    ) VALUES(
        P_PACIENTE,
        P_TELEFONE
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Remédio do Paciente

CREATE OR REPLACE PROCEDURE INCLUIR_PACIENTE_REMEDIO(
    P_REMEDIO T_DV_PACIENTE_REMEDIO.ID_REMEDIO%TYPE,
    P_PACIENTE T_DV_PACIENTE.ID_PACIENTE%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_PACIENTE_REMEDIO(
        ID_REMEDIO,
        ID_PACIENTE
    ) VALUES(
        P_REMEDIO,
        P_PACIENTE
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Doença do Paciente

CREATE OR REPLACE PROCEDURE INCLUIR_PACIENTE_DOENCA(
    P_PACIENTE T_DV_PACIENTE_DOENCA.ID_PACIENTE%TYPE,
    P_DOENCA T_DV_PACIENTE_DOENCA.ID_DOENCA%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_PACIENTE_DOENCA(
        ID_PACIENTE,
        ID_DOENCA
    ) VALUES(
        P_PACIENTE,
        P_DOENCA
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Sintomas da Doença

CREATE OR REPLACE PROCEDURE INCLUIR_DOENCA_SINTOMA(
    P_DOENCA T_DV_DOENCA_SINTOMA.ID_DOENCA%TYPE,
    P_SINTOMA T_DV_DOENCA_SINTOMA.ID_SINTOMA%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_DOENCA_SINTOMA(
        ID_DOENCA,
        ID_SINTOMA
    ) VALUES(
        P_DOENCA,
        P_SINTOMA
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- E-mail do Paciente

CREATE OR REPLACE PROCEDURE INCLUIR_EMAIL(
    P_PACIENTE T_DV_EMAIL.ID_PACIENTE%TYPE,
    P_EMAIL T_DV_EMAIL.NM_EMAIL%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_EMAIL(
        ID_PACIENTE,
        NM_EMAIL
    ) VALUES(
        P_PACIENTE,
        P_EMAIL
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Diagnóstico do Exame

CREATE OR REPLACE PROCEDURE INCLUIR_DIAGNOSTICO_EXAME(
    P_EXAME T_DV_DIAGNOSTICO_EXAME.ID_EXAME%TYPE,
    P_DOENCA T_DV_DIAGNOSTICO_EXAME.ID_DOENCA%TYPE,
    P_TER_DOENCA T_DV_DIAGNOSTICO_EXAME.FL_DOENCA%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_DIAGNOSTICO_EXAME(
        ID_EXAME,
        ID_DOENCA,
        FL_DOENCA
    ) VALUES(
        P_EXAME,
        P_DOENCA,
        P_TER_DOENCA
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Mensagem

CREATE OR REPLACE PROCEDURE INCLUIR_MENSAGEM(
    P_PACIENTE T_DV_MENSAGEM.ID_PACIENTE%TYPE,
    P_CONSULTA T_DV_MENSAGEM.ID_CONSULTA%TYPE,
    P_HORARIO_MENSAGEM T_DV_MENSAGEM.DT_HR_MENSAGEM%TYPE,
    P_MENSAGEM T_DV_MENSAGEM.TX_MENSAGEM%TYPE,
    P_FOI_PACIENTE T_DV_MENSAGEM.FL_PACIENTE%TYPE,
    P_FOI_CONSULTA T_DV_MENSAGEM.FL_CONSULTA%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_MENSAGEM(
        ID_PACIENTE,
        ID_CONSULTA,
        DT_HR_MENSAGEM,
        TX_MENSAGEM,
        FL_PACIENTE,
        FL_CONSULTA
    ) VALUES(
        P_PACIENTE,
        P_CONSULTA,
        P_HORARIO_MENSAGEM,
        P_MENSAGEM,
        P_FOI_PACIENTE,
        P_FOI_CONSULTA
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;

-- Diagnóstico da Consulta

CREATE OR REPLACE PROCEDURE INCLUIR_DIAGNOSTICO_CONSULTA(
    P_DOENCA T_DV_DIAGNOSTICO_CONSULTA.ID_DOENCA%TYPE,
    P_CONSULTA T_DV_DIAGNOSTICO_CONSULTA.ID_CONSULTA%TYPE,
    P_TER_DOENCA T_DV_DIAGNOSTICO_CONSULTA.FL_DOENCA%TYPE
) AS
    ERROR_CODE    NUMBER;
    ERROR_MESSAGE VARCHAR2(300);
BEGIN
    INSERT INTO T_DV_DIAGNOSTICO_CONSULTA(
        ID_DOENCA,
        ID_CONSULTA,
        FL_DOENCA
    ) VALUES(
        P_DOENCA,
        P_CONSULTA,
        P_TER_DOENCA
    );
    COMMIT;
EXCEPTION
    WHEN PROGRAM_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Houve um erro interno na procedure.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Valor inserido errado e/ou maior que o permitido.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
    WHEN OTHERS THEN
        ROLLBACK;
        ERROR_CODE := SQLCODE;
        ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Algum erro ocorreu.');
        INSERT INTO T_DV_LOG_ERRO(
            CD_ERRO,
            DS_MENSAGEM_ERRO
        ) VALUES(
            ERROR_CODE,
            ERROR_MESSAGE
        );
END;
