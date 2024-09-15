*** Settings ***
Documentation       Test suite for API breeds

Library             Collections
Resource            keywords/GET_breeds.robot
Resource            breeds_base.robot

Force Tags          @breeds


*** Test Cases ***
GET all breeds
    [Tags]    @smoke
    AllBreeds
    Should Be Equal As Numbers    ${response.status_code}    200

    Log    ${response.content}
    ${json_response}=    Call Method    ${response}    json

    Should Be True    isinstance(${json_response}, list)
    Should Not Be Empty    ${json_response}

    ${dogs_name}=    Get From List    ${json_response}    1
    Dictionary Should Contain Key    ${dogs_name}    name
    Should Be Equal    ${dogs_name['name']}    Afghan Hound

GET specific breed
    [Tags]    @smoke
    SpecificBreed    ${BREED_ID}
    Should Be Equal As Numbers    ${response.status_code}    200

    Log    ${response.content}
    ${json_response}=    Call Method    ${response}    json

    Should Be True    isinstance(${json_response}, dict)
    Dictionary Should Contain Key    ${json_response}    bred_for
    Should Be Equal    ${json_response['name']}    Appenzeller Sennenhund
