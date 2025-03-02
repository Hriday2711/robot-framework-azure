*** Settings ***
Library    Browser
Resource    ../Keywords/HomePage_Keywords.robot
Test Setup    Launch the Magento E-Commerce HomePage
Test Teardown    Close Browser    ALL

*** Variables ***
${Login_Page_Title}                            Customer Login
${Create-an-Account_Page_Title}                Create New Customer Account
${Whats_New_Page_Title}                        What's New
${Sale_Page_Title}                             Sale

*** Test Cases ***
MEC1 - Verify Page Title of Home Page
    [Documentation]    Test to Verify the Page Title of Magento E-Commerce Home Page
    [Tags]    HomePage
    Verify the Title of Magento E-Commerce HomePage
    Take Screenshot

MEC2 - Select Brand Logo Icon on Home Page
    [Documentation]    Test to Verify the Page Title of Magento E-Commerce Home Page
    [Tags]    HomePage
    Select the Brand Logo Icon on HomePage
    Wait For Load State    state=domcontentloaded
    Verify the Title of Magento E-Commerce HomePage
    Take Screenshot

MEC3 - Verify Navigation to Login Page
    [Documentation]    Select Sign In link on Home Page & verify user navigation to Login page
    [Tags]    HomePage
    Select Sign In link on Home Page
    Wait For Load State    state=domcontentloaded
    Verify Page Title    ${Login_Page_Title}
    Take Screenshot

MEC4 - Verify Navigation to 'Create an Account' Page
    [Documentation]    Select 'Create an Account' link on Home Page & verify user navigation to 'Create an Account' page
    [Tags]    HomePage
    Select 'Create an Account' link on Home Page
    Wait For Load State    state=domcontentloaded
    Verify Page Title    ${Create-an-Account_Page_Title}
    Take Screenshot

MEC5 - Verify Navigation to 'What's New' Page
    [Documentation]    Select 'Whats New' link on Home Page & Verify user navigation for 'Whats New' page
    [Tags]    HomePage
    Select 'Whats New' link on Home Page
    Wait For Load State    state=domcontentloaded
    Verify Page Title    ${Whats_New_Page_Title}
    Take Screenshot

MEC6 - Verify Navigation to 'Sale' Page
    [Documentation]    Select 'Sale' link on Home Page & Verify user navigation to 'Sale' page 
    [Tags]    HomePage
    Select 'Sale' link on Home Page
    Wait For Load State    state=domcontentloaded
    Verify Page Title    ${Whats_New_Page_Title}
    Take Screenshot