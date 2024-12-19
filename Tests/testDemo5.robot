*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    DataDriver    file=/Users/mr.heart_2711/Desktop/RobotFramework/Tests/resources/data.csv    encoding=utf_8    dialect=unix
Library    ../.venv/lib/python3.12/site-packages/robot/libraries/Collections.py
Test Teardown    Close Browser
Test Template    Validate UnSuccessful Login

*** Variables ***
${Error_Message_Login}    css:.alert-danger


*** Test Cases ***
Login with user ${username} and password ${password}    Default    data

*** Keywords ***
Validate UnSuccessful Login
    [Arguments]    ${username}    ${password}
    Open the Browser with the Mortgage payment url
    Fill the Login Form    ${username}    ${password}
    Wait until it checks and display error message
    Verify error message is correct

Open the Browser with the Mortgage payment url
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    Chrome
    Maximize Browser Window

Fill the Login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn

Wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.
    Capture Page Screenshot