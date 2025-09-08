*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/leave_page.robot
Resource    ../pages/admin_page.robot

*** Keywords ***
Assign leave to an employee and verify assignment
    [Documentation]    This Test Assign Leave and Validate the Assigned Leave
    Launch Browser
    Validate Title of Home Page
    ${VALID_USERNAME}    ${VALID_PASSWORD}=    Read Credentials
    Enter Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click On Login Button
    Dashboard Element Validation
    Click On Leave in the Menu
    Click On Assign Leave
    Click And Enter Employee Name
    ${EMPLOYEE_TEXT}=    Read Employee Name
    Select Leave Type
    Select From Date
    Select To Date
    Select Duration of Leave
    Enter Comments in Text Area
    Error Message in Leave Form
    Click On Assign Button
    Validate Success Message
    Click on My Leave
    Find the Record    ${EMPLOYEE_TEXT}