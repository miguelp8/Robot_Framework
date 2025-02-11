*** Settings ***
Library     SeleniumLibrary
Library     DateTime

*** Variables ***

${browser}  chrome

# saucedemo #
# Dados #
${URL_saucedmo}     https://www.saucedemo.com/

&{saucedemo}        login=standard_user     password=secret_sauce


# testautomationpractice #
${URL_testautomationpractice}   https://testautomationpractice.blogspot.com/

${name}         Noesis Academy
${email}        noesis@email.pt
${phone}        967777896
${adress}       Rua da Noesis

${gender}       male
${country}      canada
${colors}       2
${sorted_list}  Deer
      
${month}                 5
${year}                  2015
${start_date}           01/24/2025
${end_date}             01/31/2025

${file}                 C:\\Noesis_Academy\\Robot_Framework\\test_1.pdf






