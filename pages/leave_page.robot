*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/leave_variables.robot
Resource    ../variables/admin_page_variables.robot

*** Keywords ***
Click On Leave in the Menu
    [Documentation]    This Keyword Clicks on Leave in the Menu
    ${LEAVE_LOCATOR_STATUS}    Run keyword and return status    Wait until element is visible    ${LEAVE_LOCATOR}
    IF    ${LEAVE_LOCATOR_STATUS}
        Click element    ${LEAVE_LOCATOR}
        Log    Clicked on Leave Locator
    ELSE
        Log    Leave Locator Not Found
    END

Click On Assign Leave
    [Documentation]    This Keyword Clicks on Assign Leave in Leave Page
    ${ASSIGN_LEAVE_LOCATOR_STATUS}    Run keyword and return status    Wait until element is visible    ${ASSIGN_LEAVE_LOCATOR}
    IF    ${ASSIGN_LEAVE_LOCATOR_STATUS}
        Click element    ${ASSIGN_LEAVE_LOCATOR}
        Log    Assign Leave is Clicked
    ELSE
        Log    Assign Leave not Found
    END

Select Leave Type
    [Documentation]    This Keyword Select the Leave Type fromt the List
    ${LEAVE_TYPE_STATUS}    Run keyword and return status    Wait until element is visible    ${LEAVE_TYPE}
    IF    ${LEAVE_TYPE_STATUS}
        Click element    ${LEAVE_TYPE}
        Log    Clicked On Leave Type
        Wait until element is visible    ${USER_ROLE_DROP_DOWN_FOCUS}
        Wait until element is visible    ${NAME_OF_LEAVE}
        Click element    ${NAME_OF_LEAVE}
        Log    Selected Leave Type: Personal
    ELSE
        Log    Leave Type Element Not found
    END
    Capture page screenshot    screenshots/Leave_Type.png

Select From Date
    [Documentation]    This Keyword Enters Date For From_Date Field
    ${FROM_DATE_STATUS}    Run keyword and return status    Wait until element is visible    ${FROM_DATE}
    IF    ${FROM_DATE_STATUS}
        Input text    ${FROM_DATE}    ${FROM_DATE_INPUT}
        Log    Applied Leave From Date: ${FROM_DATE_INPUT}
    ELSE
        Log    From Date Not Found
    END
    Capture page screenshot    screenshots/From_Date.png


Select To Date
    [Documentation]    This Keyword Enters Date For To_Date Field
    ${TO_DATE_STATUS}    Run keyword and return status    Wait until element is visible    ${TO_DATE}
    IF    ${TO_DATE_STATUS}
        Input text    ${TO_DATE}    ${TO_DATE_INPUT}
        Log    Applied Leave Till Date: ${TO_DATE_INPUT}
    ELSE
        Log    To Date Not Found
    END
    Capture page screenshot    screenshots/To_Date.png

Enter Comments in Text Area
    [Documentation]    This Keyword Enters Data in Text Area
    ${TEXT_AREA_STATUS}    Run keyword and return status    Wait until element is visible    ${TEXT_AREA}
    IF    ${TEXT_AREA_STATUS}
        Input text    ${TEXT_AREA}    ${COMMENT}
        Log    Entered the Comment
    ELSE
        Log   Comment Not Found
    END
    Capture page screenshot    screenshots/Comments.png

Error Message in Leave Form
    [Documentation]    This Keyword Validates the Error Message Presence For all the fields
    ${ERROR_MESSAGE_LEAVE_STATUS}  Run keyword and return status    Wait until element is visible    ${ERROR_MESSAGE_LEAVE}
    IF    ${ERROR_MESSAGE_LEAVE_STATUS}
        ${ERROR_MESSAGE_TEXT}=    Get text    ${ERROR_MESSAGE_LEAVE}
        Log    Error Message is: ${ERROR_MESSAGE_TEXT}
    ELSE
        Log    No Error Message
    END

Select Duration of Leave
    [Documentation]    This Keyword Selects the Duration of Leave From List
    ${DURATION_STATUS}    Run keyword and return status    Wait until element is visible    ${DURATION}
    IF    ${DURATION_STATUS}
        Click element    ${DURATION}
        Wait until element is visible    ${LIST_BOX_DURATION}
        Click element    ${LIST_BOX_DURATION}
        Log    Clikced on Duration and Selected Duration
    ELSE
        Log    Duration not found
    END
    Capture page screenshot    screenshots/Leave_Duration.png

Click On Assign Button
    [Documentation]    This Keyword Validatest the Visibility and Click on Assign Button
    ${ASSIGN_BUTTON_STATUS}    Run keyword and return status    Wait until element is visible    ${ASSIGN_BUTTON}
    IF    ${ASSIGN_BUTTON_STATUS}
        Click button    ${ASSIGN_BUTTON}
        Log    Clicked on the Assign Button
    ELSE
        Log    Not CLicked on The Assign Button
    END
    Capture page screenshot    screenshots/Success_Message.png

Validate Success Message
    [Documentation]    This Keyword Prints the Success Message Appeared after Applying for Leave
    ${SUCCESS_MESSAGE_LEAVE_STATUS}     Run keyword and return status    Wait until element is visible    ${SUCCESS_MESSAGE_LEAVE}
    IF    ${SUCCESS_MESSAGE_LEAVE_STATUS}
        ${TEXT}=    Get text    ${SUCCESS_MESSAGE_LEAVE}
        Log    ${TEXT}
        Wait until element is visible    ${OK_BUTTON}
        Click element    ${OK_BUTTON}
        Log    Clicked on OK Button
    ELSE
        Log    Success Message Not Found
    END

Click on My Leave
    [Documentation]    This Keyword Validates the Visibility and Click on Report and Select My Leave Entitlements
    ${REPORTS_LOCATOR_STATUS}    Run keyword and return status    Wait until element is visible    ${REPORTS_LOCATOR}
    IF    ${REPORTS_LOCATOR_STATUS}
       Click element    ${REPORTS_LOCATOR}
       Log    Clicked on Reports
       Wait until element is visible    ${MY_LEAVE_ENTITLEMENTS}
       Click element    ${MY_LEAVE_ENTITLEMENTS}
       Log    Clicked on MY_LEAVE_ENTITLEMENTS
       Sleep    3s
       Wait until element is visible    ${GENERATE_BUTTON}
       Click button    ${GENERATE_BUTTON}

    ELSE
       Log    Not Clicked on Reports
    END

Find the Record
    [Documentation]    This Keyword Validates the presence of the Leave Record in The Records
    [Arguments]    ${EMPLOYEE_TEXT}
    Wait until element is visible    ${RECORDS_LOCATOR}
    @{RECORDS}=    Get WebElements    ${RECORDS_LOCATOR}

    FOR    ${RECORD}    IN    @{RECORDS}
        ${RECORD_TEXT}=    Get text    ${RECORD}
        IF    '$EMPLOYEE_TEXT.startswith($RECORD_TEXT)'
          Log to console    ${EMPLOYEE_TEXT} Found in ${RECORD_TEXT}
          Exit for loop
        ELSE
          Log to console    ${EMPLOYEE_TEXT} Not Found in ${RECORD_TEXT}
          Continue for loop
        END
    END
    Capture page screenshot    screenshots/Leave_Record_Found.png


