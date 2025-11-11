*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Library           OperatingSystem
Library           String

*** Keywords ***
Get the list of All the Products from API
    [Documentation]    This keyword retrieves the list of all products from the API and returns the response.
    ${response}=    GET    url=https://automationexercise.com/api/productsList    expected_status=200
    RETURN    ${response}

POST To All Products List API
    [Documentation]    This keyword sends a POST request to the products list API and returns the response.
    ${response}=    POST    url=https://automationexercise.com/api/productsList    expected_status=200
    RETURN    ${response}

GET All Brands List from API
    [Documentation]    This keyword retrieves the list of all brands from the API and returns the response.
    ${response}=    GET    url=https://automationexercise.com/api/brandsList    expected_status=200
    RETURN    ${response}

PUT To All Brands List API
    [Documentation]    This keyword sends a PUT request to the brands list API and returns the response.
    ${response}=    PUT    url=https://automationexercise.com/api/brandsList    expected_status=200
    RETURN    ${response}

Search a Product by sending POST request to API
    [Documentation]    This keyword sends a POST request to the search product API and returns the response.
    [Arguments]    ${search_product}=Jeans    ${no_search_product}=False
    IF    ${no_search_product}==True
        ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
        ${jsonData}=    Create Dictionary    none=none
        ${encodedJson}=    Evaluate    urllib.parse.urlencode(${jsonData})    urllib.parse
        ${response}=    POST    url=https://automationexercise.com/api/searchProduct    headers=${headers}    expected_status=200    data=${encodedJson}
    ELSE
         ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
         ${jsonData}=    Create Dictionary    search_product=${search_product}
         ${encodedJson}=    Evaluate    urllib.parse.urlencode(${jsonData})    urllib.parse
         ${response}=    POST    url=https://automationexercise.com/api/searchProduct    headers=${headers}    expected_status=200    data=${encodedJson}
    END
    RETURN    ${response}

*** Test Cases ***
Get List of All the Products
    [Documentation]    This test case retrieves the list of all products from the API and verifies the response status code.
    [Tags]    API-01
    ${response}    Get the list of All the Products from API
    Log    ${response.json()}    console=${True}
    ${responseCode}=    Get Value From Json    ${response.json()}    responseCode
    Should Be Equal As Integers    ${responseCode[0]}    200

POST To All Products List API
    [Documentation]    This test case sends a POST request to the products list API and verifies the response status code.
    [Tags]    API-02
    ${response}=    POST To All Products List API
    Log    Response status code is ${response.status_code}.    console=${True}
    ${responseCode}=    Get Value From Json    ${response.json()}    responseCode
    ${responseMessage}=    Get Value From Json    ${response.json()}    message
    Log    Response message is: ${responseMessage[0]}    console=${True}
    Should Be Equal As Integers    ${responseCode[0]}    405

Get List of All the Brands
    [Documentation]    This test case retrieves the list of all brands from the API and verifies the response status code.
    [Tags]    API-03
    ${response}=    GET All Brands List from API
    Log    ${response.json()}    console=${True}
    ${responseCode}=    Get Value From Json    ${response.json()}    responseCode
    Should Be Equal As Integers    ${responseCode[0]}    200

PUT To All Brands List
    [Documentation]    This test case sends a PUT request to the brands list API and verifies the response status code.
    [Tags]    API-04
    ${response}=    PUT To All Brands List API
    Log    Response status code is ${response.status_code}.    console=${True}
    ${responseCode}=    Get Value From Json    ${response.json()}    responseCode
    ${responseMessage}=    Get Value From Json    ${response.json()}    message
    Log    Response message is: ${responseMessage[0]}    console=${True}
    Should Be Equal As Integers    ${responseCode[0]}    405

POST To Search Product
    [Documentation]    This test case sends a POST request to the search product API and verifies the response status code.
    [Tags]    API-05
    ${response}=    Search a Product by sending POST request to API
    Log    Response status code is ${response.status_code}.    console=${True}
    ${responseCode}=    Get Value From Json    ${response.json()}    responseCode
    Should Be Equal As Integers    ${responseCode[0]}    200
    Log    ${response.json()}    console=${True}

POST To Search Product with search-product Parameter
    [Documentation]    This test case sends a POST request to the search product API without a specific search term and verifies the response status code.
    [Tags]    API-06
    ${response}=    Search a Product by sending POST request to API    no_search_product=True
    Log    Response status code is ${response.status_code}.    console=${True}
    ${responseCode}=    Get Value From Json    ${response.json()}    responseCode
    Should Be Equal As Integers    ${responseCode[0]}    400
    ${responseMessage}=    Get Value From Json    ${response.json()}    message
    Log    Response message is: ${responseMessage[0]}    console=${True}

Create a User Account via API
    [Documentation]    This test case creates a user account via the API and verifies the response status code.
    [Tags]    API-07
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${jsonData}=    Create Dictionary    name=Bhumi    email=bhumibhogayata99@gmail.com    password=Hab@271197    title=Mrs    birth_date=10    birth_month=May    birth_year=1995    firstname=Bhumi    lastname=Bhogayata    company=ABC Pvt Ltd    address1=123, Main Street    address2=Apt 4B    country=India    state=Gujarat    city=Ahmedabad    zipcode=380015    mobile_number=9876543210
    Log    User details are ${jsonData}.    console=${True}
    ${encodedJson}=    Evaluate    urllib.parse.urlencode(${jsonData})    urllib.parse
    ${response}=    POST    url=https://automationexercise.com/api/createAccount    headers=${headers}    expected_status=200    data=${encodedJson}
    Log    Response status code is ${response.status_code}.    console=${True}
    ${responseCode}=    Get Value From Json    ${response.json()}    responseCode
    Should Be Equal As Integers    ${responseCode[0]}    201
    ${responseMessage}=    Get Value From Json    ${response.json()}    message
    Log    Response message is: ${responseMessage[0]}    console=${True}
    Log    ${response.json()}    console=${True}