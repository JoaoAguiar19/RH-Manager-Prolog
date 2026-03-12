:- begin_tests(jornada_licenca).

test(listar_licencas_funcionario) :-
    licencas_do_funcionario("11111111111", L),
    L == [
        licenca_registrada("11111111111",paternidade,4),
        licenca_registrada("11111111111",casamento,2)
    ].

test(total_dias_licenca) :-
    total_dias_licenca("11111111111", Total),
    Total =:= 6.

test(tipo_licenca_existe) :-
    once(licenca(maternidade,120)).

test(tipo_licenca_invalido, [fail]) :-
    licenca(inexistente,10).

test(horas_trabalhadas_dia) :-
    once(horas_trabalhadas("11111111111","2026-03-10", H)),
    H =:= 9.

test(jornada_valida) :-
    once(jornada_valida("11111111111","2026-03-11")).

test(jornada_invalida, [fail]) :-
    jornada_valida("11111111111","2026-03-10").

test(verifica_jornada_valida) :-
    once(verifica_jornada("11111111111","2026-03-11", valida)).

test(verifica_jornada_invalida) :-
    once(verifica_jornada("11111111111","2026-03-10", invalida)).

test(total_horas_trabalhadas) :-
    once(total_horas_trabalhadas("11111111111", Total)),
    Total =:= 17.

:- end_tests(jornada_licenca).