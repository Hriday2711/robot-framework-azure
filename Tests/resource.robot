*** Settings ***
Documentation    A resource file with reusable keyworods and variables.
...                The system specific keywords created here form our own domain specific language.
Library    SeleniumLibrary

*** Variables ***
${user_name}    rahulshettyacademy
${invalid_password}    12345678
${url}    https://rahulshettyacademy.com/loginpagePractise/
${correct_password}    learning

*** Keywords ***



Fill the Login Form and Select Sign-In Button
    [Arguments]    ${username}    ${password}
    Input Text    username        ${username}
    Input Password    password        ${password}
    Click Element    signInBtn

