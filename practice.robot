*** Settings ***
Library  SeleniumLibrary
Library  DateTime


*** Variables ***
${url}          https://testautomationpractice.blogspot.com/
${name}         Noesis Academy
${email}        noesis@email.pt
${phone}        967777896
${adress}       Rua da Noesis
${username}     standard_user 
${password}     secret_sauce

*** Keywords ***
Login site saucedemo
    Open Browser            https://www.saucedemo.com/  chrome
    Maximize Browser Window
    Input Text              //input[@id="user-name"]    ${username}
    Input Text              //input[@id="password"]     ${password}
    Click Button            //input[@id="login-button"]

Adicionar item ao carrinho 
    Click Button            //button[@id="add-to-cart-sauce-labs-bike-light"]
    Click Element           //div[@id="shopping_cart_container"]/a
    Element Text Should Be  //div[@class="inventory_item_name"]            Sauce Labs Bike Light


*** Test Cases ***
Preencher todos os campos
    [Tags]                      preencher
    Open Browser                https://testautomationpractice.blogspot.com/  chrome
    Maximize Browser Window 
    Input Text                  //input[@id="name"]         ${name}
    Input Text                  //input[@id="email"]        ${email}
    Input Text                  //input[@id="phone"]        ${phone}
    Input Text                  //textarea[@id="textarea"]  ${adress}
    Select Radio Button         gender  male
    Select Checkbox             //input[@id="sunday"]
    Select Checkbox             //input[@id="friday"]
    Select Checkbox             //input[@id="wednesday"]
    Select From List By Value   //select[@id="country"]     canada
    Select From List By Index   //select[@id="colors"]      2   3
    Select From List By Label   //select[@id="animals"]     Deer  Elephant  
    
    ${TODAY}   Get Current Date    result_format=%m/%d/%Y
    Input Text                  //input[@id="datepicker"]       ${TODAY}
    Click Element               //input[@name="SelectedDate"]
    Select From List By Value   //select[@data-handler="selectMonth"]      5
    Select From List By Value   //select[@data-handler="selectYear"]       2015
    Click Element               //a[@data-date="30"]
    Input Text                  //input[@id="start-date"]   01/24/2025
    Input Text                  //input[@id="end-date"]     01/31/2025
    Click Button                //button[@class="submit-btn"]
    Element Text Should Be      //div[@id="result"]         You selected a range of 7 days.
    Choose File                 //input[@id="singleFileInput"]          C:\\Noesis_Academy\\Robot_Framework\\test_1.pdf
    Click Button                //button[text()="Upload Single File"]
    Choose File                 //input[@id="multipleFilesInput"]       C:\\Noesis_Academy\\Robot_Framework\\test_1.pdf
    Click Button                //button[text()="Upload Multiple Files"]
    Capture Page Screenshot
    Sleep                       5
    Close Browser
    

Login no site saucedemo
    [Tags]                  login
    Login site saucedemo
    Element Text Should Be  //div[text()="Swag Labs"]   Swag Labs
    Sleep                   5
    Close Browser

Adicionar um produto ao carrinho no site saucedemo
    [Tags]                  carrinho
    Login site saucedemo
    Adicionar item ao carrinho 
    Sleep                   4   
    Close Browser

Eliminar um produto do carrinho no site saucedemo
    [Tags]                  eliminar
    Login site saucedemo
    Adicionar item ao carrinho
    Click Button        //button[text()="Remove"]
    Sleep               3
    Close Browser

Alerts e Popups
    [Tags]                  alertas
    Open Browser            https://testautomationpractice.blogspot.com/  chrome
    Maximize Browser Window 
    Click Button            //button[@id="alertBtn"]  #Como valido o texto que aparece no popup??
    Sleep                   5
    

