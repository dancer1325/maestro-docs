# Run your first test with the Maestro CLI

In this tutorial, you will write and execute your first Maestro Flow using the CLI.
* You will create a test that automates the process of adding a new contact to an Android device using the native Contacts app.

### Prerequisites

Ensure you have the following ready before starting:

* **Maestro CLI**: Installed and configured on your local machine. If not yet installed, follow the [how-to-install-maestro-cli](how-to-install-maestro-cli/) guide.
* **Android Studio**: Used to manage and launch virtual devices. See the [QuickStart](../introduction/get-started/quickstart.md) guide.

## Step 1: Start the Android emulator

Maestro requires an active device or emulator to interact with the application UI.
* This example uses Android Emulator to run an emulated Android device:

1. Open **Android Studio**.
2. Navigate to the **Virtual Device Manager**.
3. Launch a virtual device (e.g., Pixel 8 or similar).
4. Wait for the device to appear in your home screen.

![](.gitbook/assets/run-maestro-cli-1.gif)

## Step 2: Create the Flow file

A Flow is a YAML file containing the commands Maestro executes.
* For this tutorial, we will use the system's default Contacts app (`com.google.android.contacts`), which is pre-installed on standard Android emulators:

1. Create a new directory for your test and navigate into it.
2. Create a file named `contacts.yaml`.
3. Copy and paste the following content:

```yaml
appId: com.google.android.contacts
---
- launchApp:
    clearState: true              # Resets the app to a fresh state before starting
- startRecording: recording       # Starts capturing a video of the execution
- tapOn: "Allow"                  # Handles system permission dialog if it appears
- tapOn: Create contact
- tapOn: First name
- inputText: John
- tapOn: Last name
- inputText: Doe
- tapOn: Company
- inputText: Maestro
- tapOn: "+1"
- inputText: 111-111-1111
- tapOn: Save
- back                            # Returns to the main contact list
- stopRecording                   # Saves the video file
```

> If you don't know how to create and structure Flows, access the [Flows documentation](../flows/README.md).

> **Download and use Maestro samples**
>
> The Maestro CLI provides the `download-samples` command, which lets you download a curated collection of Flow files to help you learn Maestro.
> Run `maestro download-samples` to get started.

## Step 3: Run the Flow

With the emulator running and your YAML file ready, you can now execute the test:

1. Open your terminal.
2. Run the following command:

```bash
maestro test contacts.yaml
```

> To see all the options and commands available when using the Maestro CLI, [access the Maestro CLI reference](maestro-cli-commands-and-options.md).

> **Troubleshooting: Connection timeouts**
>
> If your CI runner fails to start the Maestro driver within the default timeframe, you may see a timeout error.
> The default timeout is 15 seconds (15000 ms) for Android and 120 seconds (120000 ms) for iOS.
> You can extend this by setting a custom millisecond value:
>
> ```bash
> export MAESTRO_DRIVER_STARTUP_TIMEOUT=180000
> ```

Maestro will connect to the emulator and execute the steps sequentially.
* You will see a live progress report in your terminal.

![](.gitbook/assets/image.png)

**What happens during execution:**

1. Maestro begins capturing the screen.
2. The Contacts app opens and resets any existing state.
3. Maestro identifies fields by their text or accessibility labels and inputs names and phone numbers.
4. The contact is saved, and the app navigates back to the list view.
5. The recording stops, and a file named `recording.mp4` is saved to your directory.

### Final Outcome

Once the test completes, check your folder for the `recording.mp4` file.
* It should display the automated process exactly as seen in the example below:

![](.gitbook/assets/demo-contacts-cli-maestro.gif)

### Next steps

Now that you have executed your first Flow, you are ready to explore the deeper capabilities of Maestro:

* [Flows](../flows/flow-control-and-logic/flow-control-and-logic-overview.md) — build resilient, intelligent journeys using modular subflows, conditional execution, and repetitive loops.
* [Selectors](../flows/flow-control-and-logic/how-to-use-selectors.md) — learn how Maestro identifies UI elements when testing your app.
* [JavaScript](../flows/javascript/javascript-overview.md) — extend your YAML logic with JavaScript.
* [Workspace management](../flows/workspace-management/workspace-management-overview.md) — organize your test suite for larger projects.
