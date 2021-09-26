*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${pd_product_title}                     id=productTitle
${pd_prod_price_description}            id=priceblock_ourprice
${pd_prod_size}                         xpath=//div[@id='variation_size_name']//span[@class='selection']
${pd_prod_color}                        xpath=//div[@id='variation_color_name']//span[@class='selection']
${pd_availability}                      xpath=//div[@id='availability']/span[1]
${pd_availability_message}              id=availability
${service_providers_name}               xpath=//div[@id='variation_service_provider']//p

*** Keywords ***
#### Validations
Product title should be "${product_name}"
    Wait Until Element Is Visible    ${pd_product_title}
    Element Text Should Be    ${pd_product_title}    ${product_name}
    Capture Page Screenshot

Product price on description should be "${product_price_description}"
    Element Text Should Be    ${pd_prod_price_description}    ${product_price_description}
    Capture Page Screenshot

Product size selected on description should be "${product_size}"
    Element Text Should Be    ${pd_prod_size}    ${product_size}
    Capture Page Screenshot

Product color selected on description should be "${product_color}"
    Element Text Should Be    ${pd_prod_color}    ${product_color}
    Capture Page Screenshot

Product availability on description should be "${product_availability_description}"
    Element Text Should Be    ${pd_availability}    ${product_availability_description}
    Capture Page Screenshot

Product availability message on description should be "${availability_message}"
    Element Should Contain    ${pd_availability_message}    ${availability_message}
    Capture Page Screenshot

Select the service provider "${service_provider}"
    @{providers}    Get WebElements    ${service_providers_name}
    FOR     ${provider}   IN    @{providers}
        ${provider_name}    Get Text    ${provider}
        IF  "${provider_name}"=="${service_provider}"
            Click Element    ${provider}
            Exit For Loop
        END
    END
    Capture Page Screenshot
