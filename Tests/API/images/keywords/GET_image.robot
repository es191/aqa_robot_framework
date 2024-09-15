*** Settings ***
Resource    ../../../credentials/credentials.robot
Library    RequestsLibrary
Library    OperatingSystem


*** Keywords ***
ImagesSearch
    [Documentation]     to get random image

    ${headers}=       Create Directory
    ...               Content-Type=application/json

    Create Session      image           ${URL}      verify=True
    ${response}=        Get Request     image       /images/search     ${headers}

    Log                 ${response}
    Set Test Variable   ${response}

ImageSearchWithID
    [Documentation]     to get a specific image with SUB_ID
    [Arguments]    ${SUB_ID}

    ${headers}=       Create Directory
    ...               Content-Type=application/json

    Create Session      image           ${URL}      verify=True
    ${response}=        Get Request     image       /images/${SUB_ID}     ${headers}

    Log                 ${response}
    Set Test Variable   ${response}

ImageOfBreedByImageId
    [Documentation]     to get a specific breed by IMAGE_ID

    ${headers}=       Create Directory
    ...               Content-Type=application/json

    Create Session      image           ${URL}      verify=True
    ${response}=        Get Request     image       /images/${IMAGE_ID}/breeds     ${headers}

    Log                 ${response}
    Set Test Variable   ${response}