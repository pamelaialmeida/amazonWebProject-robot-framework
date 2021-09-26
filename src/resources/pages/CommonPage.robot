*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${search_field}                 id=twotabsearchtextbox
${search_button}                id=nav-search-submit-button
${cart_logo_quantity}           id=nav-cart-count
${cart_log}                     id=nav-cart
${delete_link}                  xpath=//input[@value='Delete']

*** Keywords ***
#### Setup
Setup do Teste
    [Arguments]   ${browser}
    Open a new Browser      ${browser}
    AmazonHomePage.Access Amazon Home Page

Open a new Browser
    [Arguments]   ${browser}
    Open Browser    about:blank     ${browser}
    Maximize Browser Window

#### Teardown
Teardown do Teste
    Clear Shopping Cart
    Close the Browser

Close the Browser
    Close Browser

Clear Shopping Cart
    Click on Cart logo
    @{delete_links}   Get WebElements    ${delete_link}
    FOR   ${del_link}   IN   @{delete_links}
        Wait Until Keyword Succeeds    3x    2s    Click on Delete link
    END

Click on Delete link
    Click Element    ${delete_link}

#### Actions
Type the product name on the search field
    [Arguments]   ${product_name}
    Input Text    ${search_field}    ${product_name}
    Capture Page Screenshot

Click on Search Button
    Click Element    ${search_button}
    Capture Page Screenshot

Click on Cart logo
    Click Element    ${cart_log}
    Capture Page Screenshot

#### Validations
The quantity on Cart logo should be "${quantity_products_selected}"
  Set Selenium Implicit Wait    2s
  Log   ${quantity_products_selected}
  ${qtd}    Get Text    ${cart_logo_quantity}
  Element Text Should Be    ${cart_logo_quantity}     ${quantity_products_selected}
