:- consult('funcionarios.pl').
:- consult('afastamentos.pl').
:- consult('ferias.pl').
:- consult('jornadaLicenca.pl').
:- consult('departamento.pl').

:- consult('menuFuncionarios.pl').
:- consult('menuAfastamento.pl').
:- consult('menuFerias.pl').
:- consult('menuJornadaLicenca.pl').
:- consult('menuDepartamento.pl').

main :-
    repeat,
    nl,
    write('======= SISTEMA RH ======='), nl,
    write('1 - Funcionarios'), nl,
    write('2 - Afastamentos'), nl,
    write('3 - Ferias'), nl,
    write('4 - Jornada / Licenca'), nl,
    write('5 - Departamentos'), nl,
    write('0 - Sair'), nl,
    write('Escolha uma opcao (finalize com ponto): '),
    read(Op),
    executar(Op),
    Op = 0, !.

executar(1) :- menu_funcionarios.
executar(2) :- menu_afastamento.
executar(3) :- menu_ferias.
executar(4) :- menu_jornada_licenca.
executar(5) :- menu_departamentos.

executar(0) :-
    write('Encerrando sistema...'), nl.

executar(_) :-
    write('Opcao invalida!'), nl.