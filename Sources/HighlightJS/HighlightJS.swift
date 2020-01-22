import JavaScriptCore

public class HighlightJS {
    let highlightJS: JSValue
    let jsContext = JSContext()!

    public init() {
        let window = JSValue(newObjectIn: jsContext)
        jsContext.setObject(window, forKeyedSubscript: "window" as NSString)
        jsContext.evaluateScript(highlightPackJSSourceCode)

        // Set the root variable hljs to the same as window.hljs
        jsContext.setObject(window?.objectForKeyedSubscript("hljs"),
                            forKeyedSubscript: "hljs" as NSString)

        highlightJS = window!.objectForKeyedSubscript("hljs")!
    }

    public func highlight(
        _ code: String,
        as languageName: String
    ) -> HighlightResult {
        let jsValue = highlightJS.objectForKeyedSubscript("highlight")!
            .call(withArguments: [languageName, code])!

        do {
            return try HighlightResult(fromJSValue: jsValue)
        } catch {
            switch error {
            case HighlightResult.Error.missingLanguage:
                return HighlightResult(language: "undefined", value: code)
            default:
                fatalError("Unhandled error \(error.localizedDescription)")
            }
        }
    }
}

public struct HighlightResult {
    enum Error: Swift.Error {
        case missingRequiredProperties
        case missingLanguage
    }

    /// Detected language.
    public let language: String

    /// HTML string with highlighting markup
    public let value: String

    init(fromJSValue jsValue: JSValue) throws {
        guard let language = jsValue.objectForKeyedSubscript("language"),
            let value = jsValue.objectForKeyedSubscript("value") else {
            throw Self.Error.missingRequiredProperties
        }

        if language.toString() == "undefined", value.toString() == "undefined" {
            throw Self.Error.missingLanguage
        }

        self.language = language.toString()
        self.value = value.toString()!.trimmingCharacters(in: .newlines)
    }

    init(language: String, value: String) {
        self.language = language
        self.value = value
    }
}
