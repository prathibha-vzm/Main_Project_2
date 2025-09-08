*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/search_new_user.robot
Resource    ../pages/admin_page.robot
Resource    ../pages/login_page.robot
Resource    ../keywords/login_page_keywords.robot


*** Keywords ***
Validate presence of the newly created user in the admin user list
    [Documentation]    This Test Case Validate the Newly Created User Presence in User List
    Launch Browser
    Validate Title of Home Page
    ${VALID_USERNAME}    ${VALID_PASSWORD}=    Read Credentials
    Enter Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click On Login Button
    Dashboard Element Validation
    Click On Admin Menu And Print Menu page Title
    Search for the newly created user
    Logout Functionality

