*** Settings ***
Library     AppiumLibrary

*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     16
${DEVICE_NAME}          emulator-5554

*** Test Cases ***
Use Browser
    Open Connection To Phone
    Sleep    5s
    Capture Page Screenshot
    # Start browser
    Sleep    1
    Press Keycode    3
    Sleep    1
    Click Element    //android.widget.TextView[@content-desc="Chrome"]

    Sleep    5s
    Capture Page Screenshot
    # Clear existing text and type in URL
    
    Clear Text    com.android.chrome:id/url_bar
    Input Text    com.android.chrome:id/url_bar    https://en.wikipedia.org
    Sleep    5s
    Capture Page Screenshot
    Press Keycode    66
    Sleep    5s
    Capture Page Screenshot
    # KEYCODE_HOME = 3
    Press Keycode    3
    Sleep    5s
    Capture Page Screenshot

Use Phone
    Press Keycode    3
    # Start phone
    Click Element    xpath=//android.widget.TextView[@content-desc="Phone"]
    Sleep    5s
    Capture Page Screenshot
    Click Element    //android.widget.TextView[@resource-id="com.google.android.dialer:id/dialpad_key_letters" and @text="DEF"]
    Sleep    5s
    Capture Page Screenshot
    Click Element
    ...    xpath=//android.widget.FrameLayout[@content-desc="1,"]/android.widget.LinearLayout/android.widget.TextView
    Sleep    1s
    Capture Page Screenshot
    Click Element
    ...    xpath=//android.widget.FrameLayout[@content-desc="2,ABC"]/android.widget.LinearLayout/android.widget.TextView
    Sleep    1s
    Capture Page Screenshot
    Click Element
    ...    xpath=//android.widget.FrameLayout[@content-desc="3,DEF"]/android.widget.LinearLayout/android.widget.TextView
    Sleep    5s
    Press Keycode    3
    Sleep    5s
    Capture Page Screenshot

*** Keywords ***
Open Connection To Phone
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    automationName=UiAutomator2
    ...    newCommandTimeout=2500
