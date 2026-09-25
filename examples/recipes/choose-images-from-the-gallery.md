---
description: Select images from the device gallery in automated tests using addMedia.
---

# Choose images from the gallery

* use case
  * | mobile apps, 
    * upload an image 
    * update a profile picture 

* COMPLEXITY
  * "Media Picker"
    * != part of your app ->
      * ❌you can NOT rely on | your app's internal IDs❌
      * you need to target the OS' native elements
        * steps
          * PREVIOUS to the flow, use the [`addMedia`](../../api-reference/commands-available/addmedia.md) command
          * | your app, trigger the image picker
          * OPTIONAL taps / target known system IDs / EACH OS versions
          * TILL match is found, fall back 
    * depend on 
      * OS
      * specific version
    * -> use Maestro's [`addMedia` command](../../api-reference/commands-available/addmedia.md)
