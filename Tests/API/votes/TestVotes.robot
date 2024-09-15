*** Settings ***
Documentation       Test suite for API votes

Library             Collections
Resource            keywords/GET_votes.robot
Resource            votes_base.robot
Resource            keywords/POST_votes.robot

Force Tags          @votes


*** Test Cases ***
GET all votes
    [Tags]    @smoke    @votes
    AllVotes
    Should Be Equal As Numbers    ${response.status_code}    200

GET specific vote
    [Tags]    @smoke    @votes
    SpecificVote    ${VOTE_ID}
    Should Be Equal As Numbers    ${response.status_code}    200

    Log    ${response.content}
    ${json_response}=    Call Method    ${response}    json

    Should Be True    isinstance(${json_response}, dict)
    Dictionary Should Contain Key    ${json_response}    sub_id
    Should Be Equal    ${json_response['user_id']}    agji35

POST create vote
    [Tags]    @smoke    @votes
    CreateVote    ${IMAGE_ID}    ${SUB_ID}    ${VALUE}
    Should Be Equal As Numbers    ${response.status_code}    201

    Log    ${response.content}
    ${json_response}=    Call Method    ${response}    json

    Should Be True    isinstance(${json_response}, dict)
    Dictionary Should Contain Key    ${json_response}    country_code
    Should Be Equal    ${json_response['message']}    SUCCESS
