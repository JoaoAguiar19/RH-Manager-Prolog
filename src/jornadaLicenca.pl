% Segue o formato licenca(tipo_da_licenca, duracao_em_dias).

licenca(maternidade, 120).
licenca(paternidade, 5).
licenca(atestado, 15).
licenca(casamento, 3).
licenca(luto, 2).
licenca(doacao_sangue, 1).
licenca(_, 0).


% testa a atribuição de licença a um funcionário
licenca_funcionario(Cpf, Tipo, Duracao) :-
    cpf_valido(Cpf),
    funcionario(Cpf, _, Status),
    Status \= desligado,
    licenca(Tipo, Duracao).


verifica_licenca(Tipo, Duracao) :-
    licenca(Tipo, Duracao),
    Duracao > 0,
    licenca(Tipo, Max),
    Duracao =< Max.
