*** Settings ***
Library     AppiumLibrary

Test Setup    Start Demo
Test Teardown    Go Home


*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     16
${DEVICE_NAME}          emulator-5554


*** Test Cases ***

Buy Stuff
    Login To Demoapp
    Sleep    1
    Click Element    //android.widget.TextView[@content-desc="store item text" and @text="Sauce Labs Backpack"]
    Sleep    1
    Click Element     //android.view.ViewGroup[@content-desc="blue circle"]/android.view.ViewGroup
    Sleep    1
    Click Element    //android.view.ViewGroup[@content-desc="Add To Cart button"]
    Sleep    1
    Click Element    //android.view.ViewGroup[@content-desc="cart badge"]/android.widget.ImageView
    Sleep    1
    Element Text Should Be    //android.widget.TextView[@content-desc="total number"]    1 item
    Sleep     1
    Click Element    //android.view.ViewGroup[@content-desc="Proceed To Checkout button"]
    Sleep    1
    Input Text    //android.widget.EditText[@content-desc="Full Name* input field"]    Testi
    Sleep    1
    Input Text    //android.widget.EditText[@content-desc="Address Line 1* input field"]    Kuja 1
    Sleep    1
    Input Text    //android.widget.EditText[@content-desc="City* input field"]    Testicity
    Sleep    1
    Input Text    //android.widget.EditText[@content-desc="Zip Code* input field"]    010101
    Sleep    1
    Input Text    //android.widget.EditText[@content-desc="Country* input field"]    Testilandia
    Click Element    //android.view.ViewGroup[@content-desc="To Payment button"]
    Sleep    1
    Input Text    //android.widget.EditText[@content-desc="Full Name* input field"]    Testi
    Sleep    1
    Input Text    //android.widget.EditText[@content-desc="Card Number* input field"]    1000 1111 1111 1111
    Sleep    1
    Input Text    //android.widget.EditText[@content-desc="Expiration Date* input field"]    10/26
    Sleep    1
    Input Text    //android.widget.EditText[@content-desc="Security Code* input field"]    000
    Click Element    //android.view.ViewGroup[@content-desc="Review Order button"]
    Sleep    2
    Click Element    //android.view.ViewGroup[@content-desc="Review Order button"]
    Sleep    1
    Click Element    //android.view.ViewGroup[@content-desc="Place Order button"]
    Sleep    1
    Element Should Contain Text    //android.widget.TextView[@text="Checkout Complete"]    Checkout Complete
    Sleep    1
    Click Element    //android.view.ViewGroup[@content-desc="open menu"]/android.widget.ImageView
    Sleep    1
    Click Text    Log Out
    Sleep    1
    Click Element    //android.widget.Button[@resource-id="android:id/button1"]
    Sleep    1
    Element Should Contain Text    //android.widget.TextView[@resource-id="android:id/alertTitle"]
    ...        You are successfully logged out.
    Sleep    1
    Click Element    //android.widget.Button[@resource-id="android:id/button1"]


*** Keywords ***
Open Connection To Phone
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    automationName=UiAutomator2
    ...    newCommandTimeout=2500

Start Demo
    Open Connection To Phone
    Sleep    5s
    Capture Page Screenshot
    Start Screen Recording
    # Start browser
    Sleep    1
    Press Keycode    3
    Sleep    1
    Click Element    //android.widget.TextView[@content-desc="Predicted app: My Demo App"]

Go Home
    Close Application
    Press Keycode    3
    Stop Screen Recording
    Sleep    5s
    
Login To Demoapp 
    Sleep    5s
    Capture Page Screenshot
    Sleep    1
    Click Element    //android.view.ViewGroup[@content-desc="open menu"]/android.widget.ImageView
    Sleep    1
    Click Text    Log In
    Sleep    1
    Click Element    //android.widget.TextView[@text="bob@example.com"]
    Sleep    1
    Click Element    //android.view.ViewGroup[@content-desc="Login button"]