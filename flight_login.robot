*** Settings ***
Resource                keywordFlight.robot
Test Setup              Open AppFlight Aplication
Test Teardown           Close Application


*** Test Cases ***
User should be able login with valid username
    Tap button Login
    Input username     support@ngendigital.com
    Input passwords    abc123
    Tap button SingIn
    Verification successful login

User should not be able login with invalid username
    Tap button Login
    Input username     support@ngendigitl.com
    Input passwords    abc1231
    Tap button SingIn
    Verification failed login