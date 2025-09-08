*** Settings ***
Library    SeleniumLibrary
Library    ../utility/read_csv_data.py
Resource    ../variables/login_page_variables.robot
Resource    ../pages/dashboard_page.robot
Resource    ../pages/login_page.robot
Resource    ../keywords/logout_validation.robot
Documentation    This Test Verifies the Multiple Sets of Login Flow and Validate Error Message For Invalid User

*** Keywords ***
Launch Browser
    [Documentation]    This Keyword Launches the Browser and Maximizes the Window
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Validate URL
    [Documentation]    This Keyword Validate the Url is Accessible
    ${ACTUAL_URL}=    Get location
    Should start with    ${ACTUAL_URL}    ${URL}
    Log    Actual URl: ${ACTUAL_URL}
    Log    Expected URL: ${URL}
    Should contain    ${ACTUAL_URL}    ${URL}


Validate Title of Home Page
    [Documentation]    This Keyword Validate the Title of the Home Page
    ${ACTUAL_TITLE}=    Get Title
    Should match    ${ACTUAL_TITLE}    ${EXPECTED_TITLE}
    Log    Actual Page Title: ${ACTUAL_TITLE}
    Log    Expected Page Title: ${EXPECTED_TITLE}

Enter Credentials
    [Documentation]    This Keyword Read the Username and Password from CSV and Enter in Appropriate Field
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Enter Username and Password    ${USERNAME}    ${PASSWORD}

Click On Login Button
    [Documentation]    This Keyword Clicks on Login Button
    Click Login Button

Dashboard Element Validation
    [Documentation]    This Keyword Prints the Logged Username that Displayed on  Dashboard
    Dashboard Element

Validate Build Flow
    [Documentation]    This Keyword Validates the Login Flow Based on the Status Returned from the "Handle Error Message" Keyword.
    ...                Also Validate and Pass the Test Result Which is Then Used to Write the Test Report in CSV.
    [Arguments]    ${STATUS}
    IF    ${STATUS}
        Dashboard Element Validation
        Click On Logout
        Validate Logout
        ${TEST_RESULT}    Set Variable    Valid Credential
    ELSE
        ${ERROR_TEXT}=    Get Text    ${ERROR_MESSAGE}
        Log    Error Message: ${ERROR_TEXT}
        ${TEST_RESULT}    Set Variable    ${ERROR_TEXT}
    END
    RETURN    ${TEST_RESULT}

Click On Logout
    [Documentation]    This Keyword Validates the Logout is Successful by Printing the Page Heading
    Logout Functionality

Close The Browser
    [Documentation]    This Keyword Close the Browser
    Close Browser
