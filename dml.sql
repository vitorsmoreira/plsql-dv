-- Incluir Região

EXECUTE INCLUIR_REGIAO('Norte');
EXECUTE INCLUIR_REGIAO('Nordeste');
EXECUTE INCLUIR_REGIAO('Centro-Oeste');
EXECUTE INCLUIR_REGIAO('Sudeste');
EXECUTE INCLUIR_REGIAO('Sul');

-- Incluir Estado

EXECUTE INCLUIR_ESTADO(1, 'AM', 'Amazonas');
EXECUTE INCLUIR_ESTADO(2, 'MA', 'Maranhão');
EXECUTE INCLUIR_ESTADO(3, 'MT', 'Mato Grosso');
EXECUTE INCLUIR_ESTADO(4, 'SP', 'São Paulo');
EXECUTE INCLUIR_ESTADO(5, 'RS', 'Rio Grande do Sul');

-- Incluir Cidade

EXECUTE INCLUIR_CIDADE(1, 'Manaus');
EXECUTE INCLUIR_CIDADE(1, 'Borba');
EXECUTE INCLUIR_CIDADE(2, 'São Luís');
EXECUTE INCLUIR_CIDADE(2, 'Caxias');
EXECUTE INCLUIR_CIDADE(3, 'Cuiabá');
EXECUTE INCLUIR_CIDADE(3, 'Rondonópolis');
EXECUTE INCLUIR_CIDADE(4, 'São Paulo');
EXECUTE INCLUIR_CIDADE(4, 'Campinas');
EXECUTE INCLUIR_CIDADE(5, 'Porto Alegre');
EXECUTE INCLUIR_CIDADE(5, 'Pelotas');

-- Incluir Bairro

EXECUTE INCLUIR_BAIRRO(1, 'Acariquara');
EXECUTE INCLUIR_BAIRRO(2, 'Cristo Rei');
EXECUTE INCLUIR_BAIRRO(3, 'Jardim São Raimundo');
EXECUTE INCLUIR_BAIRRO(4, 'Trizidela');
EXECUTE INCLUIR_BAIRRO(5, 'Goiabeiras');
EXECUTE INCLUIR_BAIRRO(6, 'Vila Operária');
EXECUTE INCLUIR_BAIRRO(7, 'Butantã');
EXECUTE INCLUIR_BAIRRO(8, 'Guanabara');
EXECUTE INCLUIR_BAIRRO(9, 'Moinhos de Vento');
EXECUTE INCLUIR_BAIRRO(10, 'Três Vendas');

-- Incluir Logradouro

EXECUTE INCLUIR_LOGRADOURO(1, 'Dom Pedro I', '69040-220');
EXECUTE INCLUIR_LOGRADOURO(2, 'Avenida Amazonas', '69200-000');
EXECUTE INCLUIR_LOGRADOURO(3, 'Rua Campos Sales', '65057-799');
EXECUTE INCLUIR_LOGRADOURO(4, 'Rua da Salvação', '65727-970');
EXECUTE INCLUIR_LOGRADOURO(5, 'Avenida Isaac Póvoas', '78032-015');
EXECUTE INCLUIR_LOGRADOURO(6, 'Rua São José', '78720-610');
EXECUTE INCLUIR_LOGRADOURO(7, 'Praça Professor Rubião Meira', '05508-110');
EXECUTE INCLUIR_LOGRADOURO(8, 'Rua Camargo Paes', '13073-350');
EXECUTE INCLUIR_LOGRADOURO(9, 'Travessa Angustura', '90440-030');
EXECUTE INCLUIR_LOGRADOURO(10, 'Rua Igênio Menta', '99713-162');

-- Incluir Paciente

EXECUTE INCLUIR_PACIENTE(
    'Benedita Fátima Sandra Silveria',
    '923.982.126-02',
    TO_DATE('08/09/1946', 'DD/MM/YYYY'),
    'Feminino',
    'O-',
    TO_DATE('01/11/2023', 'DD/MM/YYYY')
);
EXECUTE INCLUIR_PACIENTE(
    'Nina Rita Giovanna Assis',
    '161.510.068-79',
    TO_DATE('16/03/1949', 'DD/MM/YYYY'),
    'Feminino',
    'A-',
    TO_DATE('01/11/2023', 'DD/MM/YYYY')
);
EXECUTE INCLUIR_PACIENTE(
    'Melissa Raquel Patrícia Alves',
    '365.716.537-10',
    TO_DATE('09/10/1944', 'DD/MM/YYYY'),
    'Feminino',
    'O-',
    TO_DATE('01/11/2023', 'DD/MM/YYYY')
);
EXECUTE INCLUIR_PACIENTE(
    'Anthony Tomás Bruno das Neves',
    '804.811.925-06',
    TO_DATE('05/06/1979', 'DD/MM/YYYY'),
    'Masculino',
    'A-',
    TO_DATE('01/11/2023', 'DD/MM/YYYY')
);
EXECUTE INCLUIR_PACIENTE(
    'Pedro Henrique Golçalves Medeiros',
    '922.922.537-12',
    TO_DATE('17/07/1988', 'DD/MM/YYYY'),
    'Masculino',
    'B-',
    TO_DATE('01/11/2023', 'DD/MM/YYYY')
);

-- 