# Maestro CLI overview

* Maestro CLI
  * == CL tool 
    * is
      * open-source
      * single-binary
    * allows
      * running Maestro flows
  * 's goal
    * E2E mobile
    * web UI testing

### how to use?

* steps
  1. [how to install?](how-to-install-maestro-cli)
  2. [how to run your FIRST test](run-your-first-test-with-the-maestro-cli.md)  
  3. [Maestro CLI reference](maestro-cli-commands-and-options.md)
  4. [change -- , by set environment variables, -- the Maestro behaviour](environment-variables.md)

### Maestro CLI features

The CLI serves as the central engine for multiple automation workflows.
* Whether you prefer using Maestro Studio or your own IDE, the CLI handles the execution against emulators, 
simulators or physical devices.

| Feature | Description |
|---|---|
| **Run Local Tests** | Execute tests against a running emulator/simulator or physical device using the command `maestro test flow.yaml`. |
| **Continuous Development** | The Continuous Mode (`maestro test -c`) monitors your YAML test files for changes and automatically restarts the test upon saving. |
| **Device Management** | Create and launch specific emulator or simulator configurations with `maestro start-device`. |
| **Scale to the Cloud** | Upload your Flows to Maestro Cloud to run tests at scale across a variety of managed device configurations. |
| **Debug Tools** | Identification of selectors is simplified with commands like `maestro hierarchy`, which prints the current app's view hierarchy directly to the terminal. |

### Core Features

Maestro is built on the philosophy of "embracing instability," 
providing a suite of features that move beyond traditional automation tools:

| Feature | Description |
|---|---|
| Built-in Tolerance | Automatically handles network delays and UI flakiness by waiting for the screen to "settle" before proceeding. |
| Extensive Commands | A library of commands for UI interactions (`tapOn`, `swipe`), navigation (`launchApp`, `openLink`), and device control. |
| JavaScript Integration | Run JavaScript expressions directly from YAML to manage complex data or perform HTTP requests. |
| Modularity | Create composable subflows that can be reused across multiple tests to keep your automation suite DRY (Don't Repeat Yourself). |
| Flow Recording | The `maestro record` command stitches screen recordings and test output into a shareable MP4 video. |
| AI Analysis | [Beta] Generate LLM-based analysis reports for UI and internationalization issues. |

