*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}      https://testautomationpractice.blogspot.com/
${name}     Pedro
${email}    pedro@email.com
${phone}    967777896
${adress}   Rua da Noesis

*** Keywords ***
Aceder ao site 
    Open Browser    https://testautomationpractice.blogspot.com/  chrome
    Maximize Browser Window
Select Radio Button 
    [Arguments]     ${locator}
    Click Element   ${locator}

*** Test Cases ***
Preencher todos os campos   
    Aceder ao site 
    Input Text                  //input[@id="name"]         ${name}
    Input Text                  //input[@id="email"]        ${email}
    Input Text                  //input[@id="phone"]        ${phone}
    Input Text                  //textarea[@id="textarea"]  ${adress}
    Select Radio Button         //input[@id="male"]
    Select Checkbox             //input[@id="sunday"]
    Select Checkbox             //input[@id="friday"]
    Select Checkbox             //input[@id="wednesday"]
    Select From List By Value   //select[@id="country"]     canada
    Select From List By Value   //select[@id="colors"]      green
    Select From List By Value   //select[@id="animals"]     lion
    Click Element               //input[@id="datepicker"]
    Click Element               //a[text()="24"]
    Click Element               //input[@id="txtDate"]
    Click Element               //a[text()="31"]
    Input Text                  //input[@id="start-date"]   01/24/2025
    Input Text                  //input[@id="end-date"]     01/31/2025
    Click Button                //button[@class="submit-btn"]
    Element Text Should Be      //div[@id="result"]         You selected a range of 7 days.
    Sleep                       5
