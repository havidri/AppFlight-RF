*** Settings ***
Resource                ../keywordFlight.robot

*** Keywords ***
User with valid username
    Tap button Login
    Input username     support@ngendigital.com
    Input passwords    abc123
    Tap button SingIn
    Verification successful login