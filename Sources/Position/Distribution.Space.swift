extension Distribution {

    public enum Space: Sendable, Hashable, CaseIterable {

        case between

        case around

        case evenly
    }
}

#if !hasFeature(Embedded)
    extension Distribution.Space: Codable {}
#endif
