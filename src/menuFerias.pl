:- consult('ferias.pl').

menu_ferias :-
    repeat,
    nl,
    write('===== MENU FERIAS ====='), nl,
    write('1 - Registrar ferias'), nl,
    write('2 - Ver saldo de ferias'), nl,
    write('3 - Listar ferias do funcionario'), nl,
    write('0 - Voltar'), nl,
    write('Escolha uma opcao (finalize com ponto): '),
    read(Op),
    executar_menu_ferias(Op),
    Op = 0, !.


executar_menu_ferias(1) :-
    write('Digite o CPF do funcionario: '),
    read(Cpf),

    write('Dia inicio: '),
    read(D1),
    write('Mes inicio: '),
    read(M1),
    write('Ano inicio: '),
    read(A1),

    write('Dia fim: '),
    read(D2),
    write('Mes fim: '),
    read(M2),
    write('Ano fim: '),
    read(A2),

    write('Quantidade de dias: '),
    read(Dias),

    Inicio = data(D1,M1,A1),
    Fim = data(D2,M2,A2),

    (registrar_ferias(Cpf,Inicio,Fim,Dias)
        -> write('Ferias registradas com sucesso!')
        ;  write('Nao foi possivel registrar as ferias.')
    ),
    nl, !.


executar_menu_ferias(2) :-
    write('Digite o CPF do funcionario: '),
    read(Cpf),
    (saldo_ferias(Cpf,Saldo)
        -> write('Saldo de ferias: '), write(Saldo), nl
        ;  write('Funcionario nao possui ferias registradas.'), nl
    ), !.


executar_menu_ferias(3) :-
    write('Digite o CPF do funcionario: '),
    read(Cpf),
    (listar_ferias(Cpf,Lista)
        -> write('Ferias registradas:'), nl,
           write(Lista), nl
        ;  write('Nenhuma ferias registrada para esse funcionario.'), nl
    ), !.


executar_menu_ferias(0) :-
    write('Voltando ao menu principal...'), nl, !.


executar_menu_ferias(_) :-
    write('Opcao invalida!'), nl, !.