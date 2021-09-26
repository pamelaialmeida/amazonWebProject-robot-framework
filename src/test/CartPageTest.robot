*** Settings ***
Resource            ${EXECDIR}/src/resources/pages/AmazonHomePage.robot
Resource            ${EXECDIR}/src/resources/pages/CommonPage.robot
Resource            ${EXECDIR}/src/resources/pages/SearchResultsPage.robot
Resource            ${EXECDIR}/src/resources/pages/ProductDetailsPage.robot
Resource            ${EXECDIR}/src/resources/pages/BuyBoxPage.robot
Resource            ${EXECDIR}/src/resources/pages/CartPage.robot
Suite Setup         Open a new Browser    chrome
Test Setup          AmazonHomePage.Access Amazon Home Page
Test Teardown       Clear Shopping Cart
Suite Teardown      Close the Browser


*** Test Cases ***
TC01 - Should add the product on Cart
    [Tags]    product_details    positive
    Type the product name on the search field    Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)
    Click on Search Button
    Click on product "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)" link
    Product title should be "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)"
    Select on quantity field the value "1"
    Click on Add to Cart button
    The quantity on Cart logo should be "1"
    Click on Cart logo
    Product "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)" should be shown on shopping cart list
    Total items on shopping cart should be "1 item"
    Total price on shopping cart should be "$1,450.00"
    Total items on resume should be "1 item"
    Total price on resume should be "$1,450.00"

TC02 - Should add more than one product on Cart
    [Tags]    product_details    positive
    Type the product name on the search field    Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)
    Click on Search Button
    Click on product "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)" link
    Product title should be "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)"
    Select on quantity field the value "1"
    Click on Add to Cart button
    The quantity on Cart logo should be "1"
    Type the product name on the search field    2021 Apple 11-inch iPad Pro (Wi-Fi, 128GB) - Space Gray (Renewed)
    Click on Search Button
    Click on product "2021 Apple 11-inch iPad Pro (Wi-Fi, 128GB) - Space Gray (Renewed)" link
    Product title should be "2021 Apple 11-inch iPad Pro (Wi-Fi, 128GB) - Space Gray (Renewed)"
    Select on quantity field the value "1"
    Click on Add to Cart button
    The quantity on Cart logo should be "2"
    Click on Cart logo
    Product "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)" should be shown on shopping cart list
    Product "2021 Apple 11-inch iPad Pro (Wi-Fi, 128GB) - Space Gray (Renewed)" should be shown on shopping cart list
    Total items on shopping cart should be "2 items"
    Total price on shopping cart should be "$2,209.99"
    Total items on resume should be "2 items"
    Total price on resume should be "$2,209.99"

TC03 - Should update values on shopping cart when changing product quantity
    [Tags]    product_details    positive
    Type the product name on the search field    Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)
    Click on Search Button
    Click on product "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)" link
    Product title should be "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)"
    Select on quantity field the value "2"
    Click on Add to Cart button
    The quantity on Cart logo should be "2"
    Click on Cart logo
    Product "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)" should be shown on shopping cart list
    Total items on shopping cart should be "2 items"
    Total price on shopping cart should be "$2,900.00"
    Total items on resume should be "2 items"
    Total price on resume should be "$2,900.00"
    On shopping cart, select on quantity field the value "1"
    Wait until page update shopping cart totals
    Total items on shopping cart should be "1 item"
    Total price on shopping cart should be "$1,450.00"
    Total items on resume should be "1 item"
    Total price on resume should be "$1,450.00"
