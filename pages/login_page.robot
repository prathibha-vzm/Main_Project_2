*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/login_page_variables.robot
Library    ../utility/read_csv_data.py
Documentation    This Keyword Locate the Username and Password Field and Enters the Value.
...                Also Validate the Login Button and Click

*** Keywords ***
Enter Username and Password
    [Arguments]    ${USERNAME}    ${PASSWORD}
    TRY
        ${USERNAME_LOCATOR}    Set Variable    ${USERNAME_FIELD}
        Wait Until Element Is Visible    ${USERNAME_FIELD}
        Element Should Be Visible    ${USERNAME_LOCATOR}
        Element Should Be Enabled    ${USERNAME_LOCATOR}
        Clear Element Text    ${USERNAME_LOCATOR}
        Input Text    ${USERNAME_LOCATOR}    ${USERNAME}
        Log    Entered Username: ${USERNAME}
    EXCEPT
        Log    Username Element Not Found
    END

    TRY
        ${PASSWORD_LOCATOR}    Set Variable    ${PASSWORD_FIELD}
        Element Should Be Visible    ${PASSWORD_LOCATOR}
        Element Should Be Enabled    ${PASSWORD_LOCATOR}
        Clear Element Text    ${PASSWORD_LOCATOR}
        Input Text    ${PASSWORD_LOCATOR}    ${PASSWORD}
        Log    Entered Password: ${PASSWORD}
    EXCEPT
        Log    Password Element Not Found
    END

Click Login Button
    Element Should Be Visible    ${LOGIN_BUTTON}
    Element Should Be Enabled    ${LOGIN_BUTTON}
    Click Button    ${LOGIN_BUTTON}