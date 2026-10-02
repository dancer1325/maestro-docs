---
description: Tap on UI elements by text, ID, or coordinates with optional repeat and delay.
---

# tapOn

* `tapOn` command
  * == MOST common interaction command | Maestro / 
    * performs a tap gesture |
      * a UI element, OR
      * a specific coordinate | screen
  * vs [`longPressOn`](longpresson.md)
    * SAME selectors
    * SAME parameters

### Parameters

| Parameter               | Type          | Description                                                                                                                                                                                                                      |
| ----------------------- | ------------- |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `selector`              | String or Map | ⚠️Required⚠️ <br/> == element \| tap <br/> if you want to use a shorthand text selector (e.g. `"My Text"`) -> use a string <br/> if you want to use OTHER selectors OR to add parameters -> use a map <br/> [MORE](../selectors) |
| `point`                 | String        | TODO: A specific coordinate to tap on the screen or within a selected element. Use relative percentages (e.g. `"50%,50%"`) or absolute pixel values (e.g. `"100,200"`).                                                          |
| `repeat`                | Integer       | == number of times -- to -- repeat the tap                                                                                                                                                                                       |
| `delay`                 | Integer       | == milliseconds delay BETWEEN EACH tap <br/> by default, `100`                                                                                                                                                         |
| `retryTapIfNoChange`    | Boolean       | If `true`, Maestro retries the tap if the UI hierarchy does not change after the initial tap. This is useful for handling early taps before the UI is fully responsive.                                                          |
| `waitToSettleTimeoutMs` | Integer       | The maximum time in milliseconds that Maestro waits for the screen to settle before executing the next command. This is a best-effort timeout; Maestro does not interrupt core operations to honor it.                           |

TODO:

### Usage examples

#### Retry a tap if the UI is unresponsive

If a tap is ignored because the target was not ready yet or an animation is still playing, use `retryTapIfNoChange`
* This example retries the tap if the UI does not change after the first attempt.

```yaml
- tapOn:
    id: "someId"
    retryTapIfNoChange: true
```

#### Tap a specific coordinate

While element selectors are preferred, you can target specific points on the screen
* This example taps the center of the screen.

```yaml
- tapOn:
    point: "50%,50%"
```

This example taps an absolute coordinate on the screen.

```yaml
- tapOn:
    point: "100,200"
```

{% hint style="info" %}
Prefer using element selectors like `id` or `text` over coordinates
* Tapping by coordinate can make tests brittle and device-dependent.
{% endhint %}

#### Tap a coordinate within an element

This example finds an element containing specific text and then taps a point near the end of that element.

```yaml
- tapOn:
    text: "A text with a hyperlink"
    point: "90%,50%"
```

#### Full flow example

This example demonstrates a sequence of commands to add a new contact.

```yaml
appId: com.google.android.contacts
---
- launchApp
- tapOn:
    id: ".*floating_action_button.*" # regex
- inputText: "John"
- tapOn: "Last Name"
- inputText: "Snow"
- tapOn: ".*Save.*"
```

### Related content

* [`longpresson`](longpresson.md)
* [`doubletapon`](doubletapon.md)
