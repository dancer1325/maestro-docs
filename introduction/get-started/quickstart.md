---
description: >-
  Install Maestro Studio, set up your environment, and run your first automated
  test in five minutes.
---

* goal
  * how to 
    * install [Maestro Studio](../../maestro-studio/README.md)
    * set up your environment
    * execute your flow 

# steps
## Platform-specific setup

### | Android

* steps
  * [download & install Android Studio](https://developer.android.com/studio)
  * | Android Studio,
    * \> "More Actions" > "Virtual Device Manager" > "Create Virtual Device (+)" > select a modern device > Start

* supported Android API
  * 29, 30, 31, 33, and 34
  * | Q2 2026,
    * 35 & 36

### | iOS

* steps
  * [download & install Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
  * | Xcode,
    * \> `Settings > Locations` > ensure the "Command Line Tools" are selected
    * \> `Xcode > Open Developer Tool > Simulator` > launch the simulator
      * if there is NO device is AVAILABLE -> 
        * SOLUTIONS:
          * SOLUTION1: `Xcode > Settings > Platforms` > ensure an iOS runtime (iOS 16, 17, 18, or 24) is installed
          * SOLUTION2: if you installed Xcode WITHOUT opening it (_Example:_ -- via -- [`xcodes`](https://github.com/XcodesOrg/xcodes) OR scripted install) -> macOS may NOT have installed Xcode's required system components 
            * -> 
              * CoreSimulator framework is missing
              * simulators will NOT load

            ```bash
            xcodebuild -runFirstLaunch
            
            # If you're prompted to accept the license first, run:
            
            sudo xcodebuild -license accept
            
            # Then restart Maestro Studio
            # iOS simulators should now appear.
            ```

## install Maestro Studio

* -- based on -- OS
  * | [Windows](https://studio.maestro.dev/MaestroStudio.exe)
  * | [macOS](https://studio.maestro.dev/MaestroStudio.dmg)
  * | [Linux](https://studio.maestro.dev/MaestroStudio.AppImage)

    ```bash
    chmod +x MaestroStudio.AppImage
    ./MaestroStudio.AppImage --no-sandbox
    ```

## Create your first test

* steps
  * | Maestro Studio,
    * \> "Choose new workspace location" (== place | store your tests) > "No device connected" > choose your running Android Emulator OR iOS Simulator 
      * ways
        * FROM scratch
          * \> "Create a new test"

            ![](../.gitbook/assets/quickstart-create-a-new-test%20(1).png)

          * | "Add a new test to your workspace" > select "Mobile Test" >
            * | Android
              * Name == Name for your YAML file.
              * App Id == From the dropdown menu, select the App Id for testing. For this QuickStart, select **com.google.android.contacts** from the dropdown menu.

              ![](../.gitbook/assets/image%20(6).png)
            * | iOS
              * Name == Name for your YAML file.
              * App Id == From the dropdown menu, select the App Id for testing. For this QuickStart, select **com.apple.MobileAddressBook** from the dropdown menu.

              ![](../.gitbook/assets/image%20(7).png)
        * FROM EXISTING app
          * \> "Scan file for App Id" option > choose a ".apk" (Android) OR ".app/.zip" (iOS) > "Create Test"
            * == AUTOMATICALLY detect the identifier 
            * generate a MINIMAL "*.yaml" / launch the app

              ```yaml
              appId: com.google.android.contacts
              ---
              - launchApp:
                  clearState: true
              ```

              ```yaml
              appId: com.apple.MobileAddressBook 
              ---
              - launchApp:
                  clearState: true
              ```

* [AVAILABLE commands](../../api-reference/README.md)
* [how to structure the tests](../../flows/README.md)

## Run your FIRST test -- via -- Maestro Studio

* steps
  * | Maestro Studio,
    * click "Run Locally"
      * -> your virtual device execute AUTOMATICALLY the steps
      * _Examples:_

        ![Android](../.gitbook/assets/2026-02-15_18-41-27.gif)
        ![iOS](../.gitbook/assets/2026-02-15_18-26-33.gif)

* [how to run tests -- with -- Maestro Studio](../../maestro-studio/run-tests-with-maestro-studio.md)

## Video walkthrough

* [here](https://www.youtube.com/watch?v=E7qwFwo_nu0)
