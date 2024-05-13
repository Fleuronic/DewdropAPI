// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.FileFormat

extension FileFormat: LosslessStringConvertible {
	public init?(_ description: String) {
		switch description {
		case "html": self = .html
		case "csv": self = .csv
		default: return nil
		}
	}

	public var description: String {
		switch self {
		case .html: "html"
		case .csv: "csv"
		}
	}
}
