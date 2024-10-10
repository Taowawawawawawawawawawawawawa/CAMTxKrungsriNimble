*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Library     String
Library     BuiltIn
Test Template    Login success
*** Test Cases ***       USERNAME                    PASSWORD
EX standard case         standard_user               secret_sauce
EX problem case          problem_user                secret_sauce
EX glitch case           performance_glitch_user     secret_sauce

*** Keywords ***
Login success
    [Arguments]    ${username}    ${pass}
    Open Browser    https://www.saucedemo.com/v1/index.html    chrome
    Input Text    //*[@id="user-name"]    ${username}
    Input Text    //*[@id="password"]    ${pass}
    Click Button    //*[@id="login-button"]
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=10s
    Sleep    100s