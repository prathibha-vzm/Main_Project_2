*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/forgot_password_page.robot
Resource    ../pages/forgot_password_negative.robot
Resource    ../keywords/login_page_keywords.robot


*** Keywords ***
Verify Forgot Password link functionality
     [Documentation]    This Test Verifies the Forgot Password Link and Reset Password
     Launch Browser
     Validate Title of Home Page
     Click On Forgot Password Link
     Enter Username on Forgot Password Page
     Click On Reset Password
     Print the Success Message for Forgot Password

Verify Forgot Password link functionality Negative
     Launch Browser
     Validate URL
     Validate Title of Home Page
     Click On Forgot Password Link Negative
     Enter Username on Forgot Password Page Negative
     Click On Cancel Negative
     Print the Success Message for Forgot Password Negative