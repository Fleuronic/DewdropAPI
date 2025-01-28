// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct DewdropRESTAPI.RaindropDetails
import struct DewdropRESTAPI.CollectionDetails
import struct DewdropRESTAPI.FilterOverviewFields
import struct DewdropRESTAPI.HighlightDetails
import struct DewdropRESTAPI.HighlightInRaindropDetails
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
import protocol Catenary.Fields

public struct API<
	RaindropFetchSpecifiedFields: RaindropFields & Fields,
	RaindropListSpecifiedFields: RaindropFields & Fields,
	RaindropSpecifiedFields: RaindropFields & Fields,
	CollectionSpecifiedFields: CollectionFields & Fields,
	FilterSpecifiedFields: FilterFields & Fields,
	HighlightSpecifiedFields: HighlightFields & Fields,
	HighlightInRaindropSpecifiedFields: HighlightFields & Fields,
	UserAuthenticatedSpecifiedFields: UserAuthenticatedFields & Fields,
	UserPublicSpecifiedFields: UserFields & Fields,
	UserUpdateSpecifiedFields: UserAuthenticatedFields & Fields,
	ImportSpecifiedFields: ImportFields & Fields,
	BackupSpecifiedFields: BackupFields & Fields
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
		Fields,
		Fields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingCollectionFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		Fields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingFilterFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		Fields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingHighlightFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		Fields,
		HighlightInRaindropSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingHighlightInRaindropFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		Fields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingUserAuthenticatedFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		Fields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingUserPublicFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		Fields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingUserUpdateFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		Fields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingImportFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		Fields,
		BackupSpecifiedFields
	> { .init(provider: provider) }

	func specifyingBackupFields<Fields>(_: Fields.Type) -> API<
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		UserPublicSpecifiedFields,
		UserUpdateSpecifiedFields,
		ImportSpecifiedFields,
		Fields
	> { .init(provider: provider) }
}

public extension API<
	RaindropDetails<User.IDFields, HighlightInRaindropDetails<User.IDFields>>,
	RaindropDetails<UserPublicDetails, HighlightInRaindropDetails<User.IDFields>>,
	RaindropDetails<UserPublicDetails, HighlightInRaindropDetails<UserPublicDetails>>,
	CollectionDetails,
	FilterOverviewFields,
	HighlightDetails,
	HighlightInRaindropDetails<UserPublicDetails>,
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
