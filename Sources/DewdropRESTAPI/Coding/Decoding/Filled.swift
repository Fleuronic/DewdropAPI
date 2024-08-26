// Copyright © Fleuronic LLC. All rights reserved.

import protocol AutoCodable.DecodableValue
import struct Foundation.URL

struct Filled<T: LosslessStringConvertible>: DecodableValue {
	let contents: String
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		contents = try container.decode(String.self)
	}
	
	func value() -> T? {
		contents.isEmpty ? nil : T(contents)
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
