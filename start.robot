*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Aceder a um site 
    Open Browser  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login  Chrome
    Sleep         5
    Input Text    //input[@name="username"]  Admin
    Input Text    //input[@name="password"]  admin123
    Click Button  //button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"]
    Sleep         10
    Close Browser