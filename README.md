# RobotAPITest_AutomacaoBatista

Automação de testes utilizando a API ServerRest<br />
**Documentação:** https://serverest.dev/#/<br />
**Endpoint:** https://serverest.dev/

## Cenários de Teste

### **Rota:** /usuários

#### Cenários referente a API para cadastrar usuário

**CN0001-Cadastrar usuário o parametro administrador igual a true**

Dado o endpoint da API<br />
E informar um nome<br />
E informar um email<br />
E informar um password<br />
E informar o parametro administrador true<br />
Quando realizar a requisição da rota para criar usuário<br />
Então deve retornar a mensagem cadastro realizado com sucesso<br />
E o status code igual a 201

**CN0002-Cadastrar usuário o parametro administrador igual a false**

Dado o endpoint da API<br />
E informar um nome<br />
E informar um email<br />
E informar um password<br />
E informar o parametro administrador false<br />
Quando realizar a requisição da rota para criar usuário<br />
Então deve retornar a mensagem cadastro realizado com sucesso<br />
E o status code igual a 201

**CN0003-Tentativa de cadastro de usuário sem o parametro nome**

Dado o endpoint da API<br />
E informar um email<br />
E informar um password<br />
E informar o parametro administrador true<br />
Quando realizar a requisição da rota para criar usuário sem o parametro nome<br />
Então deve retornar a mensagem nome não pode ficar em branco<br />
E o status code igual a 400

**CN0004-Tentativa de cadastro de usuário com email já cadastrado na base**

Dado o endpoint da API<br />
E informar um nome<br />
E informar um email já cadastrado na base<br />
E informar um password<br />
E informar o parametro administrador true<br />
Quando realizar a requisição da rota para criar usuário com email já cadastrado<br />
Então deve retornar a mensagem Este email já está sendo usado<br />
E o status code igual a 400

**CN0005-Tentativa de cadastro de usuário sem email**

Dado o endpoint da API<br />
E informar um nome<br />
E informar um password<br />
E informar o parametro administrador true<br />
Quando realizar a requisição da rota para criar usuário com parametro email vazio<br />
Então deve retornar a mensagem email não pode ficar em branco<br />
E o status code igual a 400

**CN0006-Tentativa de cadastro sem parametro administrador**

Dado o endpoint da API<br />
E informar um nome<br />
E informar um email<br />
E informar um password<br />
Quando realizar a requisição da rota para criar usuário com parametro administrador vazio<br />
Então deve retornar a mensagem administrador deve ser 'true' ou 'false'<br />
E o status code igual a 400

### **Rota:** /usuários/{_id}

#### Cenários referente a API para buscar usuário por ID

**CN0007-Buscar usuário com ID existente**

Dado o endpoint da API<br />
Quando realizar a requisição da rota para buscar usuário por ID existente<br />
Então deve retornar o body da request com os dados de cadastro do usuário<br />

**CN0008-Buscar usuário com ID inexistente**

Dado o endpoint da API<br />
Quando realizar a requisição da rota para buscar usuário por ID inexistente<br />
Então deve retorna uma mensagem Usuário não encontrado<br />