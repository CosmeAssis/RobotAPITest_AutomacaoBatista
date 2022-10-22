*** Settings ***
Library    FakerLibrary    locale=pt_BR
Library    String
Library    Collections
Library    OperatingSystem
Resource   ../Main.robot

*** Variables ***
${RESPONSE_CADASTRO_SUCESSO}        Cadastro realizado com sucesso
${RESPONSE_NOME_BRANCO}             nome não pode ficar em branco
${EMAIL_EXISTENTE_RESQUEST}         azevedopedro-lucas@example.com
${RESPONSE_EMAIL_EM_USO}            Este email já está sendo usado
${RESPONSE_EMAIL_EM_BRANCO}         email não pode ficar em branco
${RESPONSE_ADMINISTRADOR_VAZIO}     administrador deve ser 'true' ou 'false'
${PARAMS_ID_USUARIO_INEXISTENTE}    ud187371635ac

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

Então deve retornar a mensagem Cadastro realizado com sucesso
    Dictionary Should Contain Item    ${RESPOSTA.json()}    message    ${RESPONSE_CADASTRO_SUCESSO}
    ${PAYLOAD}    Set Variable    ${RESPOSTA.json()}
    ${_ID}      Set Variable    ${PAYLOAD['_id']}   
    Set Global Variable    ${_ID} 

Então deve retornar a mensagem nome não pode ficar em branco
    Dictionary Should Contain Item    ${RESPOSTA.json()}    nome    ${RESPONSE_NOME_BRANCO}
    Log    ${RESPOSTA.content}

E o status code igual a ${STATUS_CODE}
    IF    ${STATUS_CODE} == 201
        Status Should Be    ${STATUS_CODE}
        Log    "Status Code:"${RESPOSTA.status_code}
        @{FILE_RESPONSE}    Create List    email: ${USUARIOS_EMAIL} - nome: ${USUARIOS_NOME} - password: ${USUARIOS_PASSW} - id: ${RESPOSTA.json()['_id']} - administrador: ${ADMINSTRADOR}
        Append To File    ${EXECDIR}/responses/response.txt   @{FILE_RESPONSE}\n
    END
    IF    ${STATUS_CODE} == 400
        Status Should Be    ${STATUS_CODE}
        Log    "Status Code:"${RESPOSTA.status_code}
    END
      
Quando realizar a requisição da rota para criar usuário sem o parametro nome
        ${RESPOSTA}    POST On Session    serverestAPI   usuarios    expected_status=400
    ...    data={"nome":"","email":"${USUARIOS_EMAIL}","password":"${USUARIOS_PASSW}","administrador":"${ADMINSTRADOR}"}
    ...    headers=${HEADER_1}
    Set Global Variable     ${RESPOSTA}

Quando realizar a requisição da rota para criar usuário com email já cadastrado
        ${RESPOSTA}    POST On Session    serverestAPI   usuarios    expected_status=400
    ...    data={"nome":"${USUARIOS_NOME}","email":"${EMAIL_EXISTENTE_RESQUEST}","password":"${USUARIOS_PASSW}","administrador":"${ADMINSTRADOR}"}
    ...    headers=${HEADER_1}
    Set Global Variable     ${RESPOSTA}   

Quando realizar a requisição da rota para criar usuário com parametro email vazio
            ${RESPOSTA}    POST On Session    serverestAPI    usuarios    expected_status=400
    ...    data={"nome":"${USUARIOS_NOME}","email":"","password":"${USUARIOS_PASSW}","administrador":"${ADMINSTRADOR}"}
    ...    headers=${HEADER_1}
    Set Global Variable     ${RESPOSTA} 

Quando realizar a requisição da rota para criar usuário com parametro administrador vazio
    ${RESPOSTA}    POST On Session    serverestAPI   usuarios    expected_status=400
    ...    data={"nome":"${USUARIOS_NOME}","email":"${USUARIOS_EMAIL}","password":"${USUARIOS_PASSW}","administrador":""}
    ...    headers=${HEADER_1}
    Set Global Variable     ${RESPOSTA}  

E informar um email já cadastrado na base
    Set Global Variable    ${EMAIL_EXISTENTE_RESQUEST}

Então deve retornar a mensagem Este email já está sendo usado
    Log    ${RESPOSTA.content} 
    Dictionary Should Contain Item    ${RESPOSTA.json()}    message    ${RESPONSE_EMAIL_EM_USO}

Então deve retornar a mensagem email não pode ficar em branco
    Log    ${RESPOSTA.content}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    email    ${RESPONSE_EMAIL_EM_BRANCO}

Então deve retornar a mensagem administrador deve ser 'true' ou 'false'
    Log    ${RESPOSTA.content}
    Dictionary Should Contain Item    ${RESPOSTA.json()}   administrador    ${RESPONSE_ADMINISTRADOR_VAZIO}

Então deve retornar o body da request com os dados de cadastro do usuário
    Log    ${RESPOSTA.content}

Então deve retorna uma mensagem Usuário não encontrado
    

Quando realizar a requisição da rota para buscar usuário por ID existente
    ${RESPOSTA}    GET On Session    serverestAPI    usuarios/${_ID}
    Set Global Variable    ${RESPOSTA}
Quando realizar a requisição da rota para buscar usuário por ID inexistente
    ${RESPOSTA}    GET On Session    serverestAPI    usuarios/${PARAMS_ID_USUARIO_INEXISTENTE}
    Set Global Variable    ${RESPOSTA}