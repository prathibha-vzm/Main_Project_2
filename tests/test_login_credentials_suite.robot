*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/login_page_keywords.robot
Library    ../utility/read_csv_data.py
Resource    ../keywords/write_to_csv_data.robot
Resource    ../variables/login_page_variables.robot
Resource    ../variables/dashboard_page_variables.robot
Resource    ../pages/login_page.robot
Resource    ../pages/admin_page.robot
Resource    ../pages/login_error_message.robot
Resource    ../keywords/login_fields_visibility.robot
Resource    ../pages/menu_item_dashboard_page.robot
Resource    ../resources/test_case_1_resources.robot
Resource    ../resources/test_case_2_resources.robot
Resource    ../resources/test_case_3_resources.robot
Resource    ../resources/test_case_4_resources.robot
Resource    ../resources/test_case_5_resources.robot
Resource    ../resources/test_case_6_resources.robot
Resource    ../resources/test_case_7_resources.robot
Resource    ../resources/test_case_8_resources.robot
Resource    ../resources/test_case_9_resources.robot
Resource    ../resources/test_case_10_resources.robot
Library    Collections
#Test Template     Validate Login Functionality Using Multiple Sets Of Credentials
Suite Setup    Launch Browser
Suite Teardown    Close The Browser
Documentation    This Test Verifies the Multiple Sets of Login Flow and Validate Error Message For Invalid User

*** Test Cases ***
Test Case 1
    [Documentation]    These Test Verifies the Valid User to Login and Logout, When Invalid User Login then Error Message is Thrown.
    Validate Login Functionality Using Multiple Sets Of Credentials

Test Case 2
    [Documentation]    This Test  Verify that the Home URL is Accessible
    Verify that the Home URL is Accessible

Test Case 3
    [Documentation]    This Test Validates the Username and Password Input Field are Visible and Enabled
    Validate Presence of Login Fields

Test Case 4
    [Documentation]    This test verifies login functionality and validates that all main menu items are visible, clickable, and open their respective pages before logging out.
    Verify Visibility and Clickability of Main Menu Items after Login

Test Case 5
    [Documentation]    This Test Verifies the New User Created and Logged In Successfully
    Create a new user and validate login

Test Case 6
    [Documentation]    This Test Case Validate the Newly Created User Presence in User List
    Validate presence of the newly created user in the admin user list

Test Case 7
     [Documentation]    This Test Verifies the Forgot Password Link and Reset Password
     Verify Forgot Password link functionality

Test Case 8
     [Documentation]    This Test Verofies the My Info in Menu
     Validate the presence of menu items under My Info

Test Case 9
    [Documentation]    This Test Apply for Leave and Validate the Assigned Leave
    Assign leave to an employee and verify assignment

Test Case 10
    [Documentation]    This Test Claim for Amount Request and Validate the Requests Presence
    Initiate a claim request

