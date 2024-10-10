*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    BuiltIn
Variables   /DII/1-67/tester/data.yaml

*** Test Cases ***
Open website testing
    Open Browser chrome    ${url}    ${browser}
    Input username    ${username.standard.user}
    Input password    ${username.standard.password}
    Click login
    Verify text Products


*** Keywords ***
Open Browser chrome
    [Arguments]    ${URL}    ${browser}
    Open Browser        ${URL}    ${browser}

Input username
    [Arguments]    ${username}   
    Input Text    //*[@id="user-name"]    ${username}

Input password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]    ${password}

Click login
    Click Button    //*[@id="login-button"]

Verify text Products
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=10s
