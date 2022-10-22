*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL_API}    https://serverest.dev/

*** Keywords ***
Dado o endpoint da API
    Create Session    serverestAPI    ${URL_API}
    ${HEADER_1}    Create Dictionary    content-type=application/json
    Set Global Variable    ${HEADER_1}