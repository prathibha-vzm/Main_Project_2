*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/dashboard_page_variables.robot
Resource    ../variables/admin_page_variables.robot
Documentation    This Page has multiple keywords that helps to add new user and validate it by logging in Using the credentials

*** Keywords ***
Click On Admin Menu And Print Menu page Title
    [Documentation]    This Keyword Verifies the visibility of the element and Click on It, Then print the Page Title and Capture Screenshots
    ${ADMIN_LOCATOR_STATUS}=    Run keyword and return status    Wait until element is visible    ${ADMIN_LOCATOR}
    Wait until element is enabled    ${ADMIN_LOCATOR}
    Page Should contain Element    ${ADMIN_LOCATOR}
    IF    ${ADMIN_LOCATOR_STATUS}
        Click Element    ${ADMIN_LOCATOR}
        Log    Clicked Admin On Menu
    ELSE
        Log    No Admin Menu Present
    END
    ${MENU_PAGE_TITLE_STATUS}=    Run keyword and return status    Wait until element is visible    ${MENU_PAGE_TITLE}
    IF    ${MENU_PAGE_TITLE_STATUS}
        ${LOCATOR_TEXT}=    Get text    ${ADMIN_LOCATOR}
        ${MENU_PAGE_TITLE_TEXT}=    Get text    ${MENU_PAGE_TITLE}
        Log     ${LOCATOR_TEXT} Page Title is: ${MENU_PAGE_TITLE_TEXT}
    ELSE
        Log    No Menu Page Title Found
    END
    Capture page screenshot    screenshots/Add_User_Admin_Page.png

Click On Add Button
    [Documentation]    This Keyword Clicks on the Add Button Present in the Admin Page
    ${ADD_ICON_STATUS}=    Run keyword and return status    Wait until element is visible    ${ADD_ICON}
    IF    ${ADD_ICON_STATUS}
        Click element    ${ADD_ICON}
        Log    Clicked on Add User Button
    ELSE
        Log    No Add User Icon Button Found
    END

Click And Select Admin In User Role
    [Documentation]    This Keyword Selects the Option in User Role List Box
    ${USER_ROLE_STATUS}=    Run keyword and return status    Wait until element is visible    ${USER_ROLE_DROP_DOWN}
    IF    ${USER_ROLE_STATUS}
        Click element    ${USER_ROLE_DROP_DOWN}
        Wait until element is visible    ${USER_ROLE_DROP_DOWN_FOCUS}
        Click element    ${LIST_BOX_USER_ROLE}
        Log    Clicked on List Box And Selected Admin from the Option
    ELSE
        Log    User_Role Element Not Found
        Log    No DropDown Element Found
    END
    Capture page screenshot    screenshots/User_Role_Selection.png

Click And Enter Employee Name
    [Documentation]    This Keyword Selects the Employee name From the List box
    ${EMPLOYEE_NAME_LOCATOR_STATUS}=    Run keyword and return status    Wait until element is visible    ${EMPLOYEE_NAME_LOCATOR}
    IF    ${EMPLOYEE_NAME_LOCATOR_STATUS}
        Click element    ${EMPLOYEE_NAME_LOCATOR}
        IF    '${EMPLOYEE_NAME}' != ''
            Clear element text    ${EMPLOYEE_NAME_LOCATOR}
            Input text    ${EMPLOYEE_NAME_LOCATOR}    ${EMPLOYEE_NAME}
            Sleep    5s
            Wait until element is visible    ${LIST_BOX}
            Click element    ${EMPLOYEE_NAME_AUTO_COMPLETE}
            Log    Entered Employee Name
        ELSE
            Log    No Employee Name Present
        END
    ELSE
        Log    Employee Name Locator Not Found
    END
    Capture page screenshot    screenshots/Entering_Employee_Name.png

Read Employee Name
    [Documentation]    This Keyword Reads the value from the Employee Name Field and Return it for Validation
    ${EMPLOYEE_NAME_LOCATOR_STATUS}=    Run keyword and return status    Wait until element is visible    ${EMPLOYEE_NAME_LOCATOR}
    ${EMPLOYEE_TEXT}=    Get value    ${EMPLOYEE_NAME_LOCATOR}
    RETURN    ${EMPLOYEE_TEXT}

Select Status
    [Documentation]    This Keyword Selects the Satus of the Employee from List box
    ${STATUS_LOCATOR_STATUS}=    Run keyword and return status    Wait until element is visible    ${STATUS_LOCATOR}
    IF    ${STATUS_LOCATOR_STATUS}
        Click element    ${STATUS_LOCATOR}
        Sleep    5s
        Wait until element is visible    ${USER_ROLE_DROP_DOWN_FOCUS}
        Click element    ${LIST_BOX}
        Log    Entered Status
    ELSE
        Log    No Status Locator Found
    END

