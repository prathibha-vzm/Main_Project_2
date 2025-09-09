# Automation Testing of HR Management Web Application
# Project Architecture
<pre><code>
HR_project/
│── data/                     # Test data and generated reports
│   ├── test_data.csv          # Login credentials and test input
│   ├── test_data.ods          # Original test data in ODS format
│   ├── test_report.csv        # Test execution report (CSV format)
│   └── convert_ods_csv.py     # Script to convert ODS → CSV
│
│── keywords/                 # Custom reusable keywords
│   ├── login_fields_visibility.robot   # This Keyword Validate the visiblity and clickability of Username and Password Fields
│   ├── login_page_keywords.robot       # This Test Verifies the Multiple Sets of Login Flow and Validate Error Message For Invalid User
│   ├── logout_validation.robot         # This Keyword Validates the Logout Functionality, by checking the current page url after logged out
│   ├── search_new_user.robot           # This Keyword Verifies the New Username presence in the User Management Section
│   ├── write_to_csv_data.robot         # This Keyword Helps to Write the Result produced in Login Test into CSV File
│
│── pages/                    # Page Object Model (POM) ,Custom reusable keywords
│   ├── admin_page.robot                # This Page has Multiple Keywords that helps to Add New User and validate it by logging in with new credentials
│   ├── claim_page.robot                # This Page has Multiple Keywords that create a claim and validate it by checking the record
│   ├── dashboard_page.robot            # This Page Keywords Validates the Logged In Username and Perform Logout
│   ├── forgot_password_page.robot      # This Page Keywords Validates Forgot Password Functionality
│   ├── leave_page.robot                # This Page Contains Keywords that Apply for Leave and Validate it presence in Leave Records
│   ├── login_page.robot                # This Page Keyword Locate the Username and Password Field and Enters the Value. Also Validate the Login Button and Click
│   ├── login_error_message.robot       # This Page Keyword Verifies The Error Message appears when Invalid User Login
│   ├── menu_item_dashboard_page.robot  # This Page Keywords validates the valid credentials login and Check All the Menu Items visibiity and Clickability
│   └── my_info_page.robot              # This Page Keywords validates the elements in My_info Page is Visible and Clickable
│
│── resources/                # Resources per test case
|                             # Contains all reusable keywords and page-specific resource files to perform the Test case run.  
|                             # Each test case imports the required resource file(s) to perform actions
│   ├── test_case_1_resources.robot
│   ├── test_case_2_resources.robot
│   ├── test_case_3_resources.robot
│   ├── ...
│   └── test_case_10_resources.robot
│
│── tests/                    # Main test suites
│   ├── test_orange_hrm_suite.robot
│
│── variables/                # Centralized variable files, Individual Variables File for Each Page or Module to ensure easy maintenance
│   ├── login_page_variables.robot
│   └── dashboard_page_variables.robot
│   ├── admin_page_variables.robot
│   ├── forgot_password_variables.robot
|   ├── my_info_variables.robot
│   └── leave_page_variables.robot
│   └── claim_variables.robot
│
│── utility/                  # To read CSV data
│   ├── read_csv_data.py
│
│── screenshots/              # Screenshots captured in test run
│
│── reports/                  # Auto-generated Robot Framework reports
│   ├── log.html
│   ├── report.html
│   └── output.xml
│
│── requirements.txt          # Dependencies
│── README.md                 # Project documentation
</code></pre>

# Test Suite Highlights
1. Login Validation with multiple credential sets (positive & negative).
2. Home Page Accessibility check.
3. Presence of Login Fields.
4. Main Menu Validation (Admin, PIM, Leave, Time, Recruitment, etc.).
5. User Creation & Login Verification.
6. Presence of Newly Created User in User List.
7. Forgot Password Flow.
8. My Info Section Validation (Personal Details, Contact Details, Emergency Contacts, etc.).
9. Leave Assignment to an employee.
10. Claim Request Initiation by an employee.
    
# Feature
* Robot Framework Testing with SeleniumLibrary - Automates web interactions such as clicking, typing, and form submissions.
* Data-Driven-Testing - Uses external CSV/ODS files to test multiple input scenarios (positive & negative).
* Object-Oriented Keyword Design – Reusable keywords are structured with object-oriented principles for modularity.
* Explicit Waits for UI Synchronization – Ensures stability by waiting for elements to be visible/clickable before actions.
* Structured Folder Organization – Separate folders for tests, pages, keywords, variables, utilities, and reports.
* Exception Handling – Improves test resilience and minimizes flaky test results.

# Why Robot Framework
* Readable, tabular syntax — test cases are simple to write and easy to maintain.
* Reusable keywords — promotes modular design and reduces duplication.
* SeleniumLibrary support — enables powerful web UI automation.
* Inbuilt waits & exception handling — improves test stability by automatically managing synchronization and handling errors gracefully.
* Auto-generated reports — report.html, log.html, and output.xml generated after each run.
* Step-by-step execution log — detailed logs at keyword level help identify exactly where a test failed and how to fix it.

# Usage
## To Install Dependencies
<pre><code>pip install -r requirements.txt</code></pre>
## To Create and Activate Virtual Environment
<pre><code>python -m venv HR_project</code>
<code>./HR_project/Scripts/activate</code></pre>
## To Run the Test in Cross Browser
###chrome
<pre><code> robot tests/ </code></pre>
###edge
<pre><code> robot --variable BROWSER:edge tests/ </code></pre>
