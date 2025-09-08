*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/login_page_variables.robot
Documentation    This Keyword Verifies The Error Message appears when Invalid User Login

*** Keywords ***
Handle Error Message
    [Documentation]    This Keyword Rejects the Invalid Credentials with Appropriate Error Message.
    ...                Also Returns the Validation Value to Continue the Login Flow.
    ${STATUS}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${ERROR_MESSAGE}    5s
    IF    ${STATUS}
        Log    Invalid Credentials
        RETURN    False
    ELSE
        Log    Valid Credentials
        RETURN    True
    END