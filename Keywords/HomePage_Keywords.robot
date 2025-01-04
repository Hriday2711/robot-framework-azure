*** Settings ***
Library    Browser
Resource    BaseFile.robot

*** Variables ***
${Magento_E-commerce_PageTitle}        Home Page


*** Keywords ***
Launch the Magento E-Commerce HomePage
    Launch Magento Application    ${BROWSER}    ${APP_URL}

Verify the Title of Magento E-Commerce HomePage
    Verify Page Title    ${Magento_E-commerce_PageTitle}