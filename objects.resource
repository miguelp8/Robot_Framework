*** Settings ***
Library     SeleniumLibrary

*** Variables ***

# saucedemo #
&{locator_input}    login=xpath://input[@data-test="username"]      password=xpath://input[@data-test="password"]
        
${locator_button}   xpath=//input[@id="login-button"]

${locator_logo}     //div[text()="Swag Labs"]

${locator_clicar_carrinho}              //div[@id="shopping_cart_container"]/a
${locator_name_item}                    //div[@class="inventory_item_name"]

${locator_entrar_carrinho}              //a[@data-test="shopping-cart-link"] 
${locator_itens_carrinho}               //div[@data-test="inventory-item"]  

${locator_adicionar_item_backpack}    //button[@id="add-to-cart-sauce-labs-backpack"]
${locator_adicionar_item_bikelight}    //button[@id="add-to-cart-sauce-labs-bike-light"]
 

# testautomationpractice #
${URL_testautomationpractice}   https://testautomationpractice.blogspot.com/

${locator_name}      xpath=//input[@id="name"]                  
${locator_email}     xpath=//input[@id="email"]                 
${locator_phone}     xpath=//input[@id="phone"]                 
${locator_adress}    xpath=//textarea[@id="textarea"]           

${locator_days_01}   xpath=//input[@id="sunday"]
${locator_days_02}   xpath=//input[@id="friday"]

${locator_country}      //select[@id="country"]
${locator_colors}       //select[@id="colors"]
${locator_sorted_list}  //select[@id="animals"]

${locator_data_picker}   //input[@id="datepicker"]
${locator_select_data}   //input[@name="SelectedDate"]
${locator_select_month}  //select[@data-handler="selectMonth"]
${locator_year}          //select[@data-handler="selectYear"]
${locator_day}          //a[@data-date="30"]

${locator_start_date}   //input[@id="start-date"]
${locator_end_date}     //input[@id="end-date"]
${locator_submit}       //button[@class="submit-btn"]

${locator_text}         //div[@id="result"]

${locator_choose_single_file}           //input[@id="singleFileInput"]
${locator_button_single_file}            //button[text()="Upload Single File"]
${locator_choose_multiple_files}        //input[@id="multipleFilesInput"]
${locator_button_multiple_files}        //button[text()="Upload Multiple Files"]

#alertas
${locator_simple_alert}     //button[@id="alertBtn"]
${locator_prompt_alert}     //button[@id="promptBtn"]