# Sistema RH em Prolog

Sistema de **RH MANAGER** desenvolvido em **Prolog** como parte das atividades de  
**Paradigmas de Linguagens de Programação (PLP)**, utilizando programação lógica,
regras declarativas e execução via terminal.

O projeto unifica **gestão de funcionários**, **departamentos**, **cargos**,  
**presença**, **afastamentos**, **licenças**, **jornadas** e **férias** em uma única
estrutura baseada em fatos e regras.

---

## Arquitetura do Projeto

O projeto segue uma **organização modular por domínio**, evitando acoplamento
excessivo e facilitando manutenção e evolução.

### Estrutura principal:

- **src/**
  - Contém os arquivos com fatos e regras do domínio
  - Modelagem declarativa das entidades do sistema
- **tests/**
  - Testes automatizados
- **main.pl**
  - Ponto de entrada do sistema
  - Responsável por carregar os módulos

A lógica do sistema é construída com:

- **Fatos** → Representação de dados
- **Regras** → Inferência lógica
- **Consultas (queries)** → Interação com o sistema

O `main.pl` apenas inicializa e organiza o carregamento dos módulos.

---

## Funcionalidades

### Funcionários
- Cadastro, alteração, busca e remoção
- Controle de status (**Ativo**, **Afastado**, **Desligado**)
- Listagem por situação

### Departamentos
- Cadastro, alteração e exclusão
- Associação de funcionários a departamentos

### Cargos
- Cadastro e associação obrigatória a um departamento
- Definição de carga horária
- Definição de salário
- Consulta por cargo ou setor

### Presença
- Registro diário de presença
- Modalidade presencial ou remota
- Registro de faltas justificadas e injustificadas
- Consulta por dia
- Histórico completo por funcionário
- Cálculo de horas trabalhadas em um período
- Cálculo de faltas acumuladas

### Afastamentos
- Registro por tipo de necessidade
- Exigência de documentação quando aplicável
- Encerramento de afastamentos
- Listagem de funcionários afastados

### Licenças e Jornadas
- Registro e remoção de licenças
- Criação de jornadas semanais
- Consulta de escalas
- Verificação de próximas folgas

### Férias
- Controle de ciclos aquisitivos
- Verificação automática de direito a férias
- Registro de férias simples ou fracionadas
- Atualização de saldo de dias
- Exibição detalhada por período
- Validação por data de referência

---

## Execução

Clone o repositório: https://github.com/JoaoAguiar19/RH-Manager-Prolog
