*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/my_info_variables.robot
Documentation    This Page Keywords validates the elements in My_info Page is Visible and Clickable

*** Keywords ***
Click On My Info
    [Documentation]    This Keyword Validates the Element Visibilty and Click on it
    ${MY_INFO_STATUS}    Run keyword and return status    Wait until element is visible    ${MY_INFO}
    IF    ${MY_INFO_STATUS}
        Click element    ${MY_INFO}
        Log    Clicked on My_INFO
    ELSE
        Log    My_Info Not FOund
    END

Validate Visibility and Clickability of Menu Items
    [Documentation]    This Keyword Verifies the Visibility and Clickability of the Elements in My_Info Page and Print their Titles for Validation.
    @{MENU_ITEMS}    Create list    Personal Details    Contact Details    Emergency Contacts    Dependents    Immigration    Job    Salary    Report-to    Qualifications    Memberships

    FOR    ${ITEM}    IN    @{MENU_ITEMS}
       ${MENU_LOCATOR}=    Set variable    xpath=//a[text()='${ITEM}']
       Wait until element is visible    ${MENU_LOCATOR}
       Wait until element is enabled    ${MENU_LOCATOR}
       Click element    ${MENU_LOCATOR}
       Wait until element is visible    ${TITLE}
       ${TITLE_TEXT}=    Get text    ${TITLE}
       Log    The Page Title is: ${TITLE_TEXT}
    END


