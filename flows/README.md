---
description: >-
  Maestro Flows are YAML-based test scripts that define user journeys for UI
  automation.
---

# Maestro Flows overview

* Maestro Flows
  * == FUNDAMENTAL building blocks of UI automation
  * == user journey's specific segments
    * _Examples:_ Login, Checkout, or Search for an item
    * ways
      * COMPLETE user journeys
      * discrete functional components / == larger test scenarios
  * allows
    * verify REPEATABLE the app behavior | Android, iOS, and Web platforms  

#### Flow's structure

```yaml
# --- Configuration Section ---
appId: com.example.app         # MANDATORY, == appId / to be tested
name: My Login Flow            # OPTIONAL, Customize the Flow name
tags:                          # OPTIONAL, Filter which tests to run
  - smoke-test
env:                           # OPTIONAL, Map of environment variables
  USERNAME: "user@example.com"

---
# --- Commands Section ---
#   == declarative commands / simulate user actions
- launchApp                    # Launches the application
- tapOn: "Username"            # Interacts with the username field
- inputText: ${USERNAME}       # Inputs the environment variable
- tapOn: "Login"               # Taps the login button
- assertVisible: "Welcome"     # Verifies success message appears
```
