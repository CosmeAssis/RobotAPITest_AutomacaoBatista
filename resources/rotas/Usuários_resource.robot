*** Settings ***

*** Keywords ***
Dado o endereço da API da rota usuário
E informar um nome
E informar um email
E informar um password
E informar o parametro administrador true
Quando realizar a requisição da rota para criar usuário
Então deve retornar a mensagem cadastro realizado com sucesso
E o status code igual a 200