*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/dashboard_page_variables.robot
Resource    ../utility/read_csv_data.py

*** Keywords ***
Read Credentials
    [Documentation]    This Keyword Reads the Keyword created in selenium to read the CSV file
    ${VALID_USERNAME}=      Read Valid Username
    ${VALID_PASSWORD}=      Read Valid Password
    RETURN    ${VALID_USERNAME}    ${VALID_PASSWORD}

Validate Menu Item
    [Documentation]    This Keyword Checks the below Items Presence, Clickability and Its Page Title in the Menu
    @{LOCATORS}   Create list    ${ADMIN_LOCATOR}    ${PIM_LOCATOR}    ${LEAVE_LOCATOR}    ${TIME_LOCATOR}    ${RECRUITMENT_LOCATOR}    ${MY_INFO_LOCATOR}    ${PERFORMANCE_LOCATOR}    ${DASHBOARD_LOCATOR}
    FOR    ${LOCATOR}    IN    @{LOCATORS}
        Wait until element is visible    ${LOCATOR}
        Wait until element is enabled    ${LOCATOR}
        Page Should contain Element    ${LOCATOR}
        Click Element    ${LOCATOR}
        Wait until element is visible    ${MENU_PAGE_TITLE}
        ${LOCATOR_TEXT}=    Get text    ${LOCATOR}
        ${MENU_PAGE_TITLE_TEXT}=    Get text    ${MENU_PAGE_TITLE}
        Log     ${LOCATOR_TEXT} Page Title is: ${MENU_PAGE_TITLE_TEXT}
    END



