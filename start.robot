*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${login}            Admin
${password}         admin123
${simples}          Noesis Academy
@{Dias_da_semana}   Domingo  Segunda  Terça  Quarta  Quinta  Sexta  Sabado
&{Cadastro}         nome=Miguel  email=miguel@noesis.pt  mae=Natalia

*** Keywords ***
Aceder à aplicação
    Open Browser  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login  chrome
    Maximize Browser Window
    Wait Until Element Is Enabled  xpath://input[@name="username"]  20
    Input Text    xpath://input[@name="username"]  ${login}
    Input Text    xpath://input[@name="password"]  ${password}
    Click Button  xpath://button[text()=" Login "]  
    Page Should Contain Image       //img[@src="/web/images/orange.png?v=1721393199309"]
    Capture Page Screenshot


*** Test Cases ***
Login com user e password correta
    [Tags]  Login
    Aceder à aplicação
    Click Link                      //a[@href="/web/index.php/admin/viewAdminModule"]
    Element Should Be Visible       //h6[text()="User Management"]


Analisar Variaveis
    [Tags]  var 
    Log To Console      ${simples}
    Log To Console      ${Dias_da_semana[6]}
    Log To Console      ${Cadastro.mae}