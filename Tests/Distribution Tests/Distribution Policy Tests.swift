import Distribution
import Foundation
import Testing

@Suite struct `Distribution policies preserve their stored meaning` {
    struct Fixture: Sendable {
        let value: Distribution
        let json: String
    }

    static let fixtures: [Fixture] = [
        Fixture(value: .fill, json: #"{"fill":{}}"#),
        Fixture(value: .spaceBetween, json: #"{"space":{"_0":{"between":{}}}}"#),
        Fixture(value: .spaceAround, json: #"{"space":{"_0":{"around":{}}}}"#),
        Fixture(value: .spaceEvenly, json: #"{"space":{"_0":{"evenly":{}}}}"#),
    ]

    @Test(arguments: fixtures)
    func `Persisted policies retain their choice and wire shape`(fixture: Fixture) throws {
        let data = Data(fixture.json.utf8)
        let value = try JSONDecoder().decode(Distribution.self, from: data)
        #expect(value == fixture.value)

        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        #expect(try encoder.encode(value) == data)
    }

    @Test
    func `The finite catalogue includes every persisted policy exactly once`() throws {
        let decoded = try Self.fixtures.map {
            try JSONDecoder().decode(Distribution.self, from: Data($0.json.utf8))
        }
        #expect(Distribution.allCases == decoded)
        #expect(Set(Distribution.allCases).count == decoded.count)
    }

    @Test(arguments: [
        #"{}"#,
        #"{"unknown":{}}"#,
        #"{"space":{}}"#,
        #"{"space":{"_0":{"unknown":{}}}}"#,
        #"{"fill":{},"space":{"_0":{"between":{}}}}"#,
        #"{"space":{"_0":{"between":{},"around":{}}}}"#,
    ])
    func `Absent unknown and conflicting choices are rejected`(json: String) {
        #expect(throws: DecodingError.self) {
            try JSONDecoder().decode(Distribution.self, from: Data(json.utf8))
        }
    }

    @Test(arguments: [
        (Distribution.Space.between, #"{"between":{}}"#),
        (Distribution.Space.around, #"{"around":{}}"#),
        (Distribution.Space.evenly, #"{"evenly":{}}"#),
    ])
    func `Standalone gap choices retain the same representation inside policies`(
        space: Distribution.Space,
        json: String
    ) throws {
        let data = Data(json.utf8)
        let decoder = JSONDecoder()
        #expect(try decoder.decode(Distribution.Space.self, from: data) == space)
        let policy = Data("{\"space\":{\"_0\":\(json)}}".utf8)
        #expect(try decoder.decode(Distribution.self, from: policy) == .space(space))
        #expect(try JSONEncoder().encode(space) == data)
    }
}
