*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}    chrome
${LOGIN_ELEMENT}    xpath=//h5[text()='Login']
${EXPECTED_TITLE}    OrangeHRM
${USERNAME_FIELD}    name=username
${PASSWORD_FIELD}    name=password
${LOGIN_BUTTON}    xpath=//button[@type='submit']
${ERROR_MESSAGE}    xpath=//p[text()='Invalid credentials']


