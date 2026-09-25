* goal
  * write & execute -- , via Maestro CLI, -- your first Maestro Flow  

# Run your first test with the Maestro CLI

## Prerequisites

* [install Maestro CLI](how-to-install-maestro-cli/)
* [platform specific setup](../introduction/get-started/quickstart.md#platform-specific-setup)

## Step 1: Start the Android emulator

* Reason to start an emulator or simulator: 🧠Maestro needs it to interact -- with -- the application UI🧠

* steps
  * | Android Studio, > "Virtual Device Manager" > launch a virtual device

![](.gitbook/assets/run-maestro-cli-1.gif)

## Step 2: Create the Flow file

## Step 3: Run the Flow

* steps
  * | [here](examples/run-your-first-test-with-the-maestro-cli),
    * `maestro test contacts.yaml`
      * Problems:
        * Problem1: "Connection timeouts"
          * Solution: `export MAESTRO_DRIVER_STARTUP_TIMEOUT=180000`
          * Reason:🧠 default timeout
            * | Android, 15"
            * | iOS, 120 seconds

![](.gitbook/assets/image.png)

## Final Outcome

* | [default output directory](../flows/workspace-management/test-reports-and-artifacts.md)
  * check your "recording.mp4"

![](.gitbook/assets/demo-contacts-cli-maestro.gif)

## Notes

* `maestro download-samples`
  * lets you
    * download a curated collection of Flow files
