*** Settings ***
Resource    ../variables/login_page_variables.robot
Resource    ../variables/dashboard_page_variables.robot
Resource    ../variables/admin_page_variables.robot
Resource    ../pages/login_page.robot
Resource    ../pages/admin_page.robot
Resource    ../pages/dashboard_page.robot
Resource    ../keywords/login_page_keywords.robot


*** keywords ***
Create a new user and validate login
    [Documentation]    This Test Verifies the New User Created and Logged In Successfully
    Validate URL
    Validate Title of Home Page
    ${VALID_USERNAME}    ${VALID_PASSWORD}=    Read Credentials
    Enter Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click On Login Button
    Dashboard Element Validation
    Click On Admin Menu And Print Menu page Title
    Click On Add Button
    Click And Select Admin In User Role
    Click And Enter Employee Name
    Select Status
    Enter Username
    Enter Password
    Enter Confirm Password
    Locate And Handle Error Message
    Check Fields Are Filled
    Logout Functionality
    Enter New Credentials    ${NEW_USERNAME}    ${PASSWORD}
    Click On Login Button
    Dashboard Element Validation


