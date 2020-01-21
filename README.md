# HighlightJSPublishPlugin

A [highlight.js](https://highlightjs.org) plugin for [Publish](https://github.com/johnsundell/publish) to highlight code.

highlight.js is a syntax highlighting tool made in javascript that supports many languages.

## Requirements

- Swift 5
- [JavaScriptCore](https://developer.apple.com/documentation/javascriptcore) that comes with Swift on macOS, iOS and tvOS (so this may not work on linux)
- highlight.js color scheme in your .css file

## Installation

Add HighlightJSPublishPlugin to your package.

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/alex-ross/HighlightJSPublishPlugin", from: "1.0.0")
    ],
    targets: [
        .target(
            ...
            dependencies: [
                ...
                "HighlightJSPublishPlugin"
            ]
        )
    ]
    ...
)
```

## Usage

1. Add `.highlightJS()` to your pipeline.
```swift
import HighlightJSPublishPlugin
...
try MyWebsite().publish(using: [
    .installPlugin(.highlightJS()),
    ...
    .addMarkdownFiles(),
    ...
])
```
2. Add a highlight.js color scheme in your css file. You can find many on internet and in their repository [here](https://github.com/highlightjs/highlight.js/tree/master/src/styles). I also include an example in the bottom of this readme that you could use if you would like to get different color scheme if the user is using dark mode or not.
3. Write highlighted codes!

In your markdown file, specify language after \`\`\` to get correct highlight.
````markdown
```swift
let str = "This is Swift code."
print(str)
```
````

Specify code as `python`
````markdown
```python
str = "This is also Swift code."
print(str)
```
````

If no language is specified, no syntax will be used as default.
````markdown
```
let str = "This is also Swift code."
print(str)
```
````

## Note

This plugin will highlight all code block but not inline codes.

Enjoy your highlighted sites!

## Acknowledgement

Thanks to John Sundell (@johnsundell) for creating [Publish](https://github.com/johnsundell/publish) and SplashPublishPlugin.

Thanks to Zhijin Chen (@Ze0nC) for creating the [SwiftPygmentsPublishPlugin](https://github.com/Ze0nC/SwiftPygmentsPublishPlugin) that has been a inspiration for this plugin.

## License

MIT License
