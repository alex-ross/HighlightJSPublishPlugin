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
        .package(name: "HighlightJSPublishPlugin", url: "https://github.com/alex-ross/highlightjspublishplugin", from: "1.0.0")
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

## CSS example

```css
/**
 * MARK: Highlight JS
 */

/*

 Atom One Light by Daniel Gamage
 Original One Light Syntax theme from https://github.com/atom/one-light-syntax

 base:    #fafafa
 mono-1:  #383a42
 mono-2:  #686b77
 mono-3:  #a0a1a7
 hue-1:   #0184bb
 hue-2:   #4078f2
 hue-3:   #a626a4
 hue-4:   #50a14f
 hue-5:   #e45649
 hue-5-2: #c91243
 hue-6:   #986801
 hue-6-2: #c18401

 */

.hljs {
    display: block;
    overflow-x: auto;
    padding: 0.5em;
    color: #383a42;
    background: #fafafa;
}

.hljs-comment,
.hljs-quote {
    color: #a0a1a7;
    font-style: italic;
}

.hljs-doctag,
.hljs-keyword,
.hljs-formula {
    color: #a626a4;
}

.hljs-section,
.hljs-name,
.hljs-selector-tag,
.hljs-deletion,
.hljs-subst {
    color: #e45649;
}

.hljs-literal {
    color: #0184bb;
}

.hljs-string,
.hljs-regexp,
.hljs-addition,
.hljs-attribute,
.hljs-meta-string {
    color: #50a14f;
}

.hljs-built_in,
.hljs-class .hljs-title {
    color: #c18401;
}

.hljs-attr,
.hljs-variable,
.hljs-template-variable,
.hljs-type,
.hljs-selector-class,
.hljs-selector-attr,
.hljs-selector-pseudo,
.hljs-number {
    color: #986801;
}

.hljs-symbol,
.hljs-bullet,
.hljs-link,
.hljs-meta,
.hljs-selector-id,
.hljs-title {
    color: #4078f2;
}

.hljs-emphasis {
    font-style: italic;
}

.hljs-strong {
    font-weight: bold;
}

.hljs-link {
    text-decoration: underline;
}

@media (prefers-color-scheme: dark) {
    /*

     Atom One Dark by Daniel Gamage
     Original One Dark Syntax theme from https://github.com/atom/one-dark-syntax

     base:    #282c34
     mono-1:  #abb2bf
     mono-2:  #818896
     mono-3:  #5c6370
     hue-1:   #56b6c2
     hue-2:   #61aeee
     hue-3:   #c678dd
     hue-4:   #98c379
     hue-5:   #e06c75
     hue-5-2: #be5046
     hue-6:   #d19a66
     hue-6-2: #e6c07b

     */

    .hljs {
        display: block;
        overflow-x: auto;
        padding: 0.5em;
        color: #abb2bf;
        background: #282c34;
    }

    .hljs-comment,
    .hljs-quote {
        color: #5c6370;
        font-style: italic;
    }

    .hljs-doctag,
    .hljs-keyword,
    .hljs-formula {
        color: #c678dd;
    }

    .hljs-section,
    .hljs-name,
    .hljs-selector-tag,
    .hljs-deletion,
    .hljs-subst {
        color: #e06c75;
    }

    .hljs-literal {
        color: #56b6c2;
    }

    .hljs-string,
    .hljs-regexp,
    .hljs-addition,
    .hljs-attribute,
    .hljs-meta-string {
        color: #98c379;
    }

    .hljs-built_in,
    .hljs-class .hljs-title {
        color: #e6c07b;
    }

    .hljs-attr,
    .hljs-variable,
    .hljs-template-variable,
    .hljs-type,
    .hljs-selector-class,
    .hljs-selector-attr,
    .hljs-selector-pseudo,
    .hljs-number {
        color: #d19a66;
    }

    .hljs-symbol,
    .hljs-bullet,
    .hljs-link,
    .hljs-meta,
    .hljs-selector-id,
    .hljs-title {
        color: #61aeee;
    }

    .hljs-emphasis {
        font-style: italic;
    }

    .hljs-strong {
        font-weight: bold;
    }

    .hljs-link {
        text-decoration: underline;
    }
}
```
