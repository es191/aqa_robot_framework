*** Settings ***
Resource    ../../../credentials/credentials.robot
Library     RequestsLibrary
Library     OperatingSystem


*** Keywords ***
CreateVote
    [Documentation]    create a vote from user
    [Arguments]    ${IMAGE_ID}    ${SUB_ID}    ${VALUE}

    ${headers}=    Create Dictionary
    ...    Content-Type=application/json
    ...    x-api-key=${API_key}

    ${body}=    Create Dictionary
    ...    image_id=${IMAGE_ID}
    ...    sub_id=${SUB_ID}
    ...    value=${VALUE}

    Create Session    vote    ${URL}    verify=True
    ${response}=    Post Request    vote    /votes    headers=${headers}
    ...    json=${body}

    Log    ${response}
    Set Test Variable    ${response}
