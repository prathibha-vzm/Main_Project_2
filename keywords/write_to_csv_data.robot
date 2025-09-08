*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/login_page_variables.robot
Library    OperatingSystem


*** Keywords ***
Write To Csv
    [Documentation]    This Keyword Helps to Write the Result produced in Login Test into CSV File
    [Arguments]    ${USERNAME}    ${PASSWORD}    ${TEST_RESULT}
    ${TEST_REPORT}=    Set Variable    ${USERNAME},${PASSWORD},${TEST_RESULT}
    Append To File    data/test_report.csv    ${TEST_REPORT}\n