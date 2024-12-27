// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.URL

import protocol AutoCodable.DecodableValue
import protocol AutoCodable.EncodableValue

struct Filled<T: LosslessStringConvertible> {
	let contents: String
}

extension Filled: DecodableValue {
	// MARK: Decodable
	init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		contents = try container.decode(String.self)
	}

	// MARK: DecodableValue
	func value() -> T? {
		contents.isEmpty ? nil : T(contents)
	}
}

extension Filled: EncodableValue {
	// MARK: Encodable
	func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(contents)
	}

	// MARK: EncodableValue
	init(from value: T?) {
		contents = value?.description ?? ""
	}
}

extension URL: Swift.LosslessStringConvertible {
	public init?(_ string: String) {
		self.init(string: string)
	}
}

public extension Swift.Collection {
	var filledValue: Self? {
		isEmpty ? nil : self
	}
}
