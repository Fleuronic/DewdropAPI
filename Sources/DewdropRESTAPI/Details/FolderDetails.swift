// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit

import struct Dewdrop.Folder
import protocol DewdropService.FolderFields

@dynamicMemberLookup
public struct FolderDetails: FolderFields {
	public let bookmarks: [RaindropImportFields]
	public let subfolders: [FolderDetails]
	
	private let folder: Folder
}

public extension FolderDetails {
	subscript<T>(dynamicMember keyPath: KeyPath<Folder, T>) -> T {
		folder[keyPath: keyPath]
	}
}

extension FolderDetails: Swift.Decodable {
	private enum CodingKeys: String, CodingKey {
		case bookmarks
		case subfolders = "folders"
	}

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
