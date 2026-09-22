---
description: Step-by-step installation guide for Maestro CLI on macOS, Windows, and Linux.
---

# How to install Maestro CLI

* supported OS
  * macOS
  * Windows
  * Linux

### Prerequisites

* Java v17+
  * -- by -- set up `JAVA_HOME` environment variable

### Installation

* `maestro --help`
  * check Maestro CLI is installed PROPERLY

#### | macOS

* ways
  * `curl -fsSL "https://get.maestro.mobile.dev" | bash`
  * -- via -- `homebrew`

    ```bash
    brew tap mobile-dev-inc/tap
    brew trust --formula mobile-dev-inc/tap/maestro
    brew install mobile-dev-inc/tap/maestro
    ```

#### | Windows

* steps
  * [download the latest maestro.zip](https://github.com/mobile-dev-inc/maestro/releases/latest/download/maestro.zip)
  * extract the content | a stable location
  * | PowerShell
    * add the Maestro "bin/" | your environment variables

        ```powershell
        # 
        setx PATH "%PATH%;C:\maestro\bin"
        ```
  * restart your terminal

#### | Windows (WSL)

* use case
  * ⚠️ONLY if it is STRICTLY NECESSARY⚠️
    * == ❌NOT recommended❌
      * Reason:🧠it requires ADVANCED port configuration🧠
        * -> it can cause: issues | testing your app
    
* allows
  * use a Linux environment / Android emulators run | your Windows host

* steps
  * install Java 17+

    ```bash
    sudo apt update
    sudo apt install openjdk-17-jdk
    ```
  * | "~/.bashrc" OR "~/.zshrc",

    ```bash
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
    export PATH=$JAVA_HOME/bin:$PATH
    export PATH=$PATH:$HOME/.maestro/bin
    ```
  * `source ~/.bashrc`
  * `curl -fsSL "https://get.maestro.mobile.dev" | bash`
  * setup Android environment
    * == set up the Android CL tools MANUALLY
      * Reason:🧠you can NOT run the Android Studio GUI DIRECTLY | WSL easily🧠 
    * steps
      * `mkdir -p $HOME/Android/cmdline-tools`
      * download the latest [CL tools for Linux](https://developer.android.com/studio#command-tools) & unzip it 

        ```bash
        cd $HOME/Android/cmdline-tools
        # Replace with the actual URL for the latest version
        wget https://dl.google.com/android/repository/commandlinetools-linux-14742923_latest.zip -O cmdline-tools.zip
        unzip cmdline-tools.zip
        mv cmdline-tools latest
        rm cmdline-tools.zip
        ```
      * | your "~/.bashrc"

        ```bash
        # --- Android PATH ---
        export ANDROID_HOME=$HOME/Android
        export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
        export PATH=$PATH:$ANDROID_HOME/platform-tools
        ```
      * `source ~/.bashrc.`
      * `sdkmanager --install "platform-tools"`
  * connect -- to -- Windows Emulator
    * 's goal
      * | WSL, bridge bridge ADB -- to -- Windows
    * steps
      * | Windows (PowerShell)
        * `adb -a -P 5037 nodaemon server`
          * Problems:
            * Problem1: "The term 'adb' is not recognized"
              * Solution:
                * | Windows PowerShell,
                  * `[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$env:LOCALAPPDATA\Android\Sdk\platform-tools", "User")`
                * restart Windows PowerShell terminal
            * Problem2: "cannot bind to 0.0.0.0:5037"
              * Reason:🧠ANOTHER adb is ALREADY running🧠
              * Solution: 
                * close Android Studio
                * `taskkill /F /IM adb.exe`
                * start the ADB server again
          * ❌NOT close this PowerShell window❌ 
            * Reason:🧠it keeps the connection alive🧠
      * | Windows,
        * open Android Studio
        * launch -- , via Windows emulator, -- virtual device
  * `maestro --host <WINDOWS_IP> test flow.yaml`

#### Linux

* `curl -fsSL "https://get.maestro.mobile.dev" | bash`
