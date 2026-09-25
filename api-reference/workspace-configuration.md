---
description: >-
  Reference for all config.yaml properties: appId, flows, env, and platform
  settings.
---

* goal
  * configure global settings for your Maestro workspace to customize behavior across all flows.

# Workspace configuration -- "config.yaml" --

* "config.yaml"
  * == workspace configuration file
  * ways to place
    * | your project's 
      * root
      * ".maestro/"
  * sections
    * Global
    * Execution
    * Platform-specific
    * Maestro Cloud

### global

| Key                                                                         | Description                                                                                                                                                                                                                                                           |
|-----------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [`flows`](../flows/README.md)                  | Glob patterns defining which files to include in a test suite <br/> Defaults to `*` (only YAML files in the root folder) <br/> Use `**` for recursive discovery <br/> Prefix a pattern with `!` to exclude matching files; at least one positive pattern is required. |
| [`testOutputDir`](../flows/workspace-management/test-reports-and-artifacts) | == directory \| save screenshots + logs + metadata  <br/> by default, "~/.maestro/tests/"                                                                                                                                                                             |

### Execution & filtering

* allows
  * | run a test suite,
    * control the order & selection of tests

TODO:

| **Key**                                                                                                                        | **Description**                                                                                    |
| ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------- |
| [`includeTags`](../flows/workspace-management/test-discovery-and-tags.md)                   | Only executes Flows that contain at least one of these tags in their internal configuration.       |
| [`excludeTags`](../flows/workspace-management/test-discovery-and-tags.md)                   | Skips any Flows that contain one or more of these tags.                                            |
| [`executionOrder`](../flows/workspace-management/sequential-execution.md)                   | A nested object used to force a specific sequence of Flows.                                        |
| [`executionOrder.continueOnFailure`](../flows/workspace-management/sequential-execution.md) | If `false`, Maestro stops the sequential execution immediately if a Flow fails. Default is `true`. |
| [`executionOrder.flowsOrder`](../flows/workspace-management/sequential-execution.md)        | The ordered list of Flow names or filenames (without `.yaml`) to execute sequentially.             |

### Platform configuration

Platform-specific settings allow you to optimize the environment for Android or iOS.

| **Key (iOS specifics)**      | **Description**                                                                                                                                                                                                                                                                                                           |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `disableAnimations`          | **(Cloud only)** Enables Reduce Motion on the iOS Simulator to prevent flakiness caused by system-level animations.                                                                                                                                                                                                       |
| `snapshotKeyHonorModalViews` | <p>You can use this key when running tests locally or on the cloud.</p><p></p><p>If <code>false</code>, Maestro includes elements from the background hierarchy even when a modal is present. Useful for certain custom UI frameworks. This helps capture elements that have absolute positioning into the hierarchy.</p> |

| **Key (Android specifics)** | **Description**                                                                                             |
| --------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `disableAnimations`         | **(Cloud only)** Disables system-level window, transition, and animator animations on the Android Emulator. |

### Maestro cloud configuration

* == configuration | run tests | [Maestro Cloud](../cloud/README.md)

TODO:

| **Key**                          | **Description**                                                       |
| -------------------------------- | --------------------------------------------------------------------- |
| `baselineBranch`                 | Defines the source-of-truth branch (e.g., `main`) for PR comparisons. |
| `notifications`                  | Configures automated alerts upon test completion.                     |
| `notifications.email.enabled`    | Set to `true` to enable email notifications.                          |
| `notifications.email.recipients` | A list of email addresses to receive the test reports.                |
| `notifications.slack.endpoint`   | The Webhook URL for posting results directly to a Slack channel.      |
