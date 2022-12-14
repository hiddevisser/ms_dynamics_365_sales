*** Settings ***
Resource                  ../resources/common.robot
Library                   QWeb
Suite Setup               Open Browser                about:blank                 chrome
Suite Teardown            Close All Browsers

*** Variables ***
${accountname}    Test

*** Test Cases ***

loginTest
    [Documentation]
    [Tags]
    GoTo                  https://orgfcb8dffb.crm.dynamics.com/
    TypeText              Email, phone, or Skype      hidde.visser2@gmail.com
    ClickText             Next
    TypeSecret            Password                    ${password}
    ClickText             Sign in
    ClickText             No
    ClickText             Proefversie van Sales

Recording
    [Documentation]
    [Tags]
    ClickText    Accounts
    ClickText    Nieuw    anchor=Hiermee maakt u een nieuwe record Account.
    TypeText    Accountnaam    Tester
    TypeText    Een telefoonnummer opgeven    0612345678
    TypeText    Jaaromzet    60000


CreateAccount
    [Documentation]
    [Tags]
    ClickText             Accounts
    ClickText             Nieuw                       anchor=Hiermee maakt u een nieuwe record Account.
    VerifyText            Snelle invoer: Account
    
    ClickText             Accountnaam                 anchor=Snelle invoer: Account
    TypeText              Accountnaam                 ${accountname}
    
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
    Set Variable

DeleteAccount
    [Documentation]
    [Tags]
    ClickText             ${accountname}
    VerifyInputElement    Accountnaam                 Test
    ClickText             Verwijderen                 anchor=Verwijder Accounts. Deze actie kan niet ongedaan worden gemaakt.
    ClickText             Verwijderen                 anchor=Klik op Verwijderen om door te gaan met het verwijderen van de/het Account.

CreatePotentialCustomer
    [Documentation]
    [Tags]
    ClickText             Potenti??le klanten
    ClickText             Nieuw                       anchor=Grafiek weergeven

    VerifyText            Snelle invoer: Potenti??le klant

    ClickText             Onderwerp                   anchor=Details
    TypeText              Onderwerp                   test

    ClickText             Budgetbedrag
    TypeText             Budgetbedrag                 60000

    ClickText             Aankooptijdsbestek
    DropDown              Aankooptijdsbestek          Dit kwartaal

    ClickText             Bron van potenti??le klant
    DropDown              Bron van potenti??le klant                               Beurs

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
    ClickText             Potenti??le klanten
    ClickText             Tester, Test
    VerifyInputElement    Voornaam                    Test
    ClickText             Verwijderen
    ClickText             Verwijderen                 anchor=Wilt u Potenti??le klant verwijderen? U kunt deze actie niet ongedaan maken.

CreateTask
    [Documentation]
    [Tags]
    CreateOpenTask