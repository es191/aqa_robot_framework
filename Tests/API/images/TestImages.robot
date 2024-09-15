*** Settings ***
Library    Collections
Resource    images_base.robot
Resource    keywords/GET_image.robot
Documentation       Test suite for API images
Force Tags      @images

*** Test Cases ***
GET random image
    [Tags]  @smoke
    ImagesSearch
    Should Be Equal As Numbers    ${response.status_code}    200

GET specific image with SUB_ID
    [Tags]  @smoke
    ImageSearchWithID    ${SUB_ID}
    Should Be Equal As Numbers    ${response.status_code}    200

    Log                            ${response.content}
    ${json_response}=    Call Method    ${response}    json

    Should Be True    isinstance(${json_response}, dict)
    Dictionary Should Contain Key    ${json_response}    id
   
GET breed by IMAGE_ID
    [Tags]  @smoke
    ImageOfBreedByImageId
    Should Be Equal As Numbers    ${response.status_code}    200

    Log                            ${response.content}
    ${json_response}=    Call Method    ${response}    json
    Should Be True    isinstance(${json_response}, list)
   
