*** Settings ***
Library    Browser

*** Variables ***
${APP_URL}    https://magento.softwaretestingboard.com/
${BROWSER}    chromium

*** Keywords ***
Launch Magento Application
    [Documentation]    Launches the Magento Application into the desired browser for test execution
    [Arguments]    ${browser}    ${url}
    New Browser    ${browser}    false
    New Context
    New Page    ${url}
    Set Browser Timeout    scope=Global    timeout=30secs

Verify Page Title
    [Documentation]    Keyword to Verify the Page Title with the expected title
    [Arguments]    ${expected_title}
    ${actual_title}=    Get Title
    Log    Current page title is: ${actual_title}
    Should Be Equal    ${actual_title}    ${expected_title}    Actual Page title is: ${actual_title} and expected page title is: ${expected_title}
