*** Settings ***
Resource    ../variables/login_page_variables.robot
Resource    ../variables/dashboard_page_variables.robot
Resource    ../pages/login_page.robot


*** Keywords ***
Verify Visibility and Clickability of Main Menu Items after Login
    [Documentation]    This test verifies login functionality and validates that all main menu items are visible, clickable, and open their respective pages before logging out.
    Launch Browser
    Validate Title of Home Page
    ${VALID_USERNAME}    ${VALID_PASSWORD}=    Read Credentials
    Enter Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click On Login Button
    Dashboard Element Validation
    Validate Menu Item
    Click On Logout