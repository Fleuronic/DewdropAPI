import struct Dewdrop.Raindrop

extension Raindrop: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self.init(
			url: .init(string: try container.decode(String.self, forKey: .url))!,
			title: try container.decode(String.self, forKey: .title),
			excerpt: try container.decode(String.self, forKey: .excerpt),
			domain: try container.decode(String.self, forKey: .domain),
			coverURL: .init(string: try container.decode(String.self, forKey: .coverURL))!,
			note: try container.decode(String.self, forKey: .note),
			tags: try container.decode([String].self, forKey: .tags),
			isFavorite: try container.decode(Bool.self, forKey: .isFavorite),
			isBroken: try container.decode(Bool.self, forKey: .isBroken),
			creationDate: .init(),
			updateDate: .init()
		)
	}
}

// MARK -
private extension Raindrop {
	enum CodingKeys: String, CodingKey {
		case url = "link"
		case title
		// case itemType = "type"
		case excerpt
		case domain
		case coverURL = "cover"
		case note
		case tags
		// case cache
		case isFavorite = "important"
		case isBroken = "broken"
		case creationDate = "created"
		case updateDate = "lastUpdate"
	}
}
