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

% método auxiliar que soma recursivamente a quantidade de dias de licença de um funcionário
soma_dias_licenca([], 0).
soma_dias_licenca([H|T], R) :-
    soma_dias_licenca(T, R1),
    R is H + R1.








% Queries de exemplo:
%
% licencas_do_funcionario("11111111111", L).
%
% registrar_licenca("11111111111", casamento, 3),
% licencas_do_funcionario("11111111111", L).
%
% total_dias_licenca("11111111111", X).
%
%
%
%
%
%
%
%
%
%
%
%
%
