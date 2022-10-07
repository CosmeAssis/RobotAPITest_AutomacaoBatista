*** Settings ***
Resource    ../resources/TestAPI_ResourceBase.robot
Resource    ../resources/rotas/Usuários_resource.robot

*** Variables ***
${URL_API}    https://serverest.dev/

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