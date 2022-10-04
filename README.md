# RobotAPITest_AutomacaoBatista

Automação de testes utilizando a API de Tarefas<br />
**Documentação:** https://apidetarefas.docs.apiary.io/#reference<br />
**Endpoint:** https://api-de-tarefas.herokuapp.com/

## Cenários de Teste

**Rota:** */usuários*

**CN0001-Cadastrar usuário o parametro administrador igual a true**

Dado o endereço da API da rota usuário<br />
E informar um nome<br />
E informar um email<br />
E informar um password<br />
E informar o parametro administrador true<br />
Quando realizar a requisição da rota para criar usuário<br />
Então deve retornar a mensagem cadastro realizado com sucesso<br />
E o status code igual a 200

**CN0002-Cadastrar usuário o parametro administrador igual a false**

Dado o endereço da API da rota usuário<br />
E informar um nome<br />
E informar um email<br />
E informar um password<br />
E informar o parametro administrador false<br />
Quando realizar a requisição da rota para criar usuário<br />
Então deve retornar a mensagem cadastro realizado com sucesso<br />
E o status code igual a 200

**CN0003-Tentativa de cadastro de usuário sem o parametro nome**

Dado o endereço da API da rota usuário<br />
E informar um email<br />
E informar um password<br />
E informar o parametro administrador true<br />
Quando realizar a requisição da rota para criar usuário<br />
Então deve retornar a mensagem nome não pode ficar em branco<br />
E o status code igual a 400

**CN0004-Tentativa de cadastro de usuário com email já cadastrado na base**

Dado o endereço da API da rota usuário<br />
E informar um nome<br />
E informar um email já cadastrado na base<br />
E informar um password<br />
E informar o parametro administrador true<br />
Quando realizar a requisição da rota para criar usuário<br />
Então deve retornar a mensagem Este email já está sendo usado<br />
E o status code igual a 400

**CN0005-Tentativa de cadastro de usuário sem email**

Dado o endereço da API da rota usuário<br />
E informar um nome<br />
E informar um password<br />
E informar o parametro administrador true<br />
Quando realizar a requisição da rota para criar usuário<br />
Então deve retornar a mensagem email não pode ficar em branco<br />
E o status code igual a 400

**CN0006-Tentativa de cadastro sem parametro administrador**

Dado o endereço da API da rota usuário<br />
E informar um nome<br />
E informar um email<br />
E informar um password<br />
Quando realizar a requisição da rota para criar usuário<br />
Então deve retornar a mensagem administrador deve ser 'true' ou 'false'<br />
E o status code igual a 400