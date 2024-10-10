*** Settings ***
Library     OperatingSystem
Library     Collections
Library     String
Library     CSVLibrary
Library     SeleniumLibrary
Variables   /DII/1-67/tester/data.yaml

*** Test Cases ***
Get csv testing
    ${CSV_FILE}    Set Variable    /Users/HP VICTUS16/Downloads/test_robot.csv
    ${DATA_CSV}    Read Csv File To Associative    ${CSV_FILE}
    # Log To Console    ${DATA_CSV}
    FOR    ${r}    IN    @{DATA_CSV}
        ${user}    Set Variable    ${r}

        Log To Console    ${user}[ï»¿username]

        Open Browser chrome    ${url}    ${browser}
        Input username    ${r}[ï»¿username]
        Input password    ${r}[password]
        Click login
        Verify text Products
    END

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
