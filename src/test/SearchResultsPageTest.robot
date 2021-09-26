*** Settings ***
Resource            ${EXECDIR}/src/resources/pages/AmazonHomePage.robot
Resource            ${EXECDIR}/src/resources/pages/CommonPage.robot
Resource            ${EXECDIR}/src/resources/pages/SearchResultsPage.robot
Suite Setup         Open a new Browser    chrome
Test Setup          AmazonHomePage.Access Amazon Home Page
Suite Teardown      Close the Browser


*** Test Cases ***
TC01 - Should search for an existing product on Amazon
    [Tags]    search_product    positive
    Type the product name on the search field    Smart Tv 40 inch
    Click on Search Button
    The researched product name "Smart Tv 40 inch" should be shown on the results label
    The researched product "Smart Tv 40 inch" should be shown on results

TC02 - Should update the search and the results label when performing a new search
    [Tags]    search_product    positive
    Type the product name on the search field    Amazon Basics 3-Button USB Wired Computer Mouse (Black), 1-Pack
    Click on Search Button
    The researched product name "Amazon Basics 3-Button USB Wired Computer Mouse (Black), 1-Pack" should be shown on the results label
    The researched product "Amazon Basics 3-Button USB Wired Computer Mouse (Black), 1-Pack" should be shown on results
    Type the product name on the search field    Apple ipad pro
    Click on Search Button
    The researched product name "Apple ipad pro" should be shown on the results label
    The researched product "Apple ipad pro" should be shown on results

TC03 - Should show a message when it doesn't find a result for a product
    [Tags]    search_product    negative
    Type the product name on the search field    KBK65KLKD9DJD520
    Click on Search Button
    The system show a message "No results for" followed by the product name "KBK65KLKD9DJD520"
    The system show the message "Try checking your spelling or use more general terms"
