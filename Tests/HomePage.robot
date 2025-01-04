*** Settings ***
Library    Browser
Resource    ../Keywords/HomePage_Keywords.robot
Test Setup    Launch the Magento E-Commerce HomePage
Test Teardown    Close Browser    ALL

*** Test Cases ***
TC1 - Verify Page Title of Magento E-commerce Home Page
    [Documentation]    Test to Verify the Page Title of Magento E-Commerce Home Page
    [Tags]    HomePage    MEC-1    Regression
    Verify the Title of Magento E-Commerce HomePage
    Take Screenshot

# TC2 - Select Brand Logo Icon on Magento E-commerce Home Page
#     [Documentation]    Test to Verify the Page Title of Magento E-Commerce Home Page
#     [Tags]    HomePage    MEC-1    Regression
#     # Click on the Brand Logo Icon on Home Page
#     # Verify the Page title

