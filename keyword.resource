*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Resource    variables.resource
Resource    objects.resource


*** Keywords ***

Validar Diferenca Entre Datas
   [Arguments]         ${start_date}    ${end_date}

    ${start}   Convert Date    ${start_date}    result_format=%Y-%m-%d
    ${end}     Convert Date    ${end_date}      result_format=%Y-%m-%d
    ${diff}    Subtract Date From Date    ${end}    ${start}

    ${num}   Evaluate    ${diff}/ 86400
    ${num}   Convert To Integer   ${num}
    ${num}   Convert To String    ${num}
    RETURN   ${num}

Login site saucedemo
    Open Browser            ${URL_saucedmo}  ${browser}
    Maximize Browser Window
    Input Text              ${locator_input["login"]}         ${saucedemo["login"]}
    Input Text              ${locator_input["password"]}      ${saucedemo["password"]}
    Click Element           ${locator_button}
    Element Text Should Be  ${locator_logo}         Swag Labs

Adicionar item ao carrinho 
    Click Button            ${locator_adicionar_item_bikelight}
    Click Element           ${locator_clicar_carrinho}  
    Element Text Should Be  ${locator_name_item}             Sauce Labs Bike Light
