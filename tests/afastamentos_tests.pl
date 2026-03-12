:- begin_tests(afastamentos).

test(validar_periodo_valido) :-
    validar_periodo(5,10).

test(validar_periodo_invalido, [fail]) :-
    validar_periodo(20,10).

test(tipo_exige_documentacao) :-
    tipo_exige_documentacao(afastamento_medico).

test(tipo_nao_exige_documentacao, [fail]) :-
    tipo_exige_documentacao(ferias).

test(funcionario_afastado_em_data) :-
    afastado_em(15,"11111111111").

test(funcionario_nao_afastado_em_data, [fail]) :-
    afastado_em(30,"11111111111").

test(listar_afastamentos_funcionario) :-
    afastamentos_funcionario("11111111111", L),
    L == [afastamento(1,"11111111111",afastamento_medico,10,20)].

:- end_tests(afastamentos).