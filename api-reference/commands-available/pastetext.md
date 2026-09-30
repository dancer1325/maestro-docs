---
description: Paste text from clipboard into the currently focused input field.
---

# pasteText

* `pasteText` command
  * pastes text FROM the clipboard -- into -- the CURRENTLY focused UI element
  * requirements
    * ⚠️text field is | focus⚠️
      * == [`copyTextFrom` ](copytextfrom.md)

#### System vs. internal clipboard

* Maestro's types of clipboards
  * **Internal clipboard**
    * TODO: Stores text captured by Maestro commands, such as `copyTextFrom`, or values manually assigned to `maestro.copiedText`.
  * **System clipboard**
    * The native operating system clipboard used when interacting with in-app actions like a **Copy to Clipboard** button.

The `pasteText` command interacts **exclusively** with Maestro’s internal clipboard
* It does not read from or write to the system clipboard.

As a result, if you tap a button in your app that copies content to the system clipboard, `pasteText` will not paste that content
* It will only paste text that was previously captured using `copyTextFrom` or explicitly assigned to `maestro.copiedText`.

### Syntax

```yaml
# NO require
#   arguments
- pasteText
```

### Related commands

* [copytextfrom.md](copytextfrom.md "mention")
