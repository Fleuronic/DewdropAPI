// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Folder
import protocol DewdropService.FolderFields
import protocol Catenary.Fields

@dynamicMemberLookup
public struct FolderContentFields: FolderFields {
	public let bookmarks: [RaindropImportFields]
	public let subfolders: [FolderContentFields]
	
	private let folder: Folder
}

// MARK: -
public extension FolderContentFields {
	subscript<T>(dynamicMember keyPath: KeyPath<Folder, T>) -> T {
		folder[keyPath: keyPath]
	}
}

// MARK: -
extension FolderContentFields: Fields {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			bookmarks: container.decode(for: .bookmarks),
			subfolders: container.decode(for: .subfolders),
			folder: .init(from: decoder)
		)
	}
}

// MARK: -
private extension FolderContentFields {
	enum CodingKeys: String, CodingKey {
		case bookmarks
		case subfolders = "folders"
	}
}