Enter Username
    [Documentation]    This Keyword Enter the Username in appropriate field after Validating it.
    ${USERNAME_LOCATOR_STATUS}=     Run keyword and return status    Wait until element is visible    ${USERNAME_LOCATOR}
    IF    ${USERNAME_LOCATOR_STATUS}
        Input text    ${USERNAME_LOCATOR}   ${NEW_USERNAME}
        Log    Entered Username: ${NEW_USERNAME}
    ELSE
        Log    Username Field Not Found
    END

Enter Password
    [Documentation]    This Keyword Enter the Password in appropriate field after Validating it.
    ${PASSWORD_LOCATOR_STATUS}=     Run keyword and return status    Wait until element is visible    ${PASSWORD_LOCATOR}
    IF    ${PASSWORD_LOCATOR_STATUS}
        Input text    ${PASSWORD_LOCATOR}   ${PASSWORD}
        Log    Entered Password: ${PASSWORD}
    ELSE
        Log    Password Field Not Found
    END

Enter Confirm Password
    [Documentation]    This Keyword Enter the password in appropriate field after Validating it.
    ${CONFIRM_PASSWORD_STATUS}=    Run keyword and return status    Wait until element is visible    ${CONFIRM_PASSWORD}
    IF    ${CONFIRM_PASSWORD_STATUS}
        Input text    ${CONFIRM_PASSWORD}   ${PASSWORD}
        Log    Entered Confirm Password: ${PASSWORD}
    ELSE
        Log    Confirm Password Element Not Found
        Log    Password Value is Empty
    END

Locate And Handle Error Message
    [Documentation]    This Keyword Locates the Error Message That appears when the Field is empty or wrong input is given.
    ${ERROR_MESSAGE_STATUS}=    Run keyword and return status    Wait until element is visible    ${ERROR_MESSAGE}
    IF    ${ERROR_MESSAGE_STATUS}
        @{ERROR_LIST}=    Get WebElements    ${ERROR_MESSAGE}
        FOR    ${ERROR}    IN    @{ERROR_TEXT}
           ${ERROR_TEXT}=    Get text    S{ERROR}
           Log  Error Message: ${ERROR_TEXT}
        END
    ELSE
        Log    No Error Message
    END

Check Fields Are Filled
    [Documentation]    This Keyword Checks all the Fields are filled before clicking on Submit Button
    ${USER_ROLE_DROP_DOWN_STATUS}=    Run keyword and return status    Element text should not be    ${USER_ROLE_DROP_DOWN}    --Select--
    ${EMPLOYEE_NAME_LOCATOR_STATUS}=    Run keyword and return status    Element text should not be    ${EMPLOYEE_NAME_LOCATOR}    Type for hints...
    ${STATUS_LOCATOR_STATUS}=    Run keyword and return status    Element text should not be    ${STATUS_LOCATOR}    --Select--
    ${USERNAME_TEXT}=    Get value    ${USERNAME_LOCATOR}
    ${USERNAME_STATUS}=    Run keyword and return status    Should not be empty    ${USERNAME_TEXT}
    ${PASSWORD_TEXT}=    Get value    ${PASSWORD_LOCATOR}
    ${PASSWORD_STATUS}=    Run keyword and return status    Should not be empty    ${PASSWORD_TEXT}
    IF    ${USER_ROLE_DROP_DOWN_STATUS} and ${EMPLOYEE_NAME_LOCATOR_STATUS} and ${STATUS_LOCATOR_STATUS} and ${USERNAME_STATUS} and ${PASSWORD_STATUS}
        Click On Submit
    ELSE
        Log    Please Fill all The Fields
    END


Click On Submit
    [Documentation]    This Keyword Checks the Clickability of the Submit Button and Click on It
    ${SUBMIT_BUTTON_STATUS}=    Run keyword and return status    Wait until element is enabled    ${SUBMIT_BUTTON}
    IF    ${SUBMIT_BUTTON_STATUS}
        Click element    ${SUBMIT_BUTTON}
        Log    Clicked On: ${SUBMIT_BUTTON}
    ELSE
        Log    Error In the Form
        Locate And Handle Error Message
    END

Enter New Credentials
    [Documentation]    This Keyword Enters the New Credentials Created afer checking the visibility of the fields.
    [Arguments]    ${NEW_USERNAME}    ${PASSWORD}
    ${NEW_USERNAME_LOCATOR_STATUS}    Run keyword and return status    Wait until element is visible    ${NEW_USERNAME_LOCATOR}
    IF    ${NEW_USERNAME_LOCATOR_STATUS}
        Input text    ${NEW_USERNAME_LOCATOR}    ${NEW_USERNAME}
        Log    Entered Username
    ELSE
        Log    Username Field Not found
    END
    ${NEW_PASSWORD_LOCATOR_STATUS}    Run keyword and return status    Wait until element is visible    ${NEW_PASSWORD_LOCATOR}
    IF    ${NEW_PASSWORD_LOCATOR_STATUS}
        Input text    ${NEW_PASSWORD_LOCATOR}    ${PASSWORD}
        Log    Entered Password
    ELSE
        Log    Password Not Found
    END

