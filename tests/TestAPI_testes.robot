*** Settings ***
Resource    ../resources/TestAPI_ResourceBase.robot
Resource    ../resources/rotas/Usuários_resource.robot

*** Test Cases ***
CN0001-Cadastrar usuário o parametro administrador igual a true
    [Tags]    cadastrar_usuario_admistradorTrue
    Dado o endpoint da API
    E informar um nome
    E informar um email
    E informar um password
    E informar o parametro administrador true
    Quando realizar a requisição da rota para criar usuário
    Então deve retornar a mensagem Cadastro realizado com sucesso
    E o status code igual a 201

CN0002-Cadastrar usuário o parametro administrador igual a false
    [Tags]    cadastrar_usuario_admistradorFalse
    Dado o endpoint da API
    E informar um nome
    E informar um email
    E informar um password
    E informar o parametro administrador false
    Quando realizar a requisição da rota para criar usuário
    Então deve retornar a mensagem Cadastro realizado com sucesso
    E o status code igual a 201

CN0003-Tentativa de cadastro de usuário sem o parametro nome
    [Tags]    tentativa_cadastroUsuario_SemParametro
    Dado o endpoint da API
    E informar um email
    E informar um password
    E informar o parametro administrador true
    Quando realizar a requisição da rota para criar usuário sem o parametro nome
    Então deve retornar a mensagem nome não pode ficar em branco
    E o status code igual a 400