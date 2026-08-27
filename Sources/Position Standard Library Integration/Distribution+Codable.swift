public import Position

#if !hasFeature(Embedded)

    extension Distribution: Codable {

        public init(from decoder: any Decoder) throws {
            switch try CodableRepresentation(from: decoder) {
            case .fill:
                self = .fill
            case .space(let space):
                self = .space(space)
            }
        }

        public func encode(to encoder: any Encoder) throws {
            try CodableRepresentation(self).encode(to: encoder)
        }
    }

    private enum CodableRepresentation: Codable {
        case fill
        case space(Distribution.Space)

        init(_ distribution: Distribution) {
            switch distribution {
            case .fill:
                self = .fill
            case .space(let space):
                self = .space(space)
            }
        }
    }

#endif
