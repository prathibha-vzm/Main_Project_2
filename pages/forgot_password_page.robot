*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/forgot_password_variables.robot
Resource    ../variables/admin_page_variables.robot

*** Keywords ***
Click On Forgot Password Link
     [Documentation]    This Keyword Clicks oN The Forgot password Link in Login Page
     ${FORGOT_LINK_LOCATOR_STATUS}     Run keyword and return status    Wait until element is visible    ${FORGOT_LINK_LOCATOR}
     IF    ${FORGOT_LINK_LOCATOR_STATUS}
         Wait until element is enabled    ${FORGOT_LINK_LOCATOR}
         Click element    ${FORGOT_LINK_LOCATOR}
         Log    Clicked on Forgot Password Link
     ELSE
         Log    Forgot Password Link Not Found
     END

Enter Username on Forgot Password Page
     [Documentation]    This Keyword Enter the Username in the appropriate field
     ${USERNAME_FORGOT_LINK_STATUS}    Run keyword and return status    Wait until element is visible    ${USERNAME_FORGOT_INPUT}
     IF    ${USERNAME_FORGOT_LINK_STATUS}
         Wait until element is enabled    ${USERNAME_FORGOT_INPUT}
         Input text    ${USERNAME_FORGOT_INPUT}    ${NEW_USERNAME}
         Log    Entered : ${NEW_USERNAME}
     ELSE
         Log    Username Field Not Found
     END

Click On Reset Password
     [Documentation]    This Keyword Clicks oN The Submit Button
    ${SUBMIT_STATUS}    Run keyword and return status    Wait until element is visible    ${SUBMIT}
    IF    ${SUBMIT_STATUS}
        Wait until element is enabled    ${SUBMIT}
        Click button    ${SUBMIT}
        Log    Clicked On Reset Password
    ELSE
        Log  No Reset Password Button Found
    END

Print the Success Message for Forgot Password
     [Documentation]    This Keyword Vaidates the Successful Message Generated after the Reset Password is Clicked
    ${SUCCESSFUL_MESSAGE_STATUS}    Run keyword and return status    Wait until element is visible    ${SUCCESSFUL_MESSAGE}
    IF    ${SUCCESSFUL_MESSAGE_STATUS}
        ${ACTUAL_MESSAGE}=    Get text    ${SUCCESSFUL_MESSAGE}
        Log    ACTUAL MESSAGE: ${ACTUAL_MESSAGE} \nEXPECTED MESSAGE: ${EXPECTED_MESSAGE}
        Should match    ${EXPECTED_MESSAGE}   ${ACTUAL_MESSAGE}
    ELSE
        Log    Message Not FOund
    END
    Capture page screenshot    screenshots/Forgot_Password_Message.png
