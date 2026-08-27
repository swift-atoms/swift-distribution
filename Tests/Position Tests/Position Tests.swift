import Position
import Position_Standard_Library_Integration
import Testing

@Suite
struct `Position Tests` {

    @Test
    func `convenience distributions`() {
        #expect(Distribution.spaceBetween == .space(.between))
        #expect(Distribution.spaceAround == .space(.around))
        #expect(Distribution.spaceEvenly == .space(.evenly))
    }

    @Test
    func `all distribution cases`() {
        #expect(
            Distribution.allCases == [
                .fill,
                .space(.between),
                .space(.around),
                .space(.evenly),
            ]
        )
        #expect(Distribution.Space.allCases == [.between, .around, .evenly])
    }

    @Test
    func `standard library conformances`() {
        requireCodable(Distribution.self)
        requireCodable(Distribution.Space.self)
    }
}

private func requireCodable<Value: Codable>(_: Value.Type) {}
