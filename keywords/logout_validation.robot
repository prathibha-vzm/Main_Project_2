*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/dashboard_page_variables.robot

*** Keywords ***
Validate Logout
    [Documentation]    This Keyword Validates the Logout Functionality, by checking the current page url after logged out
    Wait Until Element Is Visible    ${LOGIN_ELEMENT}
    ${LOGIN_TEXT}    Get Text    ${LOGIN_ELEMENT}
    Log    This is ${LOGIN_TEXT} Page
    ${CURRENT_URL}=    Get Location
    Log    Current Page URL is: ${CURRENT_URL}
    Should Contain    ${CURRENT_URL}    ${URL}