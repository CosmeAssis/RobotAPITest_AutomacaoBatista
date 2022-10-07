*** Settings ***
Library    FakerLibrary    locale=pt_BR
Library    String
Library    Collections
Library    OperatingSystem
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

E informar o parametro administrador ${ADMINSTRADOR}
    Set Global Variable    ${ADMINSTRADOR}

Quando realizar a requisição da rota para criar usuário
    ${RESPOSTA}    POST On Session    serverestAPI   usuarios
    ...    data={"nome":"${USUARIOS_NOME}","email":"${USUARIOS_EMAIL}","password":"${USUARIOS_PASSW}","administrador":"${ADMINSTRADOR}"}
    ...    headers=${HEADER_1}
    Set Global Variable     ${RESPOSTA}

Então deve retornar a mensagem ${CADASTRO_REALIZADO_SUCESSO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    message    ${CADASTRO_REALIZADO_SUCESSO}
    Log    ${RESPOSTA.content}

E o status code igual a ${STATUS_CODE}
    Status Should Be    ${STATUS_CODE}
    Log    "Status Code:"${RESPOSTA.status_code}
    @{FILE_RESPONSE}    Create List    email: ${USUARIOS_EMAIL} - nome: ${USUARIOS_NOME} - password: ${USUARIOS_PASSW} - id: ${RESPOSTA.json()['_id']}
    Append To File    ${EXECDIR}/responses/response.txt   @{FILE_RESPONSE}\n