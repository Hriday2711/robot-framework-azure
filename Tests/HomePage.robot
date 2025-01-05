*** Settings ***
Library    Browser
Resource    ../Keywords/HomePage_Keywords.robot
Test Setup    Launch the Magento E-Commerce HomePage
Test Teardown    Close Browser    ALL

*** Variables ***
${Login_Page_Title}                            Customer Login
${Create-an-Account_Page_Title}                Create New Customer Account

*** Test Cases ***
TC01 - Verify Page Title of Home Page
    [Documentation]    Test to Verify the Page Title of Magento E-Commerce Home Page
    [Tags]    HomePage    MEC-1
    Verify the Title of Magento E-Commerce HomePage
    Take Screenshot

TC02 - Select Brand Logo Icon on Home Page
    [Documentation]    Test to Verify the Page Title of Magento E-Commerce Home Page
    [Tags]    HomePage    MEC-2
    Select the Brand Logo Icon on HomePage
    Verify the Title of Magento E-Commerce HomePage
    Take Screenshot

TC03 - Verify Navigation to Login Page
    [Documentation]    Select Sign In link on Home Page & verify user navigation to Login page
    [Tags]    HomePage    MEC-3
    Select Sign In link on Home Page
    Verify Page Title    ${Login_Page_Title}
    Take Screenshot

TC04 - Verify Navigation to 'Create an Account' Page
    [Documentation]    Select 'Create an Account' link on Home Page & verify user navigation to 'Create an Account' page
    [Tags]    HomePage    MEC-4
    Select 'Create an Account' link on Home Page
    Verify Page Title    ${Create-an-Account_Page_Title}
    Take Screenshot