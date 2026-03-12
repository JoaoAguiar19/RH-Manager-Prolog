:- consult('funcionarios.pl').

menu_funcionarios :-
    repeat,
    nl,
    write('===== MENU FUNCIONARIOS ====='), nl,
    write('1 - Validar CPF'), nl,
    write('2 - Verificar se funcionario existe'), nl,
    write('3 - Verificar se funcionario esta ativo'), nl,
    write('4 - Listar funcionarios ativos'), nl,
    write('5 - Listar funcionarios desligados'), nl,
    write('0 - Voltar'), nl,
    write('Escolha uma opcao (finalize com ponto): '),
    read(Op),
    executar_funcionarios(Op),
    Op = 0, !.


executar_funcionarios(1) :-
    write('Digite o CPF: '),
    read(Cpf),
    (cpf_valido(Cpf)
        -> write('CPF valido!')
        ;  write('CPF invalido!')
    ),
    nl, !.


executar_funcionarios(2) :-
    write('Digite o CPF: '),
    read(Cpf),
    (funcionario_existe(Cpf)
        -> write('Funcionario encontrado!')
        ;  write('Funcionario nao existe!')
    ),
    nl, !.


executar_funcionarios(3) :-
    write('Digite o CPF: '),
    read(Cpf),
    (funcionario_ativo(Cpf)
        -> write('Funcionario esta ativo!')
        ;  write('Funcionario nao esta ativo!')
    ),
    nl, !.


executar_funcionarios(4) :-
    funcionarios_ativos(Lista),
    write('Funcionarios ativos:'), nl,
    write(Lista), nl, !.


executar_funcionarios(5) :-
    funcionarios_desligados(Lista),
    write('Funcionarios desligados:'), nl,
    write(Lista), nl, !.


executar_funcionarios(0) :-
    write('Voltando ao menu principal...'), nl, !.


executar_funcionarios(_) :-
    write('Opcao invalida!'), nl.