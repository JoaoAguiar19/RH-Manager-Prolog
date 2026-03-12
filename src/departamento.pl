:- consult('funcionarios.pl').

departamento_funcionario("TI","11111111111").
departamento_funcionario("TI","44444444444").
departamento_funcionario("TI","55555555555").

departamento_funcionario("Financas","22222222222").
departamento_funcionario("Financas","66666666666").

departamento_funcionario("RH","33333333333").
departamento_funcionario("RH","77777777777").


departamento("TI", "Departamento de ti", "11111111111").
departamento("Financas", "Departamento de financas", "11111111112").
departamento("RH", "Departamento de RH", "11111111113").


lista_func_dept(Departamento, Lista) :-
    findall(
        Funcionario,
        departamento_funcionario(Departamento, Funcionario),
        Lista
    ).


lista_departamentos(Lista) :-
    findall(
        Nome,
        departamento(Nome, _, _),
        Lista
    ).


qtd_func_dept(Departamento, Quantidade) :-
    lista_func_dept(Departamento, Lista),
    conta_func(Lista, Quantidade).


conta_func([], 0).
conta_func([_|T], R) :-
    conta_func(T, R1),
    R is R1 + 1.


departamento_existe(Nome) :-
    departamento(Nome, _, _).