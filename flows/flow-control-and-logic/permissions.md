---
description: Configure app permissions on launch or mid-flow for iOS and Android testing.
---

# Permissions

* system permissions
  * == COMMON challenge | mobile test automation /
    * can make test journey is inconsistent
      * Reason:🧠ONLY appear 1!🧠
      * SOLUTION: 🧠reset the app state🧠
  * _Examples:_ OS prompts ("Allow Camera Access", ...)

* Maestro
  * enable you to 
    * configure permissions 
      * ensuring a PREDICTABLE environment
      * | 
        * [launch time]()
        * flow time 

## ways to configure permissions
### | launch time

* == | [`launchApp`](../../api-reference/commands-available/launchapp.md) command
  * by default, Maestro grants ALL permissions 
* == the easiest way to manage permissions 

### | mid-flow

TODO: 
Sometimes you need to change permissions while the app is running, for example, to test how your app handles a permission denial or to prepare for a specific feature flow like scanning a QR code
* Use the [`setPermissions`](../../api-reference/commands-available/setpermissions.md) command for this purpose.

#### Browser limitation

Maestro can manage permissions for iOS and Android applications, but it has no control over Chrome’s system permissions.
{% endhint %}

### Available permissions

Maestro uses standardized names to make your Flows cross-platform
* For example, using `bluetooth` on Android targets both `BLUETOOTH_CONNECT` and `BLUETOOTH_SCAN` automatically.

The following table list all permissions available in iOS and Android.

| Permission      | iOS | Android |
| --------------- | --- | ------- |
| `bluetooth`     | ❌   | ✅       |
| `calendar`      | ✅   | ✅       |
| `camera`        | ✅   | ✅       |
| `contacts`      | ✅   | ✅       |
| `health`        | ❌   | ❌       |
| `homekit`       | ✅   | ❌       |
| `location`      | ✅   | ✅       |
| `medialibrary`  | ✅   | ✅       |
| `microphone`    | ✅   | ✅       |
| `motion`        | ✅   | ❌       |
| `notifications` | ✅   | ✅       |
| `phone`         | ❌   | ✅       |
| `photos`        | ✅   | ❌       |
| `reminders`     | ✅   | ❌       |
| `siri`          | ✅   | ❌       |
| `sms`           | ❌   | ✅       |
| `speech`        | ✅   | ❌       |
| `storage`       | ❌   | ✅       |
| `usertracking`  | ✅   | ❌       |

{% hint style="success" %}
To grant all available permissions, use `all: allow` to represent all the permissions that the app can request.
{% endhint %}

#### **Android custom permissions**

If a specific Android permission isn't listed above, you can use the full Android Permission ID
* The following example adds the `ADD_VOICEMAIL` permission:

```yaml
- setPermissions:
    permissions:
      com.android.voicemail.permission.ADD_VOICEMAIL: allow
```

{% hint style="info" %}
Note that `all: allow` also covers custom permissions, so you don't need to specify them individually unless you want to deny everything else.
{% endhint %}

#### Android special permissions

Not all permissions are prompted for in the app, like location is
* Some require the user to leave the app and grant the permission within the Settings app.

`android.permission.MANAGE_EXTERNAL_STORAGE` permission has been required since Android 12 if an app wished to access files that weren't its own (e.g. file browsers, virus scanners).&#x20;

Maestro can manage this like other permissions without additional user interaction, acting like an app's "second use" rather than first use
* If it's declared in the app's AndroidManifest.xml then it'll be set automatically
* If you want fine grained control, do as with custom permissions:

```yaml
- launchApp:
    clearState: true
    permissions:
      android.permission.MANAGE_EXTERNAL_STORAGE: deny
```

### Permission values

You can set permissions to one of the following states:

| Value   | Description                                                                                                                        |
| ------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `allow` | Grants the permission. On iOS, this also automatically dismisses the system prompt.                                                |
| `deny`  | Denies the permission. Android will request permission during the Flow execution if the app requires access to a specific feature. |
| `unset` | Resets the permission state, causing the system to prompt permission requests when running the Flow.                               |

Permission values can come from a variable or a JavaScript expression instead of being hard-coded:

```yaml
appId: com.example.app
env:
  CAMERA_PERMISSION_STATE: deny
---
- launchApp:
    permissions:
      camera: ${CAMERA_PERMISSION_STATE}
```

This lets one Flow cover both the granted and the denied journey, driven by `--env` or by the `env` block of the calling Flow.

#### Push notifications | iOS

* grant permissions
  * | iOS,
    * system prompt appears & Maestro AUTOMATICALLY taps "Allow"
    * ❌!= grant SILENTLY❌ 
  * | Android, 
    * it's granted SILENTLY
      * == WITHOUT a prompt

#### iOS-specific values

iOS supports additional granular values for certain permissions.

| Permission | Value     | Description                                     |
| ---------- | --------- | ----------------------------------------------- |
| `location` | `always`  | Grants **Always Allow** location access.        |
|            | `inuse`   | Grants **While Using the App** location access. |
|            | `never`   | Same as `deny`.                                 |
| `photos`   | `limited` | Grants **Limited Access** to the photo library. |

### Usage examples

#### Deny all permissions

To ensure your app handles permission denied states, start your Flow by denying everything
* This forces you to handle the edge cases where a user declines a system permission prompt.

```yaml
- launchApp:
    permissions:
        all: deny
```

#### Deny all but allow specific ones

This is a common pattern for testing specific features in isolation.

```yaml
- launchApp:
    permissions:
        all: deny
        medialibrary: allow
```

### Related resources&#xD;

* [`launchApp`](../../api-reference/commands-available/launchapp.md): See the full reference for launching apps.
* &#x20;[`setPermissions`](../../api-reference/commands-available/setpermissions.md): Command for altering permissions configuration mid-flow.
