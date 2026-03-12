:- consult('departamento.pl').

menu_departamentos :-
    repeat,
    nl,
    write('===== MENU DEPARTAMENTOS ====='), nl,
    write('1 - Listar departamentos'), nl,
    write('2 - Listar funcionarios de um departamento'), nl,
    write('3 - Quantidade de funcionarios em um departamento'), nl,
    write('4 - Verificar se departamento existe'), nl,
    write('0 - Voltar'), nl,
    write('Escolha uma opcao (finalize com ponto): '),
    read(Op),
    executar_departamentos(Op),
    Op = 0, !.


executar_departamentos(1) :-
    lista_departamentos(Lista),
    write('Departamentos cadastrados:'), nl,
    write(Lista), nl, !.


executar_departamentos(2) :-
    write('Digite o codigo do departamento: '),
    read(Depto),
    lista_func_dept(Depto, Lista),
    (Lista = []
        -> write('Nenhum funcionario encontrado ou departamento inexistente.'), nl
        ;  write('Funcionarios do departamento:'), nl,
           write(Lista), nl
    ),
    !.


executar_departamentos(3) :-
    write('Digite o codigo do departamento: '),
    read(Depto),
    qtd_func_dept(Depto, Qtd),
    write('Quantidade de funcionarios: '),
    write(Qtd), nl, !.


executar_departamentos(4) :-
    write('Digite o codigo do departamento: '),
    read(Depto),
    (departamento_existe(Depto)
        -> write('Departamento existe!'), nl
        ;  write('Departamento nao existe!'), nl
    ),
    !.


executar_departamentos(0) :-
    write('Voltando ao menu principal...'), nl, !.


executar_departamentos(_) :-
    write('Opcao invalida!'), nl.