*** Settings ***
Resource    ../TestAPI_ResourceBase.robot

*** Test Cases ***
CN0001-Cadastrar usuário o parametro administrador igual a true
    [Tags]    cadastrar_usuario_admistradorTrue
    Dado o endpoint da API
    E informar um nome
    E informar um email
    E informar um password
    E informar o parametro administrador true
    Quando realizar a requisição da rota para criar usuário
    Então deve retornar a mensagem cadastro realizado com sucesso
    E o status code igual a 200