:- begin_tests(ferias).

test(soma_lista) :-
    soma_lista([5,10,15], R),
    R =:= 30.

test(saldo_funcionario) :-
    saldo_ferias("11111111111", Saldo),
    number(Saldo).

:- end_tests(ferias).