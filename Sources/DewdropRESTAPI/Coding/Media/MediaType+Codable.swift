import AutoCodable

import struct Dewdrop.Media

//@AutoDecodable(accessControl: .public, container: .singleValueForEnum)
extension Media.MediaType: Codable {
	private enum CodingKeys: String, CodingKey {
		case image
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		let stringValue = try container.decode(String.self)
		switch stringValue {
		case CodingKeys.image.rawValue:
			self = .image
		default:
			throw DecodingError.dataCorruptedError(
				in: container,
				debugDescription: "Invalid value: \(stringValue)"
			)
		}
	}
}
