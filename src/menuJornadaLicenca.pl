:- consult('jornadaLicenca.pl').

menu_jornada_licensa :-
    repeat,
    nl,
    write('===== MENU JORNADA E LICENCAS ====='), nl,
    write('1 - Registrar licenca'), nl,
    write('2 - Listar licencas do funcionario'), nl,
    write('3 - Total de dias de licenca'), nl,
    write('4 - Registrar jornada'), nl,
    write('5 - Listar jornadas do funcionario'), nl,
    write('6 - Total de horas trabalhadas'), nl,
    write('7 - Verificar jornada'), nl,
    write('0 - Voltar'), nl,
    write('Escolha uma opcao: '),
    read(Op),
    executar_jornada_licensa(Op),
    Op = 0, !.


executar_jornada_licensa(1) :-
    write('CPF: '),
    read(Cpf),
    write('Tipo da licenca: '),
    read(Tipo),
    write('Duracao em dias: '),
    read(Duracao),
    (registrar_licenca(Cpf, Tipo, Duracao)
        -> write('Licenca registrada!')
        ;  write('Erro ao registrar licenca')
    ),
    nl, !.


executar_jornada_licensa(2) :-
    write('CPF: '),
    read(Cpf),
    licencas_do_funcionario(Cpf, Lista),
    write('Licencas do funcionario:'), nl,
    write(Lista), nl, !.


executar_jornada_licensa(3) :-
    write('CPF: '),
    read(Cpf),
    total_dias_licenca(Cpf, Total),
    write('Total de dias de licenca: '),
    write(Total), nl, !.


executar_jornada_licensa(4) :-
    write('CPF: '),
    read(Cpf),
    write('Data: '),
    read(Data),
    write('Hora de entrada: '),
    read(Entrada),
    write('Hora de saida: '),
    read(Saida),
    (registrar_jornada(Cpf, Data, Entrada, Saida)
        -> write('Jornada registrada!')
        ;  write('Erro ao registrar jornada')
    ),
    nl, !.


executar_jornada_licensa(5) :-
    write('CPF: '),
    read(Cpf),
    jornadas_do_funcionario(Cpf, Lista),
    write('Jornadas do funcionario:'), nl,
    write(Lista), nl, !.


executar_jornada_licensa(6) :-
    write('CPF: '),
    read(Cpf),
    total_horas_trabalhadas(Cpf, Total),
    write('Total de horas trabalhadas: '),
    write(Total), nl, !.


executar_jornada_licensa(7) :-
    write('CPF: '),
    read(Cpf),
    write('Data: '),
    read(Data),
    verifica_jornada(Cpf, Data, R),
    write('Resultado: '),
    write(R), nl, !.


executar_jornada_licensa(0) :-
    write('Voltando ao menu principal...'), nl, !.


executar_jornada_licensa(_) :-
    write('Opcao invalida!'), nl.