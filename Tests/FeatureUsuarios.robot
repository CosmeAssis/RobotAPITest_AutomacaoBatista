*** Settings ***
Resource    ../Resources/Main.robot
Resource    ../Resources/rotas/Usuarios_Resource.robot

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

CN0004-Tentativa de cadastro de usuário com email já cadastrado na base
    [Tags]    tentativa_cadastroUsuario_EmailCadastrado
    Dado o endpoint da API
    E informar um nome
    E informar um email já cadastrado na base
    E informar um password
    E informar o parametro administrador true
    Quando realizar a requisição da rota para criar usuário com email já cadastrado
    Então deve retornar a mensagem Este email já está sendo usado
    E o status code igual a 400    

CN0005-Tentativa de cadastro de usuário sem email
    [Tags]    tentativa_cadastroUsuario_SemEmail
    Dado o endpoint da API
    E informar um nome
    E informar um password
    E informar o parametro administrador true
    Quando realizar a requisição da rota para criar usuário com parametro email vazio
    Então deve retornar a mensagem email não pode ficar em branco
    E o status code igual a 400

CN0006-Tentativa de cadastro sem parametro administrador
    [Tags]    tentativa_cadastroUsuario_SemAdministrador
    Dado o endpoint da API
    E informar um nome
    E informar um email
    E informar um password
    Quando realizar a requisição da rota para criar usuário com parametro administrador vazio
    Então deve retornar a mensagem administrador deve ser 'true' ou 'false'
    E o status code igual a 400

CN0007-Buscar usuário com ID existente
    [Tags]    buscar_Usuario_ID_Existente
    Dado o endpoint da API
    Quando realizar a requisição da rota para buscar usuário por ID existente
    Então deve retornar o body da request com os dados de cadastro do usuário

CN0008-Buscar usuário com ID inexistente
    [Tags]    buscar_Usuario_ID_Inexistente
    Dado o endpoint da API
    Quando realizar a requisição da rota para buscar usuário por ID inexistente
    Então deve retorna uma mensagem Usuário não encontrado

CN0009-Excluir usuário existente
    [Tags]    excluir_Usuario
    Dado o endpoint da API
    Quando realizar a requisição da rota para excluir um usuário existente
    Então deve retornar a mensagem Registro excluído com sucesso