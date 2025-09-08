*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CLAIM}    xpath=//a[@href="/web/index.php/claim/viewClaimModule"]
${SUBMIT_CLAIM}    xpath=//a[text()='Submit Claim']
${SELECTION}    xpath=(//div[@class='oxd-select-dropdown'])[2]
${EVENT}    xpath=(//div[@class="oxd-select-text-input"])[1]
${EVENT_ARROW}    xpath=//i[@class="oxd-icon bi-caret-down-fill oxd-select-text--arrow"]
${EVENT_ARROW_UP}    xpath=//i[@class="oxd-icon bi-caret-up-fill oxd-select-text--arrow"]
${CURRENCY}    xpath=(//div[@class="oxd-select-text-input"])[2]
${REMARKS}    //textarea[@class="oxd-textarea oxd-textarea--active oxd-textarea--resize-vertical"]
${ENTER_REMARKS}    Claiming for Accomadation
${CREATE_BUTTON}    xpath=//button[text()=' Create ']
${CLAIM_ERROR_MESSAGE}    xpath=//span[@class="oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message"]
${REFERENCE_ID}    xpath=(//input[@class="oxd-input oxd-input--active"])[2]
${REFERENCE_LABEL}    xpath=//label[text()='Reference Id']
${SUBMIT_CLAIM_BUTTON}    xpath=//button[text()=' Submit ']
${MY_CLAIMS}    xpath=//a[text()='My Claims']
${RECORDS_ROW}    xpath=//div[@class='oxd-table-row oxd-table-row--with-border']/div[1]