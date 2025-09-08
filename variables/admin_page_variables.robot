*** Variables ***
${ADD_ICON}    xpath=//i[@class='oxd-icon bi-plus oxd-button-icon']
${USER_ROLE_DROP_DOWN}    xpath=(//div[@class='oxd-select-text oxd-select-text--active'])[1]
${USER_ROLE_DROP_DOWN_FOCUS}    xpath=//div[@class='oxd-select-text oxd-select-text--focus']
${LIST_BOX_USER_ROLE}    xpath=//div[@role='listbox'][1]
${EMPLOYEE_NAME_LOCATOR}    xpath=//input[@placeholder='Type for hints...']
${EMPLOYEE_NAME}    a
${LIST_BOX}    xpath=//div[@role='listbox']
${EMPLOYEE_NAME_AUTO_COMPLETE}    xpath=(//div[@role="listbox"]//div)[1]
${ERROR_MESSAGE}    xpath=//span[@class="oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message"]
${STATUS_LOCATOR}    xpath=(//div[@class='oxd-select-text oxd-select-text--active'])[2]
${USERNAME_LOCATOR}    xpath=(//input[@class="oxd-input oxd-input--active"])[2]
${NEW_USERNAME}     wednesday
${PASSWORD_LOCATOR}    xpath=(//input[@type='password'])[1]
${PASSWORD}     wednesday123
${CONFIRM_PASSWORD}    xpath=(//input[@type="password"])[2]
${SUBMIT_BUTTON}    xpath=//button[@type='submit']
${SUBMIT_MESSAGE}    xpath=//div[@id="oxd-toaster_1"]
${SEARCH_NEW_USER}    xpath=//div[@class="oxd-table-cell oxd-padding-cell"]//div[text()='wednesday']
${RECORDS_FOUND}    xpath=(//span[@class="oxd-text oxd-text--span"])[1]
${ADMIN_VARIABLE}    xpath=//span[text()='Admin']
${USER_MANAGEMENT}    xpath=//span[text()='User Management ']
${NEW_USERNAME_LOCATOR}    xpath=//input[@name="username"]
${NEW_PASSWORD_LOCATOR}    xpath=//input[@name="password"]