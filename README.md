<pre><code>
HR_project/
│── data/                     # Test data and generated reports
│   ├── test_data.csv          # Login credentials and test input
│   ├── test_data.ods          # Original test data in ODS format
│   ├── test_report.csv        # Test execution report (CSV format)
│   └── convert_ods_csv.py     # Script to convert ODS → CSV
│
│── keywords/                 # Custom reusable keywords
│   ├── login_fields_visibility.robot
│   ├── login_page_keywords.robot
│   ├── logout_validation.robot
│   ├── search_new_user.robot
│   ├── write_to_csv_data.robot
│
│── pages/                    # Page Object Model (POM) layer
│   ├── admin_page.robot
│   ├── claim_page.robot
│   ├── dashboard_page.robot
│   ├── forgot_password_page.robot
│   ├── forgot_password_negative.robot
│   ├── leave_page.robot
│   ├── login_page.robot
│   ├── login_error_message.robot
│   ├── menu_item_dashboard_page.robot
│   └── my_info_page.robot
│
│── resources/                # Resources per test case
│   ├── test_case_1_resources.robot
│   ├── test_case_2_resources.robot
│   ├── test_case_3_resources.robot
│   ├── ...
│   └── test_case_10_resources.robot
│
│── tests/                    # Main test suites
│   ├── test_orange_hrm_suite.robot
│
│── variables/                # Centralized variable files
│   ├── login_page_variables.robot
│   └── dashboard_page_variables.robot
│   ├── admin_page_variables.robot
│   ├── forgot_password_variables.robot
|   ├── my_info_variables.robot
│   └── leave_page_variables.robot
│   └── claim_variables.robot
│
│── utility/                  # Helper scripts and utilities
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
