import AutoCodable

import struct Dewdrop.Media

@AutoDecodable(accessControl: .public, container: .singleValueForEnum)
extension Media.MediaType: Swift.Codable {
	private enum CodingKeys: String, CodingKey {
		case image
	}
}
