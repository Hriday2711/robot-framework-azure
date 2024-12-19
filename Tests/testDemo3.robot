*** Settings ***
Documentation    To validate the Login form
Resource    resource.robot
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup    Open the Browser with the Mortgage payment url
Test Teardown    Close Browser Session



*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}    css:.nav-link

*** Test Cases ***
Validate Child Window Functionality
    Select the link of Child Window
    Verify the user is Switched to Child Window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email

*** Keywords ***
Select the link of Child Window
    Click Element    css:.blinkingText
    Sleep    5

Verify the user is Switched to Child Window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the Email id in the Child Window
    ${text}=    Get Text    css:.red
    @{words}=    Split String    ${text}    at
    ${text_split}=    Get From List    ${words}    1
    @{words_2}=    Split String    ${text_split}
    ${email}=    Get From List    ${words_2}   0
    Set Global Variable    ${email}

Switch to Parent window and enter the Email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}
    Capture Page Screenshot