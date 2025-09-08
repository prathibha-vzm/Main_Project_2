*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/dashboard_page_variables.robot
Documentation    This Keyword Validates the Logged In Username and Perform Logout

*** Keywords ***
Dashboard Element
    [Documentation]    This Keyword Validate and Prints the Username Displayed in Dashboard.
    Wait Until Element Is Visible    ${USER_NAME}    5s
    Element Should Be Visible    ${USER_NAME}
    ${NAME}=    Get Text    ${USER_NAME}
    Log    ${NAME} : is Logged In

Logout Functionality
    [Documentation]    This Keyword Validates the Logout Elements and Perform Logout
    Wait Until Element Is Visible    ${DOWN_ARROW}    5s
    Element Should Be Enabled    ${DOWN_ARROW}
    Click Element    ${DOWN_ARROW}
    Wait Until Element Is Visible    ${LOGOUT}
    Element Should Be Enabled    ${LOGOUT}
    Click Element    ${LOGOUT}
