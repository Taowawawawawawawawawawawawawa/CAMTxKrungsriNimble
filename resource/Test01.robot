*** Settings ***
Library        OperatingSystem
Library        Collections
Library        String
Test Template    example test keyword

*** Test Cases ***                                                                                USERNAME                                                PASSWORD
Example keyword1                                                                                        standard_user                                                                 secret_sauce
    [Tags]      test_data_driven1
    [Documentation]    Successfully Login using username normally
    #[Template]    Login success
 
Example keyword2                                                                                        performance_glitch_user                                               secret_sauce
    [Tags]      test_data_driven1
    [Documentation]    Successfully Login using username slowly
    #[Template]    Login success

*** Keywords ***
example test keyword
    [Arguments]     ${uesrname}    ${password}
    log     ${uesrname}    console=true
    log     ${password}    console=true
example login user
    log     robot framework    console=true