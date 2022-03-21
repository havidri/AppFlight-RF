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
    [Arguments]        ${userName}
    Wait Until Element Is Visible          id=com.example.myapplication:id/username
    Input Text                             id=com.example.myapplication:id/username        ${userName}

Input passwords
    [Arguments]        ${passWord}
    Input Text                             id=com.example.myapplication:id/password        ${passWord}

Tap button SingIn
    Tap                                    id=com.example.myapplication:id/signIn

Verification successful login
    Wait Until Element Is Visible          id=com.example.myapplication:id/textView
    Page Should Contain Element            id=com.example.myapplication:id/textView


Verification failed login
    Page Should Contain Text               Invalid username/password

Tap Booking Flight
    Wait Until Element Is Visible          id=com.example.myapplication:id/book  
    Tap                                    id=com.example.myapplication:id/book

Choose From City
    [Arguments]        ${fromCity}
    Wait Until Element Is Visible          id=com.example.myapplication:id/spinnerFrom
    Tap                                    id=com.example.myapplication:id/spinnerFrom
    Tap                                    //*[contains(@text,"${fromCity}")] 

Choose To City
    [Arguments]        ${toCity}
    Wait Until Element Is Visible          id=com.example.myapplication:id/spinnerTo
    Tap                                    id=com.example.myapplication:id/spinnerTo
    Tap                                    //*[contains(@text,'${toCity}')] 
    
Choose Class
    [Arguments]        ${classFlight}
    Wait Until Element Is Visible         id=com.example.myapplication:id/spinnerClass
    Tap                                   id=com.example.myapplication:id/spinnerClass
    Tap                                   //*[contains(@text,'${classFlight}')] 
    Sleep                                 2

Choice Start Date
    [Arguments]        ${startDate}
    Tap                                   //android.widget.TextView[@text='Start Date']
    Wait Until Element Is Visible         id=android:id/month_view
    Tap                                   //android.view.View[@content-desc="${startDate}"]
    Tap                                   id=android:id/button1

Choice End Date
    [Arguments]        ${endDate}
    Tap                                   //android.widget.TextView[@text='End Date']
    Wait Until Element Is Visible         id=android:id/month_view
    Tap                                   //android.view.View[@content-desc="${endDate}"]
    Tap                                   id=android:id/button1
    
Choose Flight package
    Tap                                    id=com.example.myapplication:id/radioButtonFlight

Checklist Day
    Tap                                    id=com.example.myapplication:id/checkBoxDay

Tap button Book
    Tap                                    id=com.example.myapplication:id/book_flight
    
Verify redirect to page confirm booking
    Wait Until Element Is Visible          id=com.example.myapplication:id/textView6

Choose flight pricing
    Tap                                    id=com.example.myapplication:id/price1

Tap button confirm order
    Tap                                    id=com.example.myapplication:id/confirm_order

Verify reservation flight is booked
    Element Should Be Visible              id=com.example.myapplication:id/checkedTextView