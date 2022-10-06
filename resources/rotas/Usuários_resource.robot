*** Settings ***
Library    FakerLibrary    locale=pt_BR
Resource   ../TestAPI_ResourceBase.robot

*** Keywords ***
E informar um nome
    ${USUARIOS_NOME}        FakerLibrary.Name
    Set Global Variable    ${USUARIOS_NOME}

E informar um email
    ${USUARIOS_EMAIL}        FakerLibrary.Email
    Set Global Variable      ${USUARIOS_EMAIL}
        
E informar um password
    ${USUARIOS_PASSW}        FakerLibrary.Password
    Set Global Variable      ${USUARIOS_PASSW}

E informar o parametro administrador true
    ${USUARIOS_ADMINISTRADOR}    FakerLibrary.Boolean
    Set Global Variable          ${USUARIOS_ADMINISTRADOR}

Quando realizar a requisição da rota para criar usuário
    ${RESPOSTA}    POST On Session    serverestAPI   usuarios
    ...    data={"nome":"${USUARIOS_NOME}"}
    ...    headers=${HEADER_1}
    Log    ${RESPOSTA.text}