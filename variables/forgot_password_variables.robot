*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FORGOT_LINK_LOCATOR}    xpath=//p[@class="oxd-text oxd-text--p orangehrm-login-forgot-header"]
${USERNAME_FORGOT_INPUT}    xpath=//input[@placeholder="Username"]
${SUBMIT}    xpath=//button[@type="submit"]
${CANCEL_BUTTON}    xpath=//button[@type="button"]
${SUCCESSFUL_MESSAGE}    xpath=//h6[@class="oxd-text oxd-text--h6 orangehrm-forgot-password-title"]
${EXPECTED_MESSAGE}    Reset Password link sent successfully