# Themeable

[![Build Status](https://img.shields.io/travis/divadretlaw/Themeable.svg?style=flat-square)](https://travis-ci.org/divadretlaw/Themeable) [![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage) [![Swift](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat-square)](https://swift.org)
[![License](https://img.shields.io/github/license/divadretlaw/Themeable.svg?style=flat-square)](LICENSE)

## Usage

Load your colors into `Theme.shared` using `ThemeColors` which conforms to `Codeable`, so you can load a JSON file from your Bundle (e.g. `mytheme.json`)

```swift
let myThemeColors = ThemeColors.load(bundle: "mytheme")
```

or any from any URL

```swift
let myThemeColors = ThemeColors.load(url: URL(string: "https://example.com/mytheme.json")!)
```

and apply the Theme using (if `force` is `true` it will also reload the current view=

```swift
Theme.shared.apply(force: true)
```

### Example

Load your Theme `mytheme.json` at the start of the app.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    Theme.shared.colors = ThemeColors.from(bundle: "mytheme")
    Theme.shared.apply(force: true)
    return true
}
```

### Advanced

If your app is using [Eureka](https://github.com/xmartlabs/Eureka) you can enable support for it with `Theme.shared.eureka = true`

If you want to customize the colors (for example a user customizable global tint color) before applying the theme you can do so in 

```swift
Theme.shared.customColor {
	// Load custom Colors, e.g.
	Theme.shared.tint = ... // Load user tint 
}
```

You can also add your custom apperance setters here

```swift
Theme.shared.customAppearances {
	// Load custom appearances, e.g.
	UIButton.appearance(whenContainedInInstancesOf [MyViewController.self]).backgroundColor = .green
}
```

## Installation

Themeable is available through [Carthage](https://github.com/Carthage/Carthage). To install just write into your Cartfile:
 
```
github "divadretlaw/Themeable"
```

## License

See [LICENSE](LICENSE)
