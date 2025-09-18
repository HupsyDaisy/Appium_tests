*** Settings ***
Library     AppiumLibrary


*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     16
${DEVICE_NAME}          emulator-5554


*** Test Cases ***
Biometric Authentication Verify Status 
    Open Connection To Phone
    Sleep    5s
    Capture Page Screenshot
    # Start browser
    Sleep    1
    Press Keycode    3
    Sleep    1
    Click Element    //android.widget.TextView[@content-desc="Predicted app: BitBarSampleApp"]
    Sleep    1
    Click Element    //android.view.ViewGroup[@content-desc="Biometric authentication"]
    Sleep    1
    Click Element    //android.widget.TextView[@text="ASK BIOMETRIC AUTHENTICATION"]
    Sleep    1
    Element Text Should Be    //android.widget.TextView[@content-desc="Authentication status value"]    FAILED    
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