*** Settings ***
Resource                pageObject/login.robot
Suite Setup             Open AppFlight Aplication
Suite Teardown          Close Application


*** Test Cases ***
User Booked Flight with One Way
    [Setup]        User with valid username
    Tap Booking Flight
    Choose From City       fromCity=Toronto
    Choose To City         toCity=Paris
    Choose Class           classFlight=Business
    Choice Start Date      startDate=03 August 2019
    Choice End Date        endDate=23 August 2019
    Choose Flight package
    Checklist Day
    Tap button Book
    Verify redirect to page confirm booking
    Choose flight pricing
    Tap button confirm order
    Verify reservation flight is booked