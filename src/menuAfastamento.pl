:- consult('afastamentos.pl').

menu_afastamentos :-
    repeat,
    nl,
    write('===== MENU AFASTAMENTOS ====='), nl,
    write('1 - Verificar se funcionario esta afastado em uma data'), nl,
    write('2 - Listar afastamentos de um funcionario'), nl,
    write('3 - Verificar se um tipo exige documentacao'), nl,
    write('0 - Voltar'), nl,
    write('Escolha uma opcao (finalize com ponto): '),
    read(Op),
    executar_menu_af(Op),
    Op = 0, !.


executar_menu_af(1) :-
    write('Digite o CPF: '),
    read(Cpf),
    write('Digite a data (numero): '),
    read(Data),
    (afastado_em(Data,Cpf)
        -> write('Funcionario esta afastado nessa data.')
        ;  write('Funcionario nao esta afastado nessa data.')
    ),
    nl, !.


executar_menu_af(2) :-
    write('Digite o CPF: '),
    read(Cpf),
    afastamentos_funcionario(Cpf,Lista),
    write('Afastamentos encontrados:'), nl,
    write(Lista), nl, !.


executar_menu_af(3) :-
    write('Digite o tipo de afastamento: '),
    read(Tipo),
    (tipo_exige_documentacao(Tipo)
        -> write('Esse tipo exige documentacao.')
        ;  write('Esse tipo nao exige documentacao.')
    ),
    nl, !.


executar_menu_af(0) :-
    write('Voltando ao menu principal...'), nl, !.


executar_menu_af(_) :-
    write('Opcao invalida!'), nl, !.