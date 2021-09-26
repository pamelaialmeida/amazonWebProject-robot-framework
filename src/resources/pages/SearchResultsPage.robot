*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${sr_researched_product_label}          xpath=/html/body/div[1]/div[2]/span/div/span/h1/div/div[1]/div/div/span[3]
${sr_result_message}                    xpath=/html/body/div[1]/div[2]/div[1]/div[1]/div/span[3]/div[2]/div[1]/span/div/div/div[1]/span[1]
${sr_result_message_product_name}       xpath=/html/body/div[1]/div[2]/div[1]/div[1]/div/span[3]/div[2]/div[1]/span/div/div/div[1]/span[2]
${sr_result_message_suggestion}         xpath=/html/body/div[1]/div[2]/div[1]/div[1]/div/span[3]/div[2]/div[1]/span/div/div/div[2]/span


*** Keywords ***
#### Actions
Click on product "${product_name}" link
    Set Selenium Implicit Wait    2s
    Click Link    ${product_name}
    Capture Page Screenshot

#### Validations
The researched product name "${product_name}" should be shown on the results label
    Wait Until Element Is Visible    ${sr_researched_product_label}
    ${res_prod_label_text}    Get Text    ${sr_researched_product_label}
    ${res_prod_label_text}    Remove String    ${res_prod_label_text}    "
    Should Be Equal    ${res_prod_label_text}    ${product_name}
    Log Many    Expected text: ${product_name} - Visible text: ${res_prod_label_text}
    Capture Page Screenshot

The researched product "${product_name}" should be shown on results
    Page Should Contain    ${product_name}
    Capture Page Screenshot

The system show a message "${message}" followed by the product name "${product_name}"
    Wait Until Element Is Visible    ${sr_result_message}
    Element Text Should Be    ${sr_result_message}    ${message}
    Element Text Should Be    ${sr_result_message_product_name}    ${product_name}
    Capture Page Screenshot

The system show the message "${suggestion_message}"
    Wait Until Element Is Visible    ${sr_result_message_suggestion}
    Element Text Should Be    ${sr_result_message_suggestion}    ${suggestion_message}
    Capture Page Screenshot
