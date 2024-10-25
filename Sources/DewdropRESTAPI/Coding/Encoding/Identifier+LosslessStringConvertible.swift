// Copyright © Fleuronic LLC. All rights reserved.

public import struct Identity.Identifier

extension Identifier: Swift.LosslessStringConvertible where Value.RawIdentifier: LosslessStringConvertible {
	public init?(_ description: String) {
		if let rawValue = Value.RawIdentifier(description) {
			self.init(rawValue: rawValue)
		} else {
			return nil
		}
	}
}
