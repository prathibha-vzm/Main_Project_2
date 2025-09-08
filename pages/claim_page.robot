*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/claim_variables.robot
Resource    ../variables/leave_variables.robot

*** Keywords ***
Click Claim On Menu
    [Documentation]    This Keyword validates the Click Claim on Menu and Click Submit Claim in its page
    ${CLAIM_STATUS}    Run keyword and return status    Wait until element is visible    ${CLAIM}
    IF    ${CLAIM_STATUS}
        Click element    ${CLAIM}
        Wait until element is visible    ${SUBMIT_CLAIM}
        Click element    ${SUBMIT_CLAIM}
        Log    Clicked On Claim then Clicked on Submit Claim
    ELSE
        Log    Claim is not Found
        Log    Submit CLaim not Found
    END

Create Claim Request Event
    [Documentation]    This Keyword Validates the Event field and Select an option from the List
    ${EVENT_STATUS}    Run keyword and return status    Wait until element is visible    ${EVENT}
    IF    ${EVENT_STATUS}
       Click element    ${EVENT}
       Sleep    2s
       Wait until element is enabled    ${EVENT_ARROW}
       Sleep    2s
       Wait until element is visible    ${NAME_OF_LEAVE}
       Click element    ${NAME_OF_LEAVE}
       Log    Clicked on Event
    ELSE
       Log    Event not found
    END

Create Claim Request Currency
    [Documentation]    This Keyword Validates the Currensy field and Select an option from the List
    ${CURRENCY_STATUS}    Run keyword and return status    Wait until element is visible    ${CURRENCY}
    IF    ${CURRENCY_STATUS}
       Click element    ${CURRENCY}
       Sleep    2s
       Wait until element is visible    ${NAME_OF_LEAVE}
       Click element    ${NAME_OF_LEAVE}
       Log    Clicked and Selected Currency
    ELSE
       Log    Currency not Found
    END

Create Claim Request Remarks
    [Documentation]    This Keyword Validates the Remark field and Enter the remarks
    ${REMARKS_STATUS}    Run keyword and return status    Wait until element is visible    ${REMARKS}
    IF    ${REMARKS_STATUS}
       Input text    ${REMARKS}    ${ENTER_REMARKS}
       Log    Entered ${ENTER_REMARKS}
    ELSE
       Log    Remarks not Found
    END

Handle Claims Error Message
    [Documentation]    This Keyword Validates the Error message That might appear if the Invalid inputs are given or not
    ${CLAIM_ERROR_MESSAGE_STATUS}    Run keyword and return status    Wait until element is visible    ${CLAIM_ERROR_MESSAGE}
    IF    ${CLAIM_ERROR_MESSAGE_STATUS}
       ${CLAIM_ERROR_MESSAGE_TEXT}=    Get text    ${CLAIM_ERROR_MESSAGE}
       Log    Error Message : ${CLAIM_ERROR_MESSAGE_TEXT}
    ELSE
       Log    No Error Message Found
    END

Click On Create Button
    [Documentation]    This Keyword Validates the Create Button and Click on it.
    ${CREATE_BUTTON_STATUS}    Run keyword and return status    Wait until element is visible    ${CREATE_BUTTON}
    IF    ${CREATE_BUTTON_STATUS}
       Click button    ${CREATE_BUTTON}
       Log    Clicked on Create Button
    ELSE
       Log    Create Button Not FOund
    END

Return Reference ID
    [Documentation]    This Keyword Validates the Presence of Reference Label in Submit Claim Page and Read the Reference ID generated for the claim created.
    ${REFERENCE_LABEL_STATUS}    Run keyword and return status    Wait until element is visible    ${REFERENCE_LABEL}
    IF    ${REFERENCE_LABEL_STATUS}
        ${REFERENCE_TEXT}=    Get text    ${REFERENCE_LABEL}
        Log    Read the Reference Number ${REFERENCE_TEXT}
        Wait until element is visible    ${REFERENCE_ID}
        ${REFERECE_NUMBER}=    Get element attribute    ${REFERENCE_ID}    value
        RETURN    ${REFERECE_NUMBER}
    ELSE
        Log    No Reference ID Found
        RETURN    None
    END


Click on Submit Again
    [Documentation]    This Keyword validates the visibilty of Submit Button and Click on it
    ${SUBMIT_CLAIM_BUTTON_STATUS}    Run keyword and return status    Wait until element is visible    ${SUBMIT_CLAIM_BUTTON}
    IF    ${SUBMIT_CLAIM_BUTTON_STATUS}
        Click button    ${SUBMIT_CLAIM_BUTTON}
        Log    Clicked On Submit Button
    ELSE
        Log    No Submit Button Found
    END

Click on My_Claims
    [Documentation]    This Keyword Click on My_Claims in CLaim Page
    ${MY_CLAIMS_STATUS}    Run keyword and return status    Wait until element is visible    ${MY_CLAIMS}
    IF    ${MY_CLAIMS_STATUS}
       Click element    ${MY_CLAIMS}
       Log    Clicked on My_Claims
    ELSE
       Log    My_Claims Not Found
    END

Find the Claim Request
    [Documentation]    This Keyword Reads the Reference Number passed as Argument and Validate it against the Records found in My_Claims Page
    [Arguments]    ${REFERENCE_NUMBER}
    Log to console    NUmber is: ${REFERENCE_NUMBER}

    Wait until element is visible    ${RECORDS_ROW}
    @{ROWS}    Get WebElements    ${RECORDS_ROW}

    FOR    ${ROW}    IN    @{ROWS}
       ${ROW_TEXT}=    Get text    ${ROW}
       IF    '${REFERENCE_NUMBER}' == '${ROW_TEXT}'
           Log to console    Record Found ${REFERENCE_NUMBER}==${ROW_TEXT}
           Exit for loop
       ELSE
           Log to console    Records Not Found ${REFERENCE_NUMBER}!=${ROW_TEXT}
           Continue for loop
       END
    END
    Capture page screenshot    screenshots/Claim_Record_Found.png




