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

            ![](../.gitbook/assets/quickstart-create-a-new-test (1).png)

          * | "Add a new test to your workspace" > select "Mobile Test" >
            * | Android
              * Name == Name for your YAML file.
              * App Id == From the dropdown menu, select the App Id for testing. For this QuickStart, select **com.google.android.contacts** from the dropdown menu.

              ![](../.gitbook/assets/image (6).png)
            * | iOS
              * Name == Name for your YAML file.
              * App Id == From the dropdown menu, select the App Id for testing. For this QuickStart, select **com.apple.MobileAddressBook** from the dropdown menu.

              ![](../.gitbook/assets/image (7).png)
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

## Run your FIRST test

* steps
With your first YAML file created, let's add a few commands to perform a search.


{% tabs %}
{% tab title="Android" %}


{% hint style="info" %}
To learn more about the commands you can use to create tests, 
access the [Commands](../../api-reference/README.md "mention")page.

To learn about how you can structure tests, also referred to in Maestro as Flows, 


After pasting, click **Run Locally**
* Watch your virtual device execute the steps automatically
* Maestro Studio will highlight each step as it succeeds or provide a failure reason if an element cannot be found.

![](../.gitbook/assets/2026-02-15_18-41-27.gif)
{% endtab %}

{% tab title="iOS" %}
```yaml

```

The test launches the Address Book app, adds a new contact, and saves the result.

{% hint style="info" %}
To learn more about the commands you can use to create tests, access the [Commands](../../api-reference/README.md "mention") page.

To learn about how you can structure tests, also referred to in Maestro as Flows, access the [Flows](../../flows/README.md "mention").
{% endhint %}

After pasting, click **Run Locally**
* Watch your virtual device execute the steps automatically
* Maestro Studio will highlight each step as it succeeds or provide a failure reason if an element cannot be found.

![](../.gitbook/assets/2026-02-15_18-26-33.gif)
{% endtab %}
{% endtabs %}
{% endstep %}
{% endstepper %}

{% hint style="success" %}
**Interactive Flow authoring**

While this QuickStart focuses on manual YAML, Maestro Studio offers three interactive ways to build your test:

* **Inspect Screen**: Click the **Inspect Screen** button to select elements visually on the device and receive recommended commands.
* **Insert Command**: Click the **Insert Command** button in the IDE to choose from a list of standard actions.
* **Manual Entry**: Type commands directly into the YAML editor for precise control.

<i class="fa-hand-point-right">:hand-point-right:</i> **Access** [Run tests with Maestro Studio](../../maestro-studio/run-tests-with-maestro-studio.md "mention") **for more information.**
{% endhint %}

## Video walkthrough

* [here](https://www.youtube.com/watch?v=E7qwFwo_nu0) 

## Next steps

Now that you’ve seen the power of "arm's length" automation, explore these resources to master the ecosystem:

* Visit the [Maestro Studio](../../maestro-studio/README.md "mention") to learn how to use visual element inspection and the Live REPL to build tests without writing code from scratch.
* If you prefer a programmatic approach or need to integrate tests into your CI/CD pipeline, head to the [Maestro CLI](../../maestro-cli/README.md "mention").
* To learn the best practices for logic, modularity, and nesting, or learn how to add JavaScript scripts to your tests check out the [Flows](../../flows/README.md "mention").
