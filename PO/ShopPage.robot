*** Settings ***
Documentation    All the page objects and keywords of landing page
...                The system specific keywords created here form our own domain specific language.
Library    SeleniumLibrary
Library    ../.venv/lib/python3.12/site-packages/robot/libraries/Collections.py

*** Variables ***
${Shop_page_load}    css:.nav-link

*** Keywords ***
wait until Element is located in the page
    Wait Until Element Is Visible    ${Shop_page_load}

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