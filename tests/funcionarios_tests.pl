:- begin_tests(funcionarios).

test(funcionario_existe) :-
    funcionario("11111111111","Joao",ativo).

test(funcionario_ativo) :-
    funcionario("22222222222","Maria",ativo).

test(funcionario_inexistente, [fail]) :-
    funcionario("99999999999",_,_).

:- end_tests(funcionarios).