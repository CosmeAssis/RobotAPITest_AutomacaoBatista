*** Settings ***
Library    FakerLibrary
Library    RequestsLibrary
Resource   ./variables/TestAPI_variables.robot

*** Keywords ***
Dado o endpoint da API
    Create Session    serverestAPI    ${URL_API}
    ${HEADER_1}    Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADER_1}