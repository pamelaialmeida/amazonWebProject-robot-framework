*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***

${bb_prod_price}                 id=price_inside_buybox
${bb_delivery_date}              id=mir-layout-DELIVERY_BLOCK-slot-DELIVERY_MESSAGE
${bb_availability}               xpath=//div[@id='availability']/span[1]
${bb_qty_dropdown}               xpath=//select[@id='quantity']
${bb_add_to_cart_button}         id=add-to-cart-button
${bb_buy_button}                 id=buy-now-button
${bb_unavailable_status}         xpath=//div[@id='exports_desktop_outOfStock_buybox_message_feature_div']/div/span
${bb_unavailable_message}        xpath=//div[@id='exports_desktop_outOfStock_buybox_message_feature_div']/div
${bb_similar_items_button}       id=exportAlternativeTriggerButton-announce


*** Keywords ***
Select on quantity field the value "${selected_quantity}"
    Select From List By Label    ${bb_qty_dropdown}     ${selected_quantity}
    Capture Page Screenshot

Click on Add to Cart button
    Click Element    ${bb_add_to_cart_button}
    Set Selenium Implicit Wait    5s
    Capture Page Screenshot

#### Validations
Product price on buybox should be "${product_price_buybox}"
    Wait Until Element Is Visible    ${bb_prod_price}
    Element Text Should Be    ${bb_prod_price}    ${product_price_buybox}
    Capture Page Screenshot

Page should show a delivery date on buybox
    Page Should Contain Element    ${bb_delivery_date}
    Capture Page Screenshot

Availability on buybox should be "${product_availability}"
    Element Should Contain    ${bb_availability}    ${product_availability}
    Capture Page Screenshot

Page should show a quantity dropdown on buybox with default value equal to "${quantity}"
    ${default_value}    Get Selected List Value    ${bb_qty_dropdown}
    Should Be Equal As Integers    ${default_value}    ${quantity}

Page should show on buybox Add to Cart button
    Page Should Contain Element    ${bb_add_to_cart_button}
    Capture Page Screenshot

Page should show on buybox Buy Now button
    Page Should Contain Element    ${bb_buy_button}
    Capture Page Screenshot

Product unavailability on buybox should be "${unavailability_status}"
    Set Selenium Implicit Wait    5s
    Element Text Should Be    ${bb_unavailable_status}    ${unavailability_status}
    Capture Page Screenshot

Product unavailability message on buybox should be "${unavailability_message}"
    Element Should Contain    ${bb_unavailable_message}   ${unavailability_message}
    Capture Page Screenshot

Page should not show on buybox Add to Cart button
    Page Should Not Contain Element    ${bb_add_to_cart_button}
    Capture Page Screenshot

Page should not show on buybox Buy Now button
    Page Should Not Contain Element    ${bb_buy_button}
    Capture Page Screenshot

Page should show on buybox See Similar Items button
    Page Should Contain Element    ${bb_similar_items_button}
    Capture Page Screenshot

Page should not show the quantity dropdown on buybox
    Page Should Not Contain Element    ${bb_qty_dropdown}
    Capture Page Screenshot
