*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${cp_shop_cart_items_list}       xpath=//div[@data-name='Active Items']//div[@class='sc-list-item-content']
${cp_shop_cart_item_title}       xpath=//div[@data-name='Active Items']//div[@class='sc-list-item-content']//span[@class='a-truncate-cut']
${cp_total_itens_shop_cart}      id=sc-subtotal-label-activecart
${cp_total_price_shop_cart}      xpath=//span[@id='sc-subtotal-amount-activecart']//span[@class='a-size-medium a-color-base sc-price sc-white-space-nowrap']
${cp_total_itens_resume}         id=sc-subtotal-label-buybox
${cp_total_price_resume}         xpath=//span[@id='sc-subtotal-amount-buybox']//span[@class='a-size-medium a-color-base sc-price sc-white-space-nowrap']
${cp_qty_dropdown}               xpath=//select[@id='quantity']

*** Keywords ***
#### Actions
On shopping cart, select on quantity field the value "${quantity_selected}"
    Select From List By Label    ${cp_qty_dropdown}     ${quantity_selected}
    Capture Page Screenshot

#### Validations
Product "${product_added}" should be shown on shopping cart list
    @{products}    Get WebElements    ${cp_shop_cart_items_list}
    FOR   ${product}   IN   @{products}
        ${product_name}    Get Text    ${cp_shop_cart_item_title}
        IF  "${product_name}"=="${product_added}"
            Should Be Equal As Strings    ${product_name}    ${product_added}
            Exit For Loop
        END
    END
    Capture Page Screenshot

Total items on shopping cart should be "${total_items_shop_cart}"
    Element Should Contain    ${cp_total_itens_shop_cart}    ${total_items_shop_cart}
    Capture Page Screenshot

Total price on shopping cart should be "${total_price_shop_cart}"
    Element Text Should Be    ${cp_total_price_shop_cart}    ${total_price_shop_cart}
    Capture Page Screenshot

Total items on resume should be "${total_items_resume}"
    Element Should Contain    ${cp_total_itens_resume}    ${total_items_resume}
    Capture Page Screenshot

Total price on resume should be "${total_price_resume}"
    Element Text Should Be    ${cp_total_price_resume}    ${total_price_resume}
    Capture Page Screenshot

Wait until page update shopping cart totals
    Sleep    5s
