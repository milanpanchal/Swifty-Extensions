import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Swifty_ExtensionsTests.allTests),
    ]
}
#endif
