// Copyright © Fleuronic LLC. All rights reserved.

public import struct Foundation.URL

import protocol AutoCodable.DecodableValue

struct Filled<T: LosslessStringConvertible>: DecodableValue {
	let contents: String
	
	public init(from decoder: any Decoder) throws {
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
