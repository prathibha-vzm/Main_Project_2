*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/login_page_keywords.robot
Library    ../utility/read_csv_data.py
Resource    ../keywords/write_to_csv_data.robot
Resource    ../variables/login_page_variables.robot
Resource    ../pages/login_page.robot
Resource    ../pages/login_error_message.robot
Resource    ../keywords/login_fields_visibility.robot
Library    Collections
Documentation    This Test Verifies the Multiple Sets of Login Flow and Validate Error Message For Invalid User

*** Keywords ***
Validate Login Functionality Using Multiple Sets Of Credentials
    [Documentation]    These Test Verifies the Valid User to Login and Logout, When Invalid User Login then Error Message is Thrown.
    @{CREDENTIALS}=    Read Usernames and Passwords

    FOR    ${CREDS}    IN    @{CREDENTIALS}
        ${USERNAME}=    Set Variable    ${CREDS}[0]
        ${PASSWORD}=    Set Variable    ${CREDS}[1]
        Validate Title of Home Page
        Enter Credentials    ${USERNAME}    ${PASSWORD}
        Click On Login Button
        ${STATUS}=    Handle Error Message
        ${TEST_RESULT}=    Validate Build Flow    ${STATUS}
        Write To Csv    ${USERNAME}    ${PASSWORD}    ${TEST_RESULT}
    END
