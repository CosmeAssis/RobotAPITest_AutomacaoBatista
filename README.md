# RobotAPITest_AutomacaoBatista

Automação de testes utilizando a API de Tarefas<br />
Documentação: https://apidetarefas.docs.apiary.io/#reference

## Cenários de Teste
**CN0001-Realizar o cadastro de um novo contato(POST)**

Dado o endereço da API para cadastrar um novo contato<br />
E com os todos os campos do Body preenchidos<br />
Quando realizar a requisição para cadastrar o contato,
</br >
Então a API deve retornar os dados do cadastro e o status **200**

**CN0002-Realizar tentativa de cadastro de um novo contato sem o campo obrigatório name(POST)**

Dado o endereço da API para cadastrar um novo contato<br />
E todos os campos preenchidos exceto o name<br />
Quando realizar a requisição para cadastrar o contato<br />
Então a API deve retornar mensagem não pode ficar em branco e o status **422**

**CN0003-Realizar tentativa de cadastro com email já cadastrado na base(POST)**

Dado o endereço da API para cadastrar um novo contato<br />
E o campo email preenchido com um já existente em outro cadastro<br />
Quando realizar a requisição para cadastrar o contato<br />
Então a API deve retornar mensagem já está em uso e o status **422**

**CN0004-Listar os contatos cadastrados(GET)**

Dado o endereço da API para listar contatos<br />
Quando realizar a requisição para listar os contatos<br />
Então a API deve retornar a lista de contatos e o status **200**