*** Settings ***
Library    SeleniumLibrary    

Suite Setup       Log    I am inside Test Suite Setup
Suite Teardown    Log    I am inside Test Suite Teardown    
Test Setup        Log    I am inside Test Setup    
Test Teardown     Log    I am inside Test Teardown

Default Tags    sanity    

*** Test Cases ***
MyFirstTest
    [Tags]    smoke
    Log    Hello World...    
    
MyFirstSeleniumTest
    Set Tags        regression1
    Remove Tags     sanity
    Open Browser    https://google.com    chrome
    Input Text      name=q                Automation step by step
    Press Keys      name=q                RETURN   
    Sleep           2s
    Close Browser
    
SampleLoginTest
    [Documentation]    This is a sample login test
    Open Browser      ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKW
    Click Element     id=welcome
    Click Element     link=Logout    
    Close Browser
    Log               Test completed      
    Log               This test was executed by %{username} on %{os}
    
AnotherTest
    Log     just some message
    
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text        id=txtUsername    ${CREDENTIALS}[0]    
    Input Password    id=txtPassword    ${LOGINDATA}[password]
    Click Button      id=btnLogin