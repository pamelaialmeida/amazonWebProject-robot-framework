*** Settings ***
Resource            ${EXECDIR}/src/resources/pages/AmazonHomePage.robot
Resource            ${EXECDIR}/src/resources/pages/CommonPage.robot
Resource            ${EXECDIR}/src/resources/pages/SearchResultsPage.robot
Resource            ${EXECDIR}/src/resources/pages/ProductDetailsPage.robot
Resource            ${EXECDIR}/src/resources/pages/BuyBoxPage.robot
Suite Setup         Open a new Browser    chrome
Test Setup          AmazonHomePage.Access Amazon Home Page
Suite Teardown      Close the Browser


*** Test Cases ***
TC01 - Should show product details for a product
    [Tags]    product_details    positive
    Type the product name on the search field    Amazon Basics 3-Button USB Wired Computer Mouse (Black), 1-Pack
    Click on Search Button
    Click on product "Amazon Basics 3-Button USB Wired Computer Mouse (Black), 1-Pack" link
    Product title should be "Amazon Basics 3-Button USB Wired Computer Mouse (Black), 1-Pack"
    Product price on description should be "$7.92"
    Product size selected on description should be "1-Pack"
    Product price on buybox should be "$7.92"
    Page should show a delivery date on buybox
    Availability on buybox should be "In Stock."
    Page should show a quantity dropdown on buybox with default value equal to "1"
    Page should show on buybox Add to Cart button
    Page should show on buybox Buy Now button

TC02 - Should inform that a product is unavailable
    [Tags]    product_details    negative
    Type the product name on the search field    SAMSUNG 40-inch Class LED Smart FHD TV 1080P (UN40N5200AFXZA, 2019 Model)
    Click on Search Button
    Click on product "SAMSUNG 40-inch Class LED Smart FHD TV 1080P (UN40N5200AFXZA, 2019 Model)" link
    Product title should be "SAMSUNG 40-inch Class LED Smart FHD TV 1080P (UN40N5200AFXZA, 2019 Model)"
    Product availability on description should be "Currently unavailable."
    Product availability message on description should be "We don't know when or if this item will be back in stock."
    Product unavailability on buybox should be "Currently unavailable."
    Product unavailability message on buybox should be "We don't know when or if this item will be back in stock."
    Page should not show on buybox Add to Cart button
    Page should not show on buybox Buy Now button
    Page should show on buybox See Similar Items button

TC03 - Should allow add to cart an available product
    [Tags]    product_details    positive
    Type the product name on the search field    Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)
    Click on Search Button
    Click on product "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)" link
    Product title should be "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)"
    Product price on description should be "$1,450.00"
    Product size selected on description should be "256GB"
    Product color selected on description should be "Graphite"
    Product price on buybox should be "$1,450.00"
    Page should show a delivery date on buybox
    Page should show a quantity dropdown on buybox with default value equal to "1"
    Page should show on buybox Add to Cart button
    Page should show on buybox Buy Now button
    Select on quantity field the value "1"
    Click on Add to Cart button
    The quantity on Cart logo should be "1"

TC04 - Should not allow add to cart an unavailable product
    [Tags]    product_details    negative
    Type the product name on the search field    Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)
    Click on Search Button
    Click on product "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)" link
    Product title should be "Apple iPhone 12 Pro Max, 256GB, Graphite - Fully Unlocked (Renewed)"
    Page should show a quantity dropdown on buybox with default value equal to "1"
    Page should show on buybox Add to Cart button
    Page should show on buybox Buy Now button
    Select the service provider "AT&T"
    Product unavailability on buybox should be "Currently unavailable."
    Product unavailability message on buybox should be "We don't know when or if this item will be back in stock."
    Page should not show the quantity dropdown on buybox
    Page should not show on buybox Add to Cart button
    Page should not show on buybox Buy Now button
    Page should show on buybox See Similar Items button
