*** Settings ***
Documentation    All the page objects and keywords of landing page
...                The system specific keywords created here form our own domain specific language.
Library    SeleniumLibrary
Resource    Generic.robot

*** Variables ***
${Error_Message_Login}    css:.alert-danger

*** Keywords ***
Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn

Verify error message is correct
    ${result}=    Get Text    ${Error_Message_Login}
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

wait until Element is located in the page
    [Arguments]    ${element_locator}
    Wait Until Element Is Visible    ${element_locator}


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
