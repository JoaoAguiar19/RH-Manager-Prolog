:- consult('funcionarios.pl').

% Segue o formato licenca(tipo_da_licenca, duracao_em_dias).

licenca(maternidade, 120).
licenca(paternidade, 5).
licenca(atestado, 15).
licenca(casamento, 3).
licenca(luto, 2).
licenca(doacao_sangue, 1).
licenca(_, 0).

% atribuição de licença a um funcionário
:- dynamic licenca_registrada/3.
registrar_licenca(Cpf, Tipo, Duracao) :-
    cpf_valido(Cpf),
    funcionario(Cpf, _, Status),
    Status \= desligado,
    verifica_licenca(Tipo, Duracao),
    assertz(licenca_registrada(Cpf, Tipo, Duracao)).

% licenças já registradas
licenca_registrada("11111111111", paternidade, 4).
licenca_registrada("11111111111", casamento, 2).


% auxiliar para verificar validade
verifica_licenca(Tipo, Duracao) :-
    licenca(Tipo, Duracao),
    Duracao > 0,
    licenca(Tipo, Max),
    Duracao =< Max.

% lista todas as licenças de um funcionário
licencas_do_funcionario(Cpf, Lista) :-
    findall(
        licenca_registrada(Cpf,Tipo,Dias),
        licenca_registrada(Cpf,Tipo,Dias),
        Lista
    ).

% busca o total de dias de licença que um funcionário possui
total_dias_licenca(Cpf, Total) :-
    findall(
        Dias,
        licenca_registrada(Cpf,_,Dias),
        ListaDias
    ),
    soma_dias_licenca(ListaDias, Total).

soma_dias_licenca([], 0).
soma_dias_licenca([H|T], R) :-
    soma_dias_licenca(T, R1),
    R is H + R1.


% Jornadas

:- dynamic jornada/4.

jornada("11111111111", "2026-03-10", 8, 17).
jornada("11111111111", "2026-03-11", 8, 16).
jornada("22222222222", "2026-03-11", 9, 18).


registrar_jornada(Cpf, Data, Entrada, Saida) :-
    cpf_valido(Cpf),
    funcionario(Cpf, _, Status),
    Status \= desligado,
    Saida > Entrada,
    assertz(jornada(Cpf, Data, Entrada, Saida)).

horas_trabalhadas(Cpf, Data, Horas) :-
    jornada(Cpf, Data, Entrada, Saida),
    Horas is Saida - Entrada.

jornadas_do_funcionario(Cpf, Lista) :-
    findall(
        jornada(Cpf, Data, Entrada, Saida),
        jornada(Cpf, Data, Entrada, Saida),
        Lista
    ).

total_horas_trabalhadas(Cpf, Total) :-
    findall(
        Horas,
        (
            jornada(Cpf, _, Entrada, Saida),
            Horas is Saida - Entrada
        ),
        ListaHoras
    ),
    soma_horas(ListaHoras, Total).

soma_horas([], 0).
soma_horas([H|T], R) :-
    soma_horas(T, R1),
    R is H + R1.

jornada_valida(Cpf, Data) :-
    jornada(Cpf, Data, Entrada, Saida),
    Horas is Saida - Entrada,
    Horas =< 8.


% R unifica com valida ou invalida
verifica_jornada(Cpf, Data, R) :-
    jornada(Cpf, Data, Entrada, Saida),
    Horas is Saida - Entrada,
    classifica_jornada(Horas, R).

classifica_jornada(Horas, valida) :-
    Horas =< 8.

classifica_jornada(Horas, invalida) :-
    Horas > 8.




% Queries de exemplo:
%
% licencas_do_funcionario("11111111111", L).
%
% registrar_licenca("11111111111", casamento, 3),
% licencas_do_funcionario("11111111111", L).
%
% total_dias_licenca("11111111111", X).
%
% jornada_valida("11111111111","2026-03-10").
%
% verifica_jornada("11111111111","2026-03-10", R).
%
% total_horas_trabalhadas("11111111111", T).
%
%
%
%
%
%
%
%
%