*** Settings ***
Documentation          Android Flight Apps testing with robot framework
Library                AppiumLibrary

*** Variables ***
${remote_host}                http://localhost:4723/wd/hub
${PlatformNames}              Android
${DeviceNames}                emulator-5574
${AppPackages}                com.example.myapplication
${AppActivitys}               com.example.myapplication.MainActivity

*** Keywords ***
Open AppFlight Aplication
    Open Application           ${remote_host} 
    ...                        platformName=${PlatformNames}    
    ...                        deviceName=${DeviceNames}    
    ...                        appPackage=${AppPackages}    
    ...                        appActivity=${AppActivitys}

Tap button Login
    Wait Until Element Is Visible          id=com.example.myapplication:id/login  
    Click Element                          id=com.example.myapplication:id/login

Input username
    [Arguments]                ${userName}
    Wait Until Element Is Visible          id=com.example.myapplication:id/username
    Input Text                             id=com.example.myapplication:id/username        ${userName}

Input passwords
    [Arguments]                ${passWord}
    Input Text                             id=com.example.myapplication:id/password        ${passWord}

Tap button SingIn
    Tap                                    id=com.example.myapplication:id/signIn

Verification successful login
    Wait Until Element Is Visible          id=com.example.myapplication:id/textView
    Page Should Contain Element            id=com.example.myapplication:id/textView


Verification failed login
    Page Should Contain Text               Invalid username/password
  