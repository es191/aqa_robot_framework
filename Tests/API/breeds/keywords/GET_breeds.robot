*** Settings ***
Resource        ../../../credentials/credentials.robot
Library         RequestsLibrary
Library    OperatingSystem

*** Keywords ***
AllBreeds
    [Documentation]    to get all breeds

    ${params}=        Create Dictionary
    ...               limit=25
    ...               page=0 

    ${headers}=       Create Directory
    ...               Content-Type=application/json

    Create Session    breed    ${URL}        verify=True
    ${response}=      Get Request    breed    /breeds    params=${params}    headers=${headers}

    Log                 ${response}
    Set Test Variable   ${response}


SpecificBreed
    [Documentation]    to get specific breed by BREED_ID
    [Arguments]    ${BREED_ID}

    ${params}=        Create Dictionary
    ...               limit=25
    ...               page=0 

    ${headers}=       Create Directory
    ...               Content-Type=application/json

    Create Session    breed    ${URL}        verify=True
    ${response}       Get Request    breed    /breeds/${BREED_ID}    params=${params}    headers=${headers}

    Log                 ${response}
    Set Test Variable   ${response}
