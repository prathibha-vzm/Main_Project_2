*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/login_page_variables.robot

*** Keywords ***
Validate Field Visibility
    [Documentation]    This Keyword Validate the visiblity and clickability of Username and Password Fields
    Wait until element is visible    ${USERNAME_FIELD}
    Wait until element is enabled    ${USERNAME_FIELD}
    Sleep    2s
    Page should contain element    ${USERNAME_FIELD}
    Log    Username Field is Visible and Enabled to Enter Input
    Wait until element is visible    ${PASSWORD_FIELD}
    Wait until element is enabled    ${PASSWORD_FIELD}
    Page should contain element    ${PASSWORD_FIELD}
    Log    Username Field is Visible and Enabled to Enter Input