import struct Dewdrop.Raindrop

extension Raindrop: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		fatalError()
	}
}

// MARK -
private extension Raindrop {
	enum CodingKeys: String, CodingKey {
		case domain
	}
}
