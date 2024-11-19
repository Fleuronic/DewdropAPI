// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct DewdropRESTAPI.RaindropDetails
import struct DewdropRESTAPI.RaindropHighlightDetails
import struct DewdropRESTAPI.CollectionDetails
import struct DewdropRESTAPI.FilterOverviewFields
import struct DewdropRESTAPI.HighlightDetails
import struct DewdropRESTAPI.UserAuthenticatedDetails
import struct DewdropRESTAPI.UserPublicDetails
import struct DewdropRESTAPI.ImportFolderFields
import struct DewdropRESTAPI.BackupDetails
import struct DewdropRESTAPI.RaindropEndpointsAPI
import struct DewdropRESTAPI.CollectionEndpointsAPI
import struct DewdropRESTAPI.TagEndpointsAPI
import struct DewdropRESTAPI.FilterEndpointsAPI
import struct DewdropRESTAPI.HighlightEndpointsAPI
import struct DewdropRESTAPI.UserEndpointsAPI
import struct DewdropRESTAPI.BackupEndpointsAPI
import struct DewdropRESTAPI.ImportEndpointsAPI
import struct Identity.Identifier
import class PapyrusCore.Provider
import protocol DewdropService.RaindropFields
import protocol DewdropService.CollectionFields
import protocol DewdropService.FilterFields
import protocol DewdropService.HighlightFields
import protocol DewdropService.UserFields
import protocol DewdropService.UserAuthenticatedFields
import protocol DewdropService.ImportFields
import protocol DewdropService.BackupFields
import protocol Catenary.API

public struct API<
	RaindropSpecifiedFields: RaindropFields & Decodable,
	RaindropCreationSpecifiedFields: RaindropFields & Decodable,
	RaindropHighlightSpecifiedFields: RaindropFields & Decodable,
	CollectionSpecifiedFields: CollectionFields & Decodable,
	FilterSpecifiedFields: FilterFields & Decodable,
	HighlightSpecifiedFields: HighlightFields & Decodable,
	UserAuthenticatedSpecifiedFields: UserAuthenticatedFields & Decodable,
	UserPublicSpecifiedFields: UserFields & Decodable,
	UserUpdateSpecifiedFields: UserFields & Decodable,
	ImportSpecifiedFields: ImportFields & Decodable,
	BackupSpecifiedFields: BackupFields & Decodable
>: @unchecked Sendable {
	let raindrops: RaindropEndpointsAPI
	let collections: CollectionEndpointsAPI
	let tags: TagEndpointsAPI
	let filters: FilterEndpointsAPI
	let highlights: HighlightEndpointsAPI
	let users: UserEndpointsAPI
	let backups: BackupEndpointsAPI
	let `import`: ImportEndpointsAPI

	private let provider: Provider
}

// MARK: -
public extension API {
	var error: Self.Error.Type { Error.self }

	func specifyingRaindropFields<Fields>(_: Fields.Type) -> API<
		Fields,
		RaindropCreationSpecifiedFields,
		RaindropHighlightSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingRaindropCreationFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		Fields,
		RaindropHighlightSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingRaindropHighlightFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropCreationSpecifiedFields,
		Fields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingCollectionFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropCreationSpecifiedFields,
		RaindropHighlightSpecifiedFields,
		Fields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingFilterFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropCreationSpecifiedFields,
		RaindropHighlightSpecifiedFields,
		CollectionSpecifiedFields,
		Fields,
		HighlightSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingHighlightFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropCreationSpecifiedFields,
		RaindropHighlightSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		Fields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingUserAuthenticatedFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropCreationSpecifiedFields,
		RaindropHighlightSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		Fields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingUserPublicFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropCreationSpecifiedFields,
		RaindropHighlightSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		Fields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingUserUpdateFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropCreationSpecifiedFields,
		RaindropHighlightSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		Fields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingImportFields<Fields>(_: Fields.Type) -> API< // TODO
		RaindropSpecifiedFields,
		RaindropCreationSpecifiedFields,
		RaindropHighlightSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		Fields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingBackupFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropCreationSpecifiedFields,
		RaindropHighlightSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		Fields
	> { .init(provider: provider) }
}

public extension API<
	RaindropDetails<UserPublicDetails>,
	RaindropDetails<User.IDFields>,
	RaindropHighlightDetails,
	CollectionDetails,
	FilterOverviewFields,
	HighlightDetails,
	UserAuthenticatedDetails,
	UserPublicDetails,
	UserAuthenticatedDetails,
	ImportFolderFields,
	BackupDetails
>{
	init(apiKey: String) {
		let url = "https://api.raindrop.io/rest/v1"
		let provider = Provider(baseURL: url).modifyRequests { request in
			request.addAuthorization(.bearer(apiKey))
		}.intercept { request, process in
			let response = try await process(request)
			if let error = response.apiError(validating: true) { throw error }
			return response
		}
		
		self.init(provider: provider)
	}
}

// MARK: -
extension API: Catenary.API {
	public typealias APIError = DewdropAPI.Error
}

// MARK: -
private extension API {
	init(provider: Provider) {
		self.provider = provider
		
		raindrops = .init(provider: provider)
		collections = .init(provider: provider)
		tags = .init(provider: provider)
		filters = .init(provider: provider)
		highlights = .init(provider: provider)
		users = .init(provider: provider)
		backups = .init(provider: provider)
		`import` = .init(provider: provider)
	}
}
