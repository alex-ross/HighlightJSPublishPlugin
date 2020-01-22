@testable import HighlightJS
import XCTest

final class HighlightJSTests: XCTestCase {
    func testHighlight_whenLanguageIsRuby() {
        let syntaxHighlighet = HighlightJS()
        let code = #"""
        class Person
          attr_reader :name
        end
        """#

        let result = syntaxHighlighet.highlight(code, as: "ruby")

        XCTAssertEqual(result.language, "ruby")
        XCTAssertEqual(result.value, #"""
        <span class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">Person</span></span>
          <span class="hljs-keyword">attr_reader</span> <span class="hljs-symbol">:name</span>
        <span class="hljs-keyword">end</span>
        """#)
    }

    func testHighlight_whenLanguageIsSwift() {
        let syntaxHighlighet = HighlightJS()
        let code = #"""
        class Foobar {
            var foo: Bar = .init(foooo: "asd")
        }
        """#

        let result = syntaxHighlighet.highlight(code, as: "swift")

        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.value, #"""
        <span class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">Foobar</span> </span>{
            <span class="hljs-keyword">var</span> foo: <span class="hljs-type">Bar</span> = .<span class="hljs-keyword">init</span>(foooo: <span class="hljs-string">"asd"</span>)
        }
        """#)
    }

    func testHighlight_whenLanguageIsUndefined() {
        let syntaxHighlighet = HighlightJS()
        let code = #"""
        class Foobar {
            var foo: Bar = .init(foooo: "asd")
        }
        """#

        let result = syntaxHighlighet.highlight(code, as: "not_a_language")

        XCTAssertEqual(result.language, "undefined")
        XCTAssertEqual(result.value, #"""
        class Foobar {
            var foo: Bar = .init(foooo: "asd")
        }
        """#)
    }

    static var allTests = [
        ("testHighlight_whenLanguageIsRuby", testHighlight_whenLanguageIsRuby),
        ("testHighlight_whenLanguageIsSwift", testHighlight_whenLanguageIsSwift),
        ("testHighlight_whenLanguageIsUndefined", testHighlight_whenLanguageIsUndefined),
    ]
}
