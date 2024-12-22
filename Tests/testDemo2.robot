*** Settings ***
Documentation    To validate the Login form
Resource    resource.robot
Library    SeleniumLibrary
Library    Collections
Test Setup    Open the Browser with the Mortgage payment url
Test Teardown    Close Browser Session


*** Variables ***
${Error_Message_Login}    css:.alert-danger
${Shop_page_load}    css:.nav-link

*** Test Cases ***
# TC1 Validate UnSuccessful Login
#     Fill the Login Form and Select Sign-In Button    ${user_name}    ${invalid_password}
#     wait until Element is located in the page    ${Error_Message_Login}
#     Verify error message is correct

# TC2 Validate Cards display in the Shopping page
#     Fill the Login Form and Select Sign-In Button    ${user_name}    ${correct_password}
#     wait until Element is located in the page    ${Shop_page_load}
#     Verify Card titles in the Shop Page
#     Select the Card    Blackberry

TC3 Select the Form and navigate to the Child Window
    Fill the Login Details and select the User option
    Capture Page Screenshot

*** Keywords ***
wait until Element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Verify Card titles in the Shop Page
    @{expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    @{elements}=    Get WebElements    css:.card-title
    @{actualList}=    Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal   ${expectedList}    ${actualList}

Select the Card
    [Arguments]    ${cardName}
    @{elements}=    Get WebElements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the Login Details and select the User option
     Input Text    username        ${user_name}
     Input Password    password        ${correct_password}
     Click Element    css:input[value='user']
     Wait Until Element Is Visible    css:.modal-body
     Scroll Element Into View    id:okayBtn
     Click Button    id:okayBtn
     Click Button    id:okayBtn
     Wait Until Element Is Not Visible    css:.modal-body
     Select From List By Value    css:select.form-control    teach
     Select Checkbox    terms
     Checkbox Should be Selected    terms