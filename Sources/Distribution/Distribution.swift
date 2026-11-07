public enum Distribution: Sendable, Hashable {

    case fill

    case space(Space)
}

extension Distribution {

    @inlinable
    public static var spaceBetween: Self { .space(.between) }

    @inlinable
    public static var spaceAround: Self { .space(.around) }

    @inlinable
    public static var spaceEvenly: Self { .space(.evenly) }
}

#if !hasFeature(Embedded)
    extension Distribution: Swift::Codable {}
#endif

extension Distribution: Swift::CaseIterable {

    public static var allCases: [Distribution] {
        [.fill, .space(.between), .space(.around), .space(.evenly)]
    }
}
