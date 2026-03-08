:- consult('funcionarios.pl').

% Fatos

afastamento(1,"11111111111",afastamento_medico,10,20).
afastamento(2,"22222222222",ferias,5,15).


% Tipos que exigem documentação

tipo_exige_documentacao(afastamento_medico).
tipo_exige_documentacao(acidente_trabalho).


% Validar período

validar_periodo(Inicio,Fim) :-
    Inicio =< Fim.


% Verificar conflito

conflita(
    afastamento(_,Cpf,_,I1,F1),
    afastamento(_,Cpf,_,I2,F2)
) :-
    \+ (F1 < I2 ; F2 < I1).


% Funcionário afastado em uma data

afastado_em(Data,Cpf) :-
    cpf_valido(Cpf),
    funcionario(Cpf,_,Status),
    Status \= desligado,
    afastamento(_,Cpf,_,Inicio,Fim),
    Inicio =< Data,
    Data =< Fim.


% Listar afastamentos de um funcionário

afastamentos_funcionario(Cpf,Lista) :-
    cpf_valido(Cpf),
    findall(
        afastamento(Id,Cpf,Tipo,I,F),
        afastamento(Id,Cpf,Tipo,I,F),
        Lista
    ).