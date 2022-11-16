*** Settings ***
Resource                  ../resources/common.robot
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***

loginTest
    [Documentation]
    [Tags]
    GoTo                  https://orgfcb8dffb.crm.dynamics.com/
    TypeText              Email, phone, or Skype      hidde.visser2@gmail.com
    ClickText             Next
    TypeSecret            Password                    ^8^2CWv7W$jkFf1
    ClickText             Sign in
    ClickText             No

CreateAccount
    [Documentation]
    [Tags]
    ClickText             Accounts
    ClickText             Nieuw                       anchor=Hiermee maakt u een nieuwe record Account.
    TypeText              Accountnaam                 Test
    TypeText              Een telefoonnummer opgeven                              0612345678
    TypeText              Jaaromzet                   600000
    TypeText              Aantal werknemers           25
    TypeText              Beschrijving                Testing description
    TypeText              Adres 1                     Teststraat 12
    TypeText              Plaats                      Amsterdam
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
    ClickText             Nieuw

    ClickText             Onderwerp                   anchor=Visitekaartje scannen
    WriteText             test

    ClickText             Budgetbedrag
    WriteText             60000

    ClickText             Aankooptijdsbestek
    DropDown              Aankooptijdsbestek          Dit kwartaal

    ClickText             Bron van potentiële klant
    DropDown              Bron van potentiële klant                               Beurs

    ClickText             Voornaam
    WriteText             Test

    ClickText             Achternaam
    WriteText             Tester

    ClickText             Functie
    WriteText             Solution engineer

    ClickText             Bedrijfsnaam
    WriteText             Copado

    ClickText             E-mailadres
    WriteText             hvisser@copado.com

    ClickText             Mobiele telefoon
    WriteText             0612345678

    ClickText             Beschrijving
    WriteText             Test beschrijving

    ClickText             Opslaan en sluiten
    VerifyText            Tester, Test

RemovePotentialCustomer
    [Documentation]
    [Tags]
    ClickText    Potentiële klanten
    ClickText    Tester, Test
    VerifyInputElement    Voornaam    Test
    ClickText             Verwijderen
    ClickText    Verwijderen    anchor=Wilt u Potentiële klant verwijderen? U kunt deze actie niet ongedaan maken.

CreateTask
    [Documentation]
    [Tags]
    CreateOpenTask
