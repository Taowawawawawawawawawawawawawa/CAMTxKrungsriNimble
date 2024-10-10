*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Library     String
Library     BuiltIn

*** Test Cases ***
Open website testing
    Open browser chrome    https://www.saucedemo.com/v1/index.html    chrome
    Sleep    2s
    Input uesrname    //*[@id="user-name"]    standard_user
    Input password    //*[@id="password"]    secret_sauce
    Click login    //*[@id="login-button"]
    Verify text Products
    Click Button    //*[@id="inventory_container"]/div/div[1]/div[3]/button
    Sleep    2s
    Click Button    //*[@id="menu_button_container"]/div/div[3]/div/button
    # Sleep    2s
    # Click Button    //*[@id="menu_button_container"]/div/div[3]/div/button
    #//*[@id="logout_sidebar_link"]
    Sleep    2s
    Click Element    //*[@id="logout_sidebar_link"]
    Sleep    2s
    Verify text
*** Keywords ***
Open browser chrome
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
Input uesrname
    [Arguments]    ${placeholder}    ${username}
    Input Text    ${placeholder}    ${username}
Input password
    [Arguments]    ${placeholder}    ${username}
    Input Text    ${placeholder}    ${username}
Click login
    [Arguments]    ${button}
    Click Button    ${button}
Verify text Products
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=1s
Verify text
    Wait Until Element Is Visible    //*[@id="login_credentials"]    timeout=1s
