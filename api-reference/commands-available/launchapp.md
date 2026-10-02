---
description: Launch an app with optional permission configuration and clear state.
---

# launchApp

* Launches an application | the target device (Android, iOS, or Web)
  * by default,
    * BEFORE launching it AGAIN, this command stops the running app 

### Parameters

* NEXT parameters
  * provided -- through -- a map

| Parameter       | Description                                                                                                                                                                                         |
| --------------- |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `appId`         | **OPTIONAL** <br/> The package name (Android) or bundle ID (iOS) of the app to launch. If not specified, Maestro launches the app under test using the `appId` defined at the top of the YAML file. |
| `clearState`    | **OPTIONAL** <br/> if `true` -> BEFORE launch, clears the app's state                                                                                                                               |
| `clearKeychain` | **OPTIONAL** <br/> if `true`, clears the ENTIRE iOS Keychain                                                                                                                                        |
| `stopApp`       | **OPTIONAL** <br/> if `false`, the command brings a backgrounded app \| foreground / WITHOUT restarting it <br/> by default, `true`                                                                 |
| `permissions`   | **OPTIONAL** <br/> == map of permissions / grant OR deny OR unset <br/> by default, ALL permissions are ALLOWED <br/> [MORE](../../flows/flow-control-and-logic/permissions.md)                     |
| `arguments`     | **OPTIONAL** <br/> == map of key-value pairs / pass -- to, as launch arguments, -- the app <br/> SUPPORTED values: `string`, `boolean`, `double`, and `integer`                                     |

### Receiving launch arguments

* `arguments`
  * can be consumed | your application code
