import Position

extension Distribution.Space: CaseIterable {

    public static let allCases: [Distribution.Space] = [.between, .around, .evenly]
}
