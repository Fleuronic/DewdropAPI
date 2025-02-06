// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit

import struct Dewdrop.Tag
import struct Dewdrop.User
import struct Dewdrop.Collaborator
import struct Dewdrop.Backup
import protocol Catena.Valued
import protocol Catenary.Details
import protocol Identity.Identifiable
import protocol DewdropService.TagFields
import protocol DewdropService.UserFields
import protocol DewdropService.CollaboratorFields
import protocol DewdropService.BackupFields

@dynamicMemberLookup
@_UncheckedMemberwiseInit(.public)
public struct ModelDetails<IdentifiedModel: Identifiable & Valued> where IdentifiedModel.ID: Decodable & Sendable, IdentifiedModel.Value: Decodable & Sendable {
	public typealias Model = IdentifiedModel.Value

	public let id: IdentifiedModel.ID

	private let model: Model
}

// MARK: -
public extension ModelDetails {
	subscript<T>(dynamicMember keyPath: KeyPath<Model, T>) -> T {
		model[keyPath: keyPath]
	}
}

// MARK: -
extension ModelDetails: Details {
	// MARK: Valued
	public typealias Value = Model

	// MARK: Representable
	public typealias IdentifiedValue = IdentifiedModel

	public var value: Value { model }

	// MARK: Decodable
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

// MARK: -
private extension ModelDetails {
	enum CodingKeys: String, CodingKey {
		case id = "_id"
	}
}
