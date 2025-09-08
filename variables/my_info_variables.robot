*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MY_INFO}    xpath=//span[text()='My Info']
${PERSONAL_DETAILS_LOCATOR}    xpath=//a[text()='Personal Details']
${TITLE}   xpath=//h6[@class="oxd-text oxd-text--h6 orangehrm-main-title"]
