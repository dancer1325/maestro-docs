---
description: Repeat a block of commands a specified number of times.
---

# repeat

* `repeat` command
  * executes a sequence of commands >1 times 
    * a fixed number of iterations, OR
    * TILL specific condition is met
  * use cases
    * increase the value of a counter

### Parameters

| Parameter  | Type      | Description                                       |
| ---------- | --------- |---------------------------------------------------|
| `times`    | integer   | == number of times -- to -- repeat the `commands` |
| `while`    | condition | == condition / TILL it's true -> repeat           |
| `commands` | list      | == commands to execute / EACH iteration           |

TODO:

### Usage examples

#### Repeat using a JavaScript expression

The `while` parameter also accepts a JavaScript expression
The loop continues as long as the expression evaluates to `true`.

```yaml
- evalScript: ${output.counter = 0}
- repeat:
    while:
      true: ${output.counter < 3}
    commands:
      - tapOn: Button
      - evalScript: ${output.counter = output.counter + 1}
```

#### Repeat with a maximum count and a condition

You can combine `times` and `while` to repeat commands until a condition is met, but for no more than a specified number of iterations. The loop stops when either the `while` condition becomes `false` or the `times` count is reached, whichever occurs first.

The following example taps a button while an element is not visible, but stops after 10 attempts regardless of the element's visibility.

```yaml
- repeat:
    times: 10
    while:
      notVisible: "someElement"
    commands:
      - tapOn: Button
```

Here’s another example that logs `"Hello World"` four times. The `times: 4` limit ensures the loop stops even if the condition never becomes false. For example, if the counter were never incremented.

```yaml
- evalScript: ${output.counter = 1}
- repeat:
    times: 4
    while:
      true: ${output.counter < 10}
    commands:
      - evalScript: ${console.log("Hello World")}
      - evalScript: ${output.counter++}
```

{% hint style="success" %}
Use the `--verbose` flag to see the effect of the `repeat` command more effectively when using [Maestro CLI overview](../../maestro-cli/README.md "mention").
{% endhint %}
