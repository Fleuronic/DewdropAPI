// Copyright © Fleuronic LLC. All rights reserved.

import enum Dewdrop.Import
import enum Catenary.Undocumented
import protocol DewdropService.ImportFields

public struct ImportFolderCountFields {
	public let folders: [FolderDetails]

	private let undocumentedCount: Undocumented<Import.Count>
}

// MARK: -
public extension ImportFolderCountFields {
	var count: Import.Count {
		undocumentedCount.precheckedValue
	}
}

// MARK: -
extension ImportFolderCountFields: ImportFields {
	// MARK: Fields
	public var undocumentedFields: [PartialKeyPath<Self>: Bool] {
		[
			\.count: undocumentedCount.isMissing
		]
	}
}

// MARK: -
extension ImportFolderCountFields: Decodable {
	private enum CodingKeys: String, CodingKey {
		case folders = "items"
		case count
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		try self.init(
			folders: container.decode(for: .folders),
			undocumentedCount: container.decodeIfPresent(for: .count).undocumented
		)
	}
}
