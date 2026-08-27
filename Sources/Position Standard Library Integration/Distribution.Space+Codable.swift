public import Position

#if !hasFeature(Embedded)

    extension Distribution.Space: Codable {

        public init(from decoder: any Decoder) throws {
            switch try CodableRepresentation(from: decoder) {
            case .between:
                self = .between
            case .around:
                self = .around
            case .evenly:
                self = .evenly
            }
        }

        public func encode(to encoder: any Encoder) throws {
            try CodableRepresentation(self).encode(to: encoder)
        }
    }

    private enum CodableRepresentation: Codable {
        case between
        case around
        case evenly

        init(_ space: Distribution.Space) {
            switch space {
            case .between:
                self = .between
            case .around:
                self = .around
            case .evenly:
                self = .evenly
            }
        }
    }

#endif
