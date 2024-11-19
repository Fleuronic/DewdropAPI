// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct Dewdrop.Collection
import struct Dewdrop.Group
import struct Dewdrop.Tag
import struct Dewdrop.Filter
import struct Dewdrop.Highlight
import struct Dewdrop.Backup
import struct Dewdrop.User
import struct DewdropService.IdentifiedRaindrop
import struct DewdropService.IdentifiedCollection
import struct DewdropService.IdentifiedGroup
import struct DewdropService.IdentifiedTag
import struct DewdropService.IdentifiedFilter
import struct DewdropService.IdentifiedHighlight
import struct DewdropService.IdentifiedBackup
import struct DewdropService.IdentifiedUser
import struct Catena.IDFields
import struct Identity.Identifier
import protocol Catenary.Fields
import protocol DewdropService.RaindropFields
import protocol DewdropService.CollectionFields
import protocol DewdropService.GroupFields
import protocol DewdropService.TagFields
import protocol DewdropService.FilterFields
import protocol DewdropService.HighlightFields
import protocol DewdropService.BackupFields
import protocol DewdropService.UserFields
import protocol DewdropService.UserAuthenticatedFields

extension IDFields: Swift.Decodable where Model.ID: Decodable {
	public enum CodingKeys: String, CodingKey {
		case id = "_id"
	}

	private enum TopLevelCodingKeys: String, CodingKey {
		case id = "$id"
	}

	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		do {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			try self.init(id: container.decode(for: .id))
		} catch {
			do {
				let container = try decoder.container(keyedBy: TopLevelCodingKeys.self)
				try self.init(id: container.decode(for: .id))
			} catch {
				let container = try decoder.singleValueContainer()
				try self.init(id: container.decode())
			}
		}
	}
}

// MARK: -
extension IDFields: DewdropService.RaindropFields where Model == Raindrop.Identified {}
extension IDFields: DewdropService.CollectionFields where Model == Collection.Identified {}
extension IDFields: DewdropService.GroupFields where Model == Group.Identified {}
extension IDFields: DewdropService.TagFields where Model == Tag.Identified {}
extension IDFields: DewdropService.FilterFields where Model == Filter.Identified {}
extension IDFields: DewdropService.HighlightFields where Model == Highlight.Identified {}
extension IDFields: DewdropService.BackupFields where Model == Backup.Identified {}
extension IDFields: DewdropService.UserFields where Model == User.Identified {}
extension IDFields: DewdropService.UserAuthenticatedFields where Model == User.Identified {}
