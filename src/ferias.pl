:- consult('funcionarios.pl').

:- dynamic ferias_funcionario/3.

% estruturas:
% ferias_funcionario(Cpf,Saldo,ListaFerias)
% ferias(Inicio,Fim,Dias)
% data(Dia,Mes,Ano)

registrar_ferias(Cpf,Inicio,Fim,Dias) :-
    ferias_funcionario(Cpf,Saldo,Lista),
    Dias =< Saldo,
    NovaFerias = ferias(Inicio,Fim,Dias),
    NovoSaldo is Saldo - Dias,
    append(Lista,[NovaFerias],NovaLista),
    retract(ferias_funcionario(Cpf,Saldo,Lista)),
    assertz(
        ferias_funcionario(Cpf,NovoSaldo,NovaLista)
    ).

registrar_ferias(Cpf,Inicio,Fim,Dias) :-
    \+ ferias_funcionario(Cpf,_,_),
    Dias =< 30,
    NovaFerias = ferias(Inicio,Fim,Dias),
    SaldoRestante is 30 - Dias,
    assertz(
        ferias_funcionario(Cpf,SaldoRestante,[NovaFerias])
    ).

saldo_ferias(Cpf,Saldo) :-
    ferias_funcionario(Cpf,Saldo,_).

listar_ferias(Cpf,Lista) :-
    ferias_funcionario(Cpf,_,Lista).


% Exemplos de uso:
% registrar_ferias("11111111111",data(1,2,2023),data(15,2,2023),15).
% saldo_ferias("11111111111",X).
% listar ferias
% listar_ferias("11111111111",L).