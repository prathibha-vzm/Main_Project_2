*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/my_info_page.robot

*** Keywords ***
Validate the presence of menu items under My Info
    [Documentation]    This Test Verofies the My Info in Menu
    Launch Browser
    Validate Title of Home Page
    ${VALID_USERNAME}    ${VALID_PASSWORD}=    Read Credentials
    Enter Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Click On Login Button
    Dashboard Element Validation
    Click On My Info
    Validate Visibility and Clickability of Menu Items