*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LEAVE_LOCATOR}    xpath=//span[text()='Leave']
${ASSIGN_LEAVE_LOCATOR}    xpath=//a[text()='Assign Leave']
${LEAVE_TYPE}    xpath=//div[@class="oxd-select-text oxd-select-text--active"]
${FROM_DATE}    xpath=(//input[@class="oxd-input oxd-input--active"])[2]
${FROM_DATE_INPUT}    2025-09-07
${TO_DATE}     xpath=(//input[@class="oxd-input oxd-input--active"])[3]
${TO_DATE_INPUT}    2026-02-01
${PARTIAL_DAYS}    xpath=(//div[@class="oxd-select-text oxd-select-text--active"])[2]
${DURATION}    xpath=(//div[@class="oxd-select-text oxd-select-text--active"])[3]
${LIST_BOX_DURATION}    xpath=//div[@role='listbox'][0]
${TEXT_AREA}    xpath=//div//textarea[@class="oxd-textarea oxd-textarea--active oxd-textarea--resize-vertical"]
${COMMENT}    Due To Personal Reason, I would like to take leave for 3 days.
${ERROR_MESSAGE_LEAVE}    xpath=//span[@class="oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message"]
${ASSIGN_BUTTON}    xpath=//button[text()=' Assign ']
${NAME_OF_LEAVE}    xpath=//div[@role='listbox'][1]
${SUCCESS_MESSAGE_LEAVE}    xpath=//p[@class="oxd-text oxd-text--p oxd-text--subtitle-2"]
${OK_BUTTON}    xpath=//button[text()=' Ok ']
${CANCEL_BUTTON}    xpath=//button[text()=' Cancel ']
${REPORTS_LOCATOR}    xpath= //span[text()='Reports ']
${MY_LEAVE_ENTITLEMENTS}    xpath=//a[text()='Leave Entitlements and Usage Report']
${GENERATE_BUTTON}    xpath=//button[text()=' Generate ']
${RECORDS_LOCATOR}    xpath=//div[@class="rgRow"]
