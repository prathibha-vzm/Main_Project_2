*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/admin_page_variables.robot
Resource    ../variables/dashboard_page_variables.robot

*** Keywords ***
Select Admin
    [Documentation]    This Keyword helps to Click on Admin in the Menu and User Management In its Page
    Wait until element is visible    ${ADMIN_LOCATOR}
    ${ADMIN_TEXT}=    Get text    ${ADMIN_LOCATOR}
    IF    '${ADMIN_TEXT}'=='Admin'
        Log    Entered in ${ADMIN_TEXT} Page
        Wait until element is visible    ${USER_MANAGEMENT}
        Click element    ${USER_MANAGEMENT}
    ELSE
        Log    Admin Not Found
    END


Search for the newly created user
    [Documentation]    This Keyword Verifies the New Username presence in the User Management Section
    ${SEARCH_NEW_USER_STATUS}=    Run keyword and return status    Wait until element is visible    ${SEARCH_NEW_USER}
    IF    ${SEARCH_NEW_USER_STATUS}
        Scroll element into view    ${SEARCH_NEW_USER}
        ${TEXT}=    Get text    ${SEARCH_NEW_USER}
        Log    New User :${TEXT} is Found in User Management Section
    ELSE
        Log    No New User is Found
    END
    Capture page screenshot    screenshots/New_User_Record.png
