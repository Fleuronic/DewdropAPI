
import struct Identity.Identifier
import struct DewdropService.IDFields

extension IDFields: Decodable where Model.ID: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		self = .init(id: try container.decode(Model.ID.self, forKey: .id))
	}
}

private extension IDFields {
	enum CodingKeys: String, CodingKey {
		case id = "$id"
	}
}

