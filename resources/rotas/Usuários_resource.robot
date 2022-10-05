*** Settings ***
Library    FakerLibrary    locale=pt_BR
Resource   ../TestAPI_ResourceBase.robot

*** Keywords ***
E informar um nome
    ${USUARIOS_NOME}        FakerLibrary.Name
    Set Global Variable    ${USUARIOS_NOME}

E informar um email
E informar um password
E informar o parametro administrador true
Quando realizar a requisição da rota para criar usuário
    ${RESPOSTA}    POST On Session    serverestAPI   usuarios
    ...    data={"nome":"${USUARIOS_NOME}"}
    ...    headers=${HEADER_1}
    Log    ${RESPOSTA.text}