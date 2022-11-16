*** Settings ***
Resource                  ../resources/common.robot
Library                   QWeb
Suite Setup               Open Browser                about:blank                 chrome
Suite Teardown            Close All Browsers

*** Test Cases ***

loginTest
    [Documentation]
    [Tags]
    GoTo                  https://orgfcb8dffb.crm.dynamics.com/
    TypeText              Email, phone, or Skype      hidde.visser2@gmail.com
    ClickText             Next
    # TypeSecret            Password                    ^8^2CWv7W$jkFf1
    TypeSecret            Password                    ${password}
    ClickText             Sign in
    ClickText             No
    ClickText             Proefversie van Sales

HealingTest
    [Documentation]
    [Tags]
    ClickText         Accounts

CreateAccount
    [Documentation]
    [Tags]
    ClickText             Accounts
    ClickText             Nieuw                       anchor=Hiermee maakt u een nieuwe record Account.
    VerifyText            Snelle invoer: Account
    
    ClickText             Accountnaam                 anchor=Details
    TypeText              Accountnaam                 Test
    
    ClickText             Telefoon 1
    TypeText              Een telefoonnummer opgeven                              0612345678
    
    ClickText             Jaaromzet
    TypeText              Jaaromzet                   600000
    
    ClickText             Aantal werknemers
    TypeText              Aantal werknemers           25
    
    ClickText             Beschrijving
    TypeText              Beschrijving                Testing description
    
    ClickText             Adres 1
    TypeText              Adres 1                     Teststraat 12
    
    ClickText             Plaats
    TypeText              Plaats                      Amsterdam
    
    ClickText             Postcode
    TypeText              Postcode                    2121AA
    
    ClickText             Opslaan en sluiten
    VerifyText            Test

DeleteAccount
    [Documentation]
    [Tags]
    ClickText             Test
    VerifyInputElement    Accountnaam                 Test
    ClickText             Verwijderen                 anchor=Verwijder Accounts. Deze actie kan niet ongedaan worden gemaakt.
    ClickText             Verwijderen                 anchor=Klik op Verwijderen om door te gaan met het verwijderen van de/het Account.

CreatePotentialCustomer
    [Documentation]
    [Tags]
    ClickText             Potentiële klanten
    ClickText             Nieuw                       anchor=Grafiek weergeven

    VerifyText            Snelle invoer: Potentiële klant

    ClickText             Onderwerp                   anchor=Details
    TypeText              Onderwerp                   test

    ClickText             Budgetbedrag
    TypeText             Budgetbedrag                 60000

    ClickText             Aankooptijdsbestek
    DropDown              Aankooptijdsbestek          Dit kwartaal

    ClickText             Bron van potentiële klant
    DropDown              Bron van potentiële klant                               Beurs

    ClickText             Voornaam
    TypeText             Voornaam                        Test

    ClickText             Achternaam
    TypeText             Achternaam                      Tester

    ClickText             Functie
    TypeText             Functie                        Solution engineer

    ClickText             Bedrijfsnaam
    TypeText             Bedrijfsnaam                   Copado

    ClickText             E-mailadres
    TypeText             E-mailadres                    hvisser@copado.com

    ClickText             Mobiele telefoon
    TypeText             Mobiele telefoon               0612345678

    ClickText             Beschrijving
    TypeText             Beschrijving                   Test beschrijving

    ClickText             Opslaan en sluiten
    VerifyText            Tester, Test

RemovePotentialCustomer
    [Documentation]
    [Tags]
    ClickText             Potentiële klanten
    ClickText             Tester, Test
    VerifyInputElement    Voornaam                    Test
    ClickText             Verwijderen
    ClickText             Verwijderen                 anchor=Wilt u Potentiële klant verwijderen? U kunt deze actie niet ongedaan maken.

CreateTask
    [Documentation]
    [Tags]
    CreateOpenTask