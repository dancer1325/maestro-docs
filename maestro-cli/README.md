# Maestro CLI overview

* Maestro CLI
  * == CL tool 
    * is
      * open-source
      * single-binary
    * allows
      * running Maestro flows
    * provide
      * MANY commands
        * UI interactions (`tapOn`, `swipe`)
        * UI navigation (`launchApp`, `openLink`)
        * UI device control
  * 's goal
    * E2E mobile
    * web UI testing
  * how does it work?
    * interprets "*.yaml"
    * sends instructions -- to -- the companion driver | the device
  * use cases
    * | CI

### how to use?

* steps
  1. [how to install?](how-to-install-maestro-cli)
  2. [how to run your FIRST test](run-your-first-test-with-the-maestro-cli.md)  
  3. [Maestro CLI reference](maestro-cli-commands-and-options.md)
  4. [change -- , by set environment variables, -- the Maestro behaviour](environment-variables.md)

### Maestro CLI features

| Feature                    | Description                                                                                                           |
|----------------------------|-----------------------------------------------------------------------------------------------------------------------|
| **Run Local Tests**        | == execute tests vs a running emulator/simulator OR physical device <br/> `maestro test flow.yaml`                    |
| **Continuous Development** | == monitors your "*.yaml" test -- for -- changes / AUTOMATICALLY restarts the test \| saving <br/> `maestro test -c`  |
| **Device Management**      | == create & launch specific emulator OR simulator configurations <br/> `maestro start-device`                         |
| **Scale to the Cloud**     | == upload your Flows \| Maestro Cloud -- to -- run tests at scale \| >1 managed device configurations                 |
| **Debug Tools**            | == identify -- , by printing CURRENT app's view hierarchy \| terminal, -- selectors <br/> `maestro hierarchy`         |
