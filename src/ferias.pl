:- consult('funcionarios.pl').

ferias("11111111111",data(1,2,2023),data(15,2,2023),15).
ferias("11111111111",data(10,7,2023),data(20,7,2023),10).
ferias("22222222222",data(5,1,2023),data(15,1,2023),10).
ferias("22222222222",data(1,8,2023),data(10,8,2023),10).

:- dynamic ferias/4.

% estruturas:
% ferias(Cpf,Inicio,Fim,Dias)
% data(Dia,Mes,Ano)

registrar_ferias(Cpf,Inicio,Fim,Dias) :-
    cpf_valido(Cpf),
    funcionario(Cpf, _, Status),
    Status \= desligado,
    saldo_ferias(Cpf,Saldo),
    Dias =< Saldo,
    assertz(ferias(Cpf,Inicio,Fim,Dias)).

saldo_ferias(Cpf,Saldo) :-
    findall(
        Dias,
        ferias(Cpf,_,_,Dias),
        ListaDias
    ),
    soma_lista(ListaDias,TotalUsado),
    Saldo is 30 - TotalUsado.


listar_ferias(Cpf,Lista) :-
    findall(
        ferias(Inicio,Fim,Dias),
        ferias(Cpf,Inicio,Fim,Dias),
        Lista
    ).

soma_lista([],0).
soma_lista([H|T],R) :-
    soma_lista(T,R1),
    R is H + R1.

% Exemplos de uso:
% registrar_ferias("11111111111",data(1,2,2023),data(15,2,2023),15).
% saldo_ferias("11111111111",X).
% listar_ferias("11111111111",L).