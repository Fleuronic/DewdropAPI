// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit

import struct Dewdrop.Tag
import struct Dewdrop.User
import struct Dewdrop.Collaborator
import struct Dewdrop.Backup
import protocol Catena.Valued
import protocol Catenary.Fields
import protocol Catenary.Details
import protocol Identity.Identifiable
import protocol DewdropService.TagFields
import protocol DewdropService.UserFields
import protocol DewdropService.CollaboratorFields
import protocol DewdropService.BackupFields

@dynamicMemberLookup
@_UncheckedMemberwiseInit(.public)
public struct ModelDetails<Model: Sendable, IdentifiedModel: Identifiable> where IdentifiedModel.ID: Sendable {
	public let id: IdentifiedModel.ID

	private let model: Model
}

// MARK: -
public extension ModelDetails {
	subscript<T>(dynamicMember keyPath: KeyPath<Model, T>) -> T {
		model[keyPath: keyPath]
	}
}

extension ModelDetails: Details {
	// MARK: Valued
	public typealias Value = Model

	// MARK: Representable
	public typealias IdentifiedValue = IdentifiedModel

	public var value: Value { model }
}

// MARK: -
extension ModelDetails: Swift.Decodable where Model: Decodable, IdentifiedModel.ID: Decodable {
	private enum CodingKeys: String, CodingKey {
		case id = "_id"
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		try self.init(
			id: container.decode(for: .id),
			model: .init(from: decoder)
		)
	}
}

extension ModelDetails: BackupFields where Model == Backup {}
extension ModelDetails: TagFields where Model == Tag {}
extension ModelDetails: CollaboratorFields where Model == Collaborator {}
extension ModelDetails: UserFields where Model == User {}
