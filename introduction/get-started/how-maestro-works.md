---
description: >-
  Learn how Maestro simulates user interactions using the accessibility tree and
  device-level commands.
---

# How Maestro works

* Maestro's behavior
  * == user interactions | device level
  * vs traditional tools
    * ⚠️ABOUT requirements⚠️
      * traditional tools
        * need access -- to -- an app's source code OR internal APIs
      * Maestro
        * ❌NO need❌
          * Reason:🧠Maestro treats the application -- , thanks to OS's built-in accessibility & input interfaces, as -- an opaque system

### The "arm's length" philosophy

* Maestro's "arm's length" operation
  * == 💡framework pilots the device itself💡
    * ❌!= pilot the internal app code❌
    * ->
      * **Platform Agnostic**
        * == consistent experience | HETEROGENEOUS stacks (_Examples:_ Native iOS/Android, React Native, and Flutter)
        * Reason:🧠Maestro interacts -- through -- the Accessibility Tree (== data layer / used -- by -- screen readers)🧠 
      * **Human Simulation**
        * -- by -- sending low-level device commands
          * _Examples:_ tap events, swipe gestures, and text input
        * _Examples:_ "thumbs on a screen" 
      * **System-Wide Control**
        * Since it controls the device, Maestro can interact with elements outside the app, such as system settings, permission dialogs, and notifications.

### Declarative test definition -- ".yaml" --

* [video](https://vimeo.com/744398229?fl=pl&fe=cm)
  * TODO:
