:- begin_tests(departamento).

test(listar_departamentos) :-
    lista_departamentos(L),
    L == ["TI","Financas","RH"].

test(funcionarios_ti) :-
    lista_func_dept("TI", L),
    L == ["11111111111","44444444444","55555555555"].

test(qtd_financas) :-
    qtd_func_dept("Financas", Q),
    Q =:= 2.

test(departamento_existe) :-
    departamento_existe("RH").

test(departamento_nao_existe, [fail]) :-
    departamento_existe("Marketing").

:- end_tests(departamento).