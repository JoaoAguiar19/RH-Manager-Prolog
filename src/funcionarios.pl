% Fatos

funcionario("11111111111","Joao",ativo).
funcionario("22222222222","Maria",ativo).
funcionario("33333333333","Pedro",desligado).


% Validação de CPF

% verifica se todos os caracteres são dígitos
todos_digitos([]).
todos_digitos([H|T]) :-
    char_type(H, digit),
    todos_digitos(T).

% CPF válido = 11 dígitos numéricos
cpf_valido(Cpf) :-
    string_chars(Cpf, Lista),
    length(Lista, 11),
    todos_digitos(Lista).


% Verificar se funcionário existe

funcionario_existe(Cpf) :-
    funcionario(Cpf,_,_).


% Verificar se funcionário está ativo

funcionario_ativo(Cpf) :-
    funcionario(Cpf,_,ativo).


% Listar funcionários ativos

funcionarios_ativos(Lista) :-
    findall(
        funcionario(Cpf,Nome,ativo),
        funcionario(Cpf,Nome,ativo),
        Lista
    ).


% Listar funcionários desligados

funcionarios_desligados(Lista) :-
    findall(
        funcionario(Cpf,Nome,desligado),
        funcionario(Cpf,Nome,desligado),
        Lista
    ).