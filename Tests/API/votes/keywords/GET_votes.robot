*** Settings ***
Resource    ../../../credentials/credentials.robot
Library     RequestsLibrary
Library     OperatingSystem


*** Keywords ***
AllVotes
    [Documentation]    get all votes

    ${headers}=    Create Dictionary
    ...    Content-Type=application/json
    ...    x-api-key=${API_key}

    Create Session    vote    ${URL}    verify=True
    ${response}=    Get Request    vote    /votes    headers=${headers}

    Log    ${response}
    Set Test Variable    ${response}

SpecificVote
    [Documentation]    get specific breed by BREED_ID
    [Arguments]    ${VOTE_ID}

    ${headers}=    Create Dictionary
    ...    Content-Type=application/json
    ...    x-api-key=${API_key}

    Create Session    breed    ${URL}    verify=True
    ${response}=    Get Request    breed    /votes/${VOTE_ID}    headers=${headers}

    Log    ${response}
    Set Test Variable    ${response}
