if ProcessInfo.processInfo.arguments.contains("isFooEnabled") {
    // Do something with isFooEnabled
}

// By default all the values received here would be string
let standardDefaultsDict = UserDefaults.standard.dictionaryRepresentation()
let foo = (standardDefaultsDict["foo"] as? String) ?? "defaultValue"