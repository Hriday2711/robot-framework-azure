*** Settings ***
Library    Browser
Resource    BaseFile.robot

*** Variables ***
${Magento_E-commerce_HomePageTitle}                     Home Page
${brand_logo_locator_homePage}                          css=a.logo
${sign_In_link_locator_homePage}                        xpath=(//li[@class='authorization-link']//a)[1]
${create-an-account-link_locator_homePage}              xpath=(//li//a[text()='Create an Account'])[1]
${whats_new_link_locator_homePage}                      xpath=//a//span[text()="What's New"]
${sale_link_homePage}                                   xpath=//a//span[text()="Sale"]
${women_link_homePage}                                  xpath=//a//span[text()="Women"]
${women_dropdownList_homePage}                          xpath=//li[contains(@class,'nav-2')]//ul[contains(@class, 'level0')]
${women_dropdownListItem_Tops_homePage}                 xpath=//li[contains(@class,'nav-2')]//*[text()='Tops']
${women_dropdownListItem_Bottoms_homePage}              xpath=//li[contains(@class,'nav-2')]//*[text()='Bottoms']


*** Keywords ***
Launch the Magento E-Commerce HomePage
    [Documentation]    Method to Launch the Magento E-Commerce Home Page
    Launch Magento Application    ${BROWSER}    ${APP_URL}

Verify the Title of Magento E-Commerce HomePage
    [Documentation]    Method to verify the title of Magento E-Commerce Home Page
    Verify Page Title    ${Magento_E-commerce_HomePageTitle}

Select the Brand Logo Icon on HomePage
    [Documentation]    Click on the Brand Logo Icon on HomePage
    Log    Clicking on Brand logo icon on Homepage    console=true
    Click    ${brand_logo_locator_homePage}
    Verify Page Title    ${Magento_E-commerce_HomePageTitle}

Select Sign In link on Home Page
    [Documentation]    Click on Sign In link on Magento Home Page and verify user navigation to Sign In Page
    Log    Clicking on Sign In link on Magento Home Page    console=true
    Click    ${sign_In_link_locator_homePage}

Select 'Create an Account' link on Home Page
    [Documentation]    Click on 'Create an Account' link on Home Page
    Log    Clicking on 'Create an Account' link on Home Page    console=true
    Click    ${create-an-account-link_locator_homePage}

Select 'Whats New' link on Home Page
    [Documentation]    Select 'Whats New' link on Home Page
    Log    Selecting the 'Whats New' link on Home Page    console=true
    Click    ${whats_new_link_locator_homePage}

Select 'Sale' link on Home Page
    [Documentation]    Select 'Sale' link on Home Page
    Log    Selecting the 'Sale' link on Home Page    console=True
    Click    ${sale_link_homePage}

Hover over the Women Dropdown link on Home Page and verify if list is visible on UI
    [Documentation]    Hover over the "Woman's" dropdown link on Home Page
    Log    Hovering over the Woman's dropdown link on Home Page
    Hover    ${women_link_homePage}
    Wait For Elements State    ${women_dropdownList_homePage}    state=visible    timeout=5 seconds    message= Women dropdown list is not visible on upon hovering on Home Page
    Wait For Elements State    ${women_dropdownListItem_Tops_homePage}    state=visible    timeout=5 seconds    message= Tops dropdown list item is not displayed under Women dropdown on Home Page
    Wait For Elements State    ${women_dropdownListItem_Bottoms_homePage}    state=visible    timeout=5 seconds    message= Bottoms dropdown list item is not displayed under Women dropdown on Home Page
    Take Screenshot