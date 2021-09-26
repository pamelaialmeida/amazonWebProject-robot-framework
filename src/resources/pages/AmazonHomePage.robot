*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${HOME_URL}                   https://www.amazon.com/
${HOME_TITLE}                 Amazon.com. Spend less. Smile more.

*** Keywords ***
Access Amazon Home Page
    Go To               ${HOME_URL}
    Title Should Be     ${HOME_TITLE}
    Capture Page Screenshot
