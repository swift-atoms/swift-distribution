public import Position

extension Distribution: CaseIterable {

    public static var allCases: [Distribution] {
        [.fill, .space(.between), .space(.around), .space(.evenly)]
    }
}
