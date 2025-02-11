*** Settings ***
Library   SeleniumLibrary
Library   DateTime
Resource  keyword.resource
Resource  variables.resource
Resource  objects.resource


*** Test Cases ***
Preencher todos os campos
    [Tags]                      preencher
    Open Browser                ${URL_testautomationpractice}   ${browser}
    Maximize Browser Window 
    Input Text                  ${locator_name}     ${name}          
    Input Text                  ${locator_email}    ${email}        
    Input Text                  ${locator_phone}    ${phone}      
    Input Text                  ${locator_adress}   ${adress}        

    Select Radio Button         gender  ${gender}

    Select Checkbox             ${locator_days_01}
    Select Checkbox             ${locator_days_02}
    
    Select From List By Value    ${locator_country}         ${country}     

    Select From List By Index    ${locator_colors}          ${colors}     

    Select From List By Label    ${locator_sorted_list}     ${sorted_list}     
    

    ${TODAY}   Get Current Date    result_format=%m/%d/%Y
    Input Text                  ${locator_data_picker}       ${TODAY}
    Click Element               ${locator_select_data}
    Select From List By Value   ${locator_select_month}       ${month}
    Select From List By Value   ${locator_year}              ${year} 
    Click Element               ${locator_day}

    Input Text                  ${locator_start_date}       ${start_date}
    Input Text                  ${locator_end_date}         ${end_date}

    Click Button                //button[@class="submit-btn"]

    ${result}   Get Text        ${locator_text}                 

    ${num_dias}    Validar Diferenca Entre Datas   2025/01/24  2025/01/31    #Validar se a diferenca da data no texto é igual das diferenças das datas
    Should Contain    ${result}    ${num_dias}                               #Validar se a diferenca da data no texto é igual das diferenças das datas
    
    Element Text Should Be      ${locator_text}         You selected a range of 7 days.

    Choose File                 ${locator_choose_single_file}          ${file}
    Click Button                ${locator_button_single_file} 
    Choose File                 ${locator_choose_multiple_files}       ${file}
    Click Button                ${locator_button_multiple_files}
    Capture Page Screenshot
    Close Browser


Clicar alertas 
    [Tags]                      alertas
    Open Browser                ${URL_testautomationpractice}  ${browser}
    Maximize Browser Window                   
    Click Button                ${locator_simple_alert}
    Handle Alert                ACCEPT
    Click Button                ${locator_prompt_alert}
    Input Text Into Alert       teste123    action=LEAVE
    Sleep                       5


Login no site saucedemo
    [Tags]                  login
    Login site saucedemo
    Close Browser


Adicionar um produto ao carrinho no site saucedemo
    [Tags]                  carrinho
    Login site saucedemo
    Adicionar item ao carrinho
    Close Browser


Validar se o carrinho está vazio
    [Tags]      existe_item
     Login site saucedemo  
     Click Link                         ${locator_entrar_carrinho} 
     Page Should Not Contain Element    ${locator_itens_carrinho}  
    


Eliminar um produto do carrinho no site saucedemo
    [Tags]                  eliminar
    Login site saucedemo
    Click Button    ${locator_adicionar_item_backpack}          #Adiciona o item ao carrinho
    Click Button    ${locator_adicionar_item_bikelight}         #Adiciona o item ao carrinho
    Click Link      ${locator_entrar_carrinho}                  #Entra no carrinho 

    ${existe_item}  Run Keyword And Return Status    Page Should Contain Element   ${locator_itens_carrinho}    #Valida se o item esta no carrinho

    WHILE  ${existe_item}    # Loop = Enquando existir item no carrinho ele ira apagar o primeiro item
        Click Element    //div[@data-test="inventory-item"][1]//button   #Exclui o item no carrinho
        ${existe_item}  Run Keyword And Return Status    Page Should Contain Element   ${locator_itens_carrinho}   #Valida se o item esta no carrinho
    END 





