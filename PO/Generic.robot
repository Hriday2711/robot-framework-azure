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

Open the Browser with the Mortgage payment url
    Open Browser    ${url}        Chrome
    Maximize Browser Window

Close Browser Session
    Close Browser