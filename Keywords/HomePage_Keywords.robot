*** Settings ***
Library    Browser
Resource    BaseFile.robot

*** Variables ***
${Magento_E-commerce_PageTitle}        Home Page
${brand_logo_locator}                  css=a.logo
${sign_In_link_locator}                xpath=//li[@class='authorization-link']//a
${create-an-account-link_locator}      text=Create an Account


*** Keywords ***
Launch the Magento E-Commerce HomePage
    [Documentation]    Method to Launch the Magento E-Commerce Home Page
    Launch Magento Application    ${BROWSER}    ${APP_URL}

Verify the Title of Magento E-Commerce HomePage
    [Documentation]    Method to verify the title of Magento E-Commerce Home Page
    Verify Page Title    ${Magento_E-commerce_PageTitle}

Select the Brand Logo Icon on HomePage
    [Documentation]    Click on the Brand Logo Icon on HomePage
    Log    Clicking on Brand logo icon on Homepage
    Click    ${brand_logo_locator}

Select Sign In link on Home Page
    [Documentation]    Click on Sign In link on Magento Home Page
    Log    Clicking on Sign In link on Magento Home Page
    Click    ${sign_In_link_locator}

Select 'Create an Account' link on Home Page
    [Documentation]    Click on 'Create an Account' link on Home Page 
    Log    Clicking on 'Create an Account' link on Home Page
    Click    ${create-an-account-link_locator}