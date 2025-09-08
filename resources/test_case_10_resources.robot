*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/claim_page.robot
Resource    ../pages/admin_page.robot

*** Keywords ***
Initiate a claim request
    [Documentation]    This Test Claim for Amount Request and Validate the Requests Presence
    Launch Browser
    Validate Title of Home Page
    ${VALID_USERNAME}    ${VALID_PASSWORD}=    Read Credentials
    Enter Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click On Login Button
    Dashboard Element Validation
    Click Claim On Menu
    Create Claim Request Event
    Create Claim Request Currency
    Create Claim Request Remarks
    Handle Claims Error Message
    Click On Create Button
    Click on Submit Again
    ${REFERENCE_NUMBER}=    Return Reference ID
    Click on My_Claims
    Find the Claim Request    ${REFERENCE_NUMBER}