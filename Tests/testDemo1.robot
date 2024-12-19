*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Test Cases ***
Validate UnSuccessful Login
    Open the Browser with the Mortgage payment url
    Fill the Login Form
    Wait until it checks and display error message
    Verify error message is correct

*** Keywords ***
Open the Browser with the Mortgage payment url
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    Chrome
    Maximize Browser Window

Fill the Login Form
    Input Text    id:username    rahulshettyacademy
    Input Password    id:password    12345678
    Click Button    signInBtn

Wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}
    # Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.