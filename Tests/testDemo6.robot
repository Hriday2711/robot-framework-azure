*** Settings ***
Documentation    To validate the Login form
Resource    resource.robot
Library    SeleniumLibrary
Library    Collections
Library    resources/customLibraries/Shop.py
Test Setup    Open the Browser with the Mortgage payment url
Test Teardown    Close Browser Session
Resource    resource.robot
Resource    ../PO/LandingPage.robot
Resource    ../PO/ShopPage.robot

*** Variables ***
@{listOfProducts}    Blackberry    Nokia Edge

*** Test Cases ***
TC1 Validate UnSuccessful Login
    Fill the Login Form and Select Sign-In Button    ${user_name}    ${invalid_password}
    Wait Until Element Is Visible    ${Error_Message_Login}
    LandingPage.Verify error message is correct

TC2 Validate Cards display in the Shopping page
    [Tags]    Regression
    LandingPage.Fill the login Form    ${user_name}    ${correct_password}
    ShopPage.wait until Element is located in the page
    ShopPage.Verify Card titles in the Shop Page
    Select the Card    Blackberry
    Add Items To Cart And Checkout    @{listOfProducts}

TC3 Select the Form and navigate to the Child Window
    LandingPage.Fill the Login Details and select the User option
    Capture Page Screenshot